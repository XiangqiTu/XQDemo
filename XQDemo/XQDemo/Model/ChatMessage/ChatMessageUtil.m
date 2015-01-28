//
//  ChatMessageUtil.m
//  test
//
//  Created by XiangqiTu on 14-9-12.
//
//

#import "ChatMessageUtil.h"

#import "NSObject+transformStringValue.h"

static ChatMessageUtil *__sharedInstance = nil;

@interface ChatMessageUtil ()

@end

@implementation ChatMessageUtil

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[ChatMessageUtil alloc] init];
    });
    
    return __sharedInstance;
}

#pragma mark - Message
- (void)sendMessageWithBody:(NSString *)body to:(NSString *)to
{
    ChatContentMessageEntity *entity = [[ChatMessageCoreDataStorage sharedInstance] insertNewChatContentMessageEntityWithBody:body to:to];
    [self sendMessage:entity];
}

- (void)sendMessage:(ChatContentMessageEntity *)entity
{
    [[NetworkCenter sharedInstance] sendChatMessageWithFriendId:entity.friendId
                                                    messageBody:entity.body
                                                        success:^(NSDictionary *result)
    {
        long long timestamp = [[result objectForKey:@"date_time"] longLongValue];
        NSString *creatTimestamp = [NSString stringWithFormat:@"%lld",timestamp/1000];
        NSString *msgId = [[result objectForKey:@"message_uuid"] transformStringValue];
        [[ChatMessageCoreDataStorage sharedInstance] updateChatContentMessageWithOldMsgId:entity.msgId
                                                                                 newMsgId:msgId
                                                                                timestamp:creatTimestamp
                                                                                   status:E_ChatContentMessageStatus_Sended];
                                                            
                                                        } failture:^(NSString *code)
    {
        [[ChatMessageCoreDataStorage sharedInstance] updateChatContentMessageWithOldMsgId:entity.msgId
                                                                                 newMsgId:entity.msgId
                                                                                timestamp:entity.creatTimestamp
                                                                                   status:E_ChatContentMessageStatus_Failture];
    }];
}

@end
