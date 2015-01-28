//
//  NetworkCenter.h
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import <Foundation/Foundation.h>

@interface NetworkCenter : NSObject

+ (instancetype)sharedInstance;

#pragma mark - Message
- (void)getLatestChatMessageWithFriendId:(NSString *)friendId
                          fetchTimestamp:(NSString *)timestamp
                                 success:(void (^)(NSDictionary *result))successBlock
                                failture:(void (^)(NSString *code))failtureBlock;

- (void)sendChatMessageWithFriendId:(NSString *)friendId
                        messageBody:(NSString *)messageBody
                            success:(void (^)(NSDictionary *result))successBlock
                           failture:(void (^)(NSString *code))failtureBlock;
@end
