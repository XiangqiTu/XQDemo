//
//  ChatMessageCoreDataStorage.m
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import "ChatMessageCoreDataStorage.h"
#import "XMPPCoreDataStorageProtected.h"
#import "NSObject+transformStringValue.h"

static ChatMessageCoreDataStorage *__sharedInstance = nil;


@interface ChatMessageCoreDataStorage ()

@property (nonatomic, strong) NSString *chatContentMessageEntityName;

@end

@implementation ChatMessageCoreDataStorage

+ (ChatMessageCoreDataStorage *)sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		__sharedInstance = [[ChatMessageCoreDataStorage alloc] initWithDatabaseFilename:nil storeOptions:nil];
        __sharedInstance.chatContentMessageEntityName = kChatContentMessageEntity;
	});
	
	return __sharedInstance;
}

- (NSManagedObjectContext *)mainThreadManagedObjectContext
{
    return [super mainThreadManagedObjectContext];
}

- (NSEntityDescription *)coreDataChatContentMessageEntity:(NSManagedObjectContext *)moc
{
	return [NSEntityDescription entityForName:[self coreDataChatContentMessageEntityName] inManagedObjectContext:moc];
}

- (NSString *)coreDataChatContentMessageEntityName
{
	__block NSString *result = nil;
	
	dispatch_block_t block = ^{
		result = self.chatContentMessageEntityName;
	};
	
	if (dispatch_get_specific(storageQueueTag))
		block();
	else
		dispatch_sync(storageQueue, block);
	
	return result;
}

- (void)saveContext
{
    NSManagedObjectContext *moc = [self mainThreadManagedObjectContext];
    NSError *error = nil;
    if (![moc save:&error])
    {
        [moc rollback];
    }
}

#pragma mark - Fetch Method

- (NSArray *)fetchEntityName:(NSString *)entityName
                    criteria:(NSString *)criteria
                   variables:(NSDictionary *)variables
                      sortBy:(NSString *)sortKeys
                   ascending:(BOOL)isAscending
{
    return [self fetchEntityName:entityName
                        criteria:criteria
                       variables:variables
                          sortBy:sortKeys
                       ascending:isAscending
                     fetchOffset:0
                      fetchLimit:0
              propertiesToReturn:nil
                        distinct:NO
                           error:nil];
}

- (NSArray *)fetchEntityName:(NSString *)entityName
                    criteria:(NSString *)criteria
                   variables:(NSDictionary *)variables
                      sortBy:(NSString *)sortKeys
                   ascending:(BOOL)isAscending
                 fetchOffset:(NSInteger)offset
                  fetchLimit:(NSInteger)limit
          propertiesToReturn:(NSArray*)properties
                    distinct:(BOOL)isDistinct
                       error:(NSError **)error
{
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    if (managedObjectContext == nil) {
        return nil;
    }
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entityName inManagedObjectContext:managedObjectContext]];
    
    if (criteria && [criteria length]>0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:criteria];
        if (variables && [variables count]>0) {
            predicate = [predicate predicateWithSubstitutionVariables:variables];
        }
        
        [fetchRequest setPredicate:predicate];
        
    }
    
    if (sortKeys && [sortKeys length]>0) {
        NSArray *keys = [sortKeys componentsSeparatedByString:@","];
        if (keys && [keys count]>0) {
            NSMutableArray *sortDescriptorArray = [NSMutableArray arrayWithCapacity:2];
            for (int i = 0; i<[keys count]; i++) {
                NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:[keys objectAtIndex:i] ascending:isAscending];
                [sortDescriptorArray addObject:sortDescriptor];
            }
            [fetchRequest setSortDescriptors:sortDescriptorArray];
        }
    }
    
    // 0 表示 没有限制
    [fetchRequest setFetchLimit:limit];
    // 0 表示 没有偏移量
    [fetchRequest setFetchOffset:offset];
    
    //默认返回数据属性设置
    [fetchRequest setResultType:NSManagedObjectResultType];
    
    if (properties && [properties count]>0) {
        [fetchRequest setPropertiesToFetch:properties];
        [fetchRequest setPropertiesToGroupBy:properties];
        [fetchRequest setResultType:NSDictionaryResultType];
    }
    
    [fetchRequest setReturnsDistinctResults:isDistinct];
    
    return [managedObjectContext executeFetchRequest:fetchRequest error:error];
}

#pragma mark - ChatContentMessage

- (void)addNewChatContentMessageFromDictionaryArray:(NSArray *)sourceArray
{
    [self executeBlock:^{
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        
        NSString *currentId = @"2";
        
        for (NSDictionary *message in sourceArray) {
            NSString *fromId = [[message objectForKey:@"from_user_uuid"] transformStringValue];
            NSString *toId = [[message objectForKey:@"to_user_uuid"] transformStringValue];
            
            NSString *friendId = nil;
            BOOL isSendOut = NO;
            
            if (fromId) {
                if (![currentId isEqualToString:fromId] && ![currentId isEqualToString:toId]) {
                    continue;
                }
                
                if ([currentId isEqualToString:fromId]) {
                    friendId = fromId;
                    isSendOut = NO;
                } else {
                    friendId = toId;
                    isSendOut = YES;
                }
            } else {
                friendId = toId;
                isSendOut = YES;
            }
            
            long long timestamp = [[message objectForKey:@"date_time"] longLongValue];
            NSString *creatTimestamp = [NSString stringWithFormat:@"%lld",timestamp/1000];
            NSString *msgId = [[message objectForKey:@"message_uuid"] transformStringValue];
            NSNumber *msgStatus = [NSNumber numberWithInt:E_ChatContentMessageStatus_Sended];
            NSString *msgBody = [[message objectForKey:@"message"] transformStringValue];
            
            NSString *criteria = [NSString stringWithFormat:@"SELF.clientId== $clientId && SELF.msgId == $msgId"];
            NSArray *result = [self fetchEntityName:[self coreDataChatContentMessageEntityName]
                                           criteria:criteria
                                          variables:@{@"clientId": currentId, @"msgId": msgId}
                                             sortBy:nil
                                          ascending:YES];
            if ([result count]) {
                //update
                ChatContentMessageEntity *entity = [result objectAtIndex:0];
                entity.creatTimestamp = creatTimestamp;
                entity.msgStatus = msgStatus;
                
            } else {
                //new
                ChatContentMessageEntity *entity =(ChatContentMessageEntity *)[[NSManagedObject alloc] initWithEntity:[self coreDataChatContentMessageEntity:managedObjectContext]
                                                                                       insertIntoManagedObjectContext:nil];
                entity.friendId = friendId;
                entity.body = msgBody;
                entity.creatTimestamp = creatTimestamp;
                entity.from = fromId;
                entity.to = toId;
                entity.isSendOut = [NSNumber numberWithBool:isSendOut];
                entity.msgId = msgId;
                
                entity.msgStatus = msgStatus;
                entity.clientId = currentId;
                
                [managedObjectContext insertObject:entity];
            }
        }
    }];
}

- (void)addNewChatContentMessage:(ChatContentMessageEntity *)entity
{
    [self scheduleBlock:^{
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        
        NSString *currentId = @"2";
        
        NSString *fromId = entity.from;
        NSString *toId = entity.to;
        
        NSString *friendId = nil;
        BOOL isSendOut = NO;
        
        if (fromId) {
            if (![currentId isEqualToString:fromId] || ![currentId isEqualToString:toId]) {
                return;
            }
            
            if ([currentId isEqualToString:fromId]) {
                friendId = fromId;
                isSendOut = NO;
            } else {
                friendId = toId;
                isSendOut = YES;
            }
        } else {
            friendId = toId;
            isSendOut = YES;
        }
        
        NSString *creatTimestamp = entity.creatTimestamp;
        NSString *msgId = entity.msgId;
        NSNumber *msgStatus = entity.msgStatus;
        NSString *msgBody = entity.body;
        
        NSString *criteria = [NSString stringWithFormat:@"SELF.clientId== $clientId && SELF.msgId == $msgId"];
        NSArray *result = [self fetchEntityName:[self coreDataChatContentMessageEntityName]
                                       criteria:criteria
                                      variables:@{@"clientId": currentId, @"msgId": msgId}
                                         sortBy:nil
                                      ascending:YES];
        if ([result count]) {
            //update
            ChatContentMessageEntity *entity = [result objectAtIndex:0];
            entity.creatTimestamp = creatTimestamp;
            entity.msgStatus = msgStatus;
            
        } else {
            //new
            ChatContentMessageEntity *entity =(ChatContentMessageEntity *)[[NSManagedObject alloc] initWithEntity:[self coreDataChatContentMessageEntity:managedObjectContext]
                                                                                   insertIntoManagedObjectContext:nil];
            entity.friendId = friendId;
            entity.body = msgBody;
            entity.creatTimestamp = creatTimestamp;
            entity.from = fromId;
            entity.to = toId;
            entity.isSendOut = [NSNumber numberWithBool:isSendOut];
            entity.msgId = msgId;
            
            entity.msgStatus = msgStatus;
            entity.clientId = currentId;
            
            [managedObjectContext insertObject:entity];
        }

    }];
}

- (void)deleteChatContentMessageWithMsgId:(NSString *)msgId clientId:(NSString *)clientId
{
    [self scheduleBlock:^{
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        
        NSString *criteria = [NSString stringWithFormat:@"SELF.clientId== $clientId && SELF.msgId == $msgId"];
        NSArray *result = [self fetchEntityName:[self coreDataChatContentMessageEntityName]
                                       criteria:criteria
                                      variables:@{@"clientId": clientId, @"msgId": msgId}
                                         sortBy:nil
                                      ascending:YES];
        if ([result count]) {
            for (NSManagedObject *object in result) {
                [managedObjectContext deleteObject:object];
            }
        }
    }];
}

- (ChatContentMessageEntity *)insertNewChatContentMessageEntityWithBody:(NSString *)body to:(NSString *)to
{
    __block ChatContentMessageEntity *entity = nil;
    [self executeBlock:^{
        NSString *currentId = @"2";
        NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
        
        entity =(ChatContentMessageEntity *)[[NSManagedObject alloc] initWithEntity:[self coreDataChatContentMessageEntity:managedObjectContext]
                                                                               insertIntoManagedObjectContext:nil];
        entity.body = body;
        entity.clientId = currentId;
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSince1970];
        entity.creatTimestamp = [NSString  stringWithFormat:@"%lld",(long long)timeInterval];
        entity.friendId = to;
        entity.from = currentId;
        entity.isRead = @YES;
        entity.isSendOut = @YES;
        entity.msgId = [ChatMessageCoreDataStorage generateUUID];
        entity.msgStatus = [NSNumber numberWithInt:E_ChatContentMessageStatus_Sending];
        entity.to = to;
        
        [managedObjectContext insertObject:entity];
    }];
    return entity;
}

- (void)updateChatContentMessageWithOldMsgId:(NSString *)oldMsgId
                                    newMsgId:(NSString *)newMsgId
                                   timestamp:(NSString *)timestamp
                                      status:(E_ChatContentMessageStatus_Type)status
{
    [self scheduleBlock:^{
        NSString *currentId = @"2";
        NSString *criteria = [NSString stringWithFormat:@"SELF.clientId== $clientId && SELF.msgId == $msgId"];
        NSArray *result = [self fetchEntityName:[self coreDataChatContentMessageEntityName]
                                       criteria:criteria
                                      variables:@{@"clientId": currentId, @"msgId": oldMsgId}
                                         sortBy:nil
                                      ascending:YES];
        if ([result count]) {
            ChatContentMessageEntity *entity = (ChatContentMessageEntity *)[result objectAtIndex:0];
            entity.msgId = newMsgId;
            entity.creatTimestamp = timestamp;
            entity.msgStatus = [NSNumber numberWithInt:status];
        }
    }];
}

- (NSInteger)allChatMessageCountWithFriendId:(NSString *)friendId
{
    NSManagedObjectContext *context = [[ChatMessageCoreDataStorage sharedInstance] mainThreadManagedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:kChatContentMessageEntity
                                              inManagedObjectContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF.friendId == %@ AND SELF.clientId == %@",friendId,@"2"];
    [request setPredicate:predicate];
    [request setEntity:entity];
    NSArray *array = [context executeFetchRequest:request error:NULL];
    return array.count;
}

#pragma mark - Common
+ (NSString *)generateUUID
{
	NSString *result = nil;
	
	CFUUIDRef uuid = CFUUIDCreate(NULL);
	if (uuid)
	{
		result = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
		CFRelease(uuid);
	}
	
	return result;
}

@end
