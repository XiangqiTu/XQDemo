//
//  ChatMessageCoreDataStorage.h
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import <Foundation/Foundation.h>
#import "XMPPCoreDataStorage.h"
#import "ChatContentMessageEntity.h"

#define kChatContentMessageEntity   @"ChatContentMessageEntity"

typedef enum {
    E_ChatContentMessageStatus_Sending      = 0,
    E_ChatContentMessageStatus_Sended       = 1,
    E_ChatContentMessageStatus_Failture     = -1,
}E_ChatContentMessageStatus_Type;

static NSString * const kChatContentMessageTextType = @"text";

@interface ChatMessageCoreDataStorage : XMPPCoreDataStorage

+ (ChatMessageCoreDataStorage *)sharedInstance;

#pragma mark - Core Data

- (NSManagedObjectContext *)mainThreadManagedObjectContext;

- (void)saveContext;

#pragma mark - ChatContentMessage

//从网络获取到的消息数组
- (void)addNewChatContentMessageFromDictionaryArray:(NSArray *)sourceArray;

- (void)addNewChatContentMessage:(ChatContentMessageEntity *)entity;

- (void)deleteChatContentMessageWithMsgId:(NSString *)msgId clientId:(NSString *)clientId;

- (ChatContentMessageEntity *)insertNewChatContentMessageEntityWithBody:(NSString *)body to:(NSString *)to;

- (void)updateChatContentMessageWithOldMsgId:(NSString *)oldMsgId
                                    newMsgId:(NSString *)newMsgId
                                timestamp:(NSString *)timestamp
                                   status:(E_ChatContentMessageStatus_Type)status;

- (NSInteger)allChatMessageCountWithFriendId:(NSString *)friendId;

@end
