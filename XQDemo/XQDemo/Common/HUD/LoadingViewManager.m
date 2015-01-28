//
//  LoadingViewManager.m
//  Owner
//
//  Created by Joe on 13-7-31.
//  Copyright (c) 2013年 mlyn. All rights reserved.
//

#import "LoadingViewManager.h"

@implementation LoadingViewManager

@synthesize hud = _hud;

- (id) init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)dealloc
{
    if (_hud) {
        [_hud removeFromSuperview];
        _hud = nil;
    }
}

- (void)showHUDWithText:(NSString *)hudText inView:(UIView *)containerView{
    if (containerView == nil) {
        containerView = [[UIApplication sharedApplication] keyWindow];
    }
    
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc] initWithView:containerView];
        [self.hud setColor:[UIColor colorWithRed:164/255.0 green:128/255.0 blue:80/255.0 alpha:0.65]];
        [self.hud setLabelColor:[UIColor whiteColor]] ;
    }
    self.hud.mode  = MBProgressHUDModeIndeterminate;
    self.hud.labelText = hudText;
    
    [containerView addSubview:self.hud];
    [self.hud show:YES];
}

- (void)showNotice:(NSString *)notice inView:(UIView *)containerView
{
    if (!self.hud) {
        self.hud = [[MBProgressHUD alloc] initWithView:containerView];
    }
    self.hud.mode  = MBProgressHUDModeText;
    self.hud.labelText = notice;
    [containerView addSubview:self.hud];
    [containerView bringSubviewToFront:self.hud];
    [self.hud show:YES];
}

- (void)hideHUDWithText:(NSString *)hudText afterDelay:(float)timeInterval{
    if (!self.hud) {
        return;
    }
    self.hud.labelText = hudText;
    self.hud.mode = MBProgressHUDModeText;
    [self hideHUDAfterDelay:timeInterval];
}

- (void)hideHUDAfterDelay:(float)timeInterval{
    if (!self.hud) {
        return;
    }
    
    [self performSelector:@selector(removeHUDFromSuperView) withObject:nil afterDelay:timeInterval];
}

- (void)removeHUDFromSuperView{
    [self.hud removeFromSuperview];
    self.hud = nil;
}


@end
