//
//  ChatMessageUtil.h
//  test
//
//  Created by XiangqiTu on 14-9-12.
//
//

#import <Foundation/Foundation.h>
#import "ChatMessageCoreDataStorage.h"

@interface ChatMessageUtil : NSObject

+ (instancetype)sharedInstance;

- (void)sendMessageWithBody:(NSString *)body to:(NSString *)to;

- (void)sendMessage:(ChatContentMessageEntity *)entity;

@end
