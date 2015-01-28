//
//  NetworkCenter.m
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import "NetworkCenter.h"
#import "HTTPRequestManager.h"
#import "HTTPRequestHandler.h"
#import "ChatMessageCoreDataStorage.h"


static NSString * const kCurrentUserId = @"2";

static     NetworkCenter   *__sharedInstace = nil;

@interface NetworkCenter ()

@property (nonatomic, strong) HTTPRequestManager        *requestManager;

@end

@implementation NetworkCenter

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstace = [[NetworkCenter alloc] init];
    });
    
    return __sharedInstace;
}

- (id)init
{
    if (self = [super init]) {
        self.requestManager = [[HTTPRequestManager alloc] init];
    }
    
    return self;
}

#pragma mark - Message
- (void)getLatestChatMessageWithFriendId:(NSString *)friendId
                          fetchTimestamp:(NSString *)timestamp
                                 success:(void (^)(NSDictionary *result))successBlock
                                failture:(void (^)(NSString *code))failtureBlock
{
    NSString *currentUserId = kCurrentUserId;
    
    NSDictionary *parameterDic = nil;
    if (!timestamp || [timestamp length] == 0) {
        parameterDic = @{@"user_uuid":currentUserId, @"target_user_uuid":friendId};
    } else {
        parameterDic = @{@"user_uuid":currentUserId, @"target_user_uuid":friendId,@"date_time":timestamp};
    }
    
    [self.requestManager requestWithParameters:parameterDic
                              handleIdentifier:kNetworkMessageListNewest
                                       success:^(NSDictionary *result) {
                                           successBlock(result);
                                           id data = [result objectForKey:@"data"];
                                           if ([data isKindOfClass:[NSArray class]]) {
                                               [[ChatMessageCoreDataStorage sharedInstance] addNewChatContentMessageFromDictionaryArray:data];
                                           }
                                       } failture:^(NSString *code) {
                                           failtureBlock(code);
                                       }];
}

- (void)sendChatMessageWithFriendId:(NSString *)friendId
                        messageBody:(NSString *)messageBody
                            success:(void (^)(NSDictionary *result))successBlock
                           failture:(void (^)(NSString *code))failtureBlock
{
    NSString *currentUserId = kCurrentUserId;
    
    NSDictionary *parameterDic = @{@"user_uuid": currentUserId, @"target_user_uuid": friendId, @"message": messageBody};
    
    [self.requestManager requestWithParameters:parameterDic
                              handleIdentifier:kNetworkMessageSendMessage
                                       success:^(NSDictionary *result) {
                                           successBlock(result);
                                       } failture:^(NSString *code) {
                                           failtureBlock(code);
                                       }];
}

@end
