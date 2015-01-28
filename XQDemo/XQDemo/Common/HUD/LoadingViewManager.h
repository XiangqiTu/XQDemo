//
//  LoadingViewManager.h
//  Owner
//
//  Created by Joe on 13-7-31.
//  Copyright (c) 2013年 mlyn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MBProgressHUD.h"

@interface LoadingViewManager : NSObject

@property (nonatomic,retain)MBProgressHUD *hud;

- (void)showHUDWithText:(NSString *)hudText inView:(UIView *)containerView;
- (void)showNotice:(NSString *)notice inView:(UIView *)containerView;
- (void)hideHUDWithText:(NSString *)hudText afterDelay:(float)timeInterval;
- (void)hideHUDAfterDelay:(float)timeInterval;

@end
