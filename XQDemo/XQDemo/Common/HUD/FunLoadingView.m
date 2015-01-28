//
//  FunLoadingView.m
//  HYCircleLoadingViewExample
//
//  Created by XiangqiTu on 14-9-11.
//  Copyright (c) 2014年 Shadow. All rights reserved.
//

#import "FunLoadingView.h"

@interface FunLoadingView ()

@property (nonatomic, weak) IBOutlet UIImageView    *backgroundImageView;
@property (nonatomic, weak) IBOutlet UIImageView    *transformImageView;

@end

@implementation FunLoadingView

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)startAnimation
{
    self.alpha = 0;
    [UIView animateWithDuration:1
                     animations:^{
                         self.alpha = 1;
                         [self.transformImageView setAlpha:0.1];
                     } completion:^(BOOL finished) {
                         [self.transformImageView setAlpha:1];
                         CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
                         animation.fromValue = @(0);
                         animation.toValue = @(2*M_PI);
                         animation.duration = 1.f;
                         animation.repeatCount = INT_MAX;
                         [self.transformImageView.layer addAnimation:animation forKey:@"keyFrameAnimation"];
                     }];
}

- (void)stopAnimation
{
    [UIView animateWithDuration:0.3f animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self.transformImageView.layer removeAllAnimations];
    }];
}
@end
