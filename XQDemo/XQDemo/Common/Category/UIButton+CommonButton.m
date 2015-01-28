//
//  UIButton+CommonButton.m
//  iPhone Car Service Master
//
//  Created by Joe on 13-9-16.
//  Copyright (c) 2013年 Leo. All rights reserved.
//

#import "UIButton+CommonButton.h"

@implementation UIButton (CommonButton)

+(UIButton *)backButton
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=CGRectMake(0, 0, 33, 33);
    [btn setContentMode:UIViewContentModeScaleAspectFill];
    [btn setClipsToBounds:YES];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn setImage:[UIImage imageNamed:@"navbar_back"] forState:UIControlStateNormal];
    return btn;
}
+ (UIButton *)deleteButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
    [button setContentMode:UIViewContentModeScaleAspectFill];
    [button setClipsToBounds:YES];
    [button setBackgroundImage:[UIImage imageNamed:@"whosv_icon_delete"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor clearColor]];
    return button;
}
+ (UIButton *)okButton
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
    [button setContentMode:UIViewContentModeScaleAspectFill];
    [button setClipsToBounds:YES];
    [button setBackgroundImage:[UIImage imageNamed:@"navbar_ok"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor clearColor]];
    return button;
}

+ (UIButton *)bigCommonButtonWithFrame:(CGRect)frame
{
    frame.size.height = 44;
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    UIImage *bunddleImage = [[UIImage imageNamed:@"big_btn_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 40, 15, 40)];
    [btn setBackgroundImage:bunddleImage forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:16]];
    
    return btn;
}

+ (UIButton *)jumpToNextViewController
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 33, 33)];
    [button setContentMode:UIViewContentModeScaleAspectFill];
    [button setClipsToBounds:YES];
    [button setBackgroundImage:[UIImage imageNamed:@"common_icon_choose"] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor clearColor]];
    return button;
}

@end
