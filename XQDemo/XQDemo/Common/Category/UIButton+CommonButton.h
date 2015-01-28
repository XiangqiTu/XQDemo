//
//  UIButton+CommonButton.h
//  iPhone Car Service Master
//
//  Created by Joe on 13-9-16.
//  Copyright (c) 2013年 Leo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CommonButton)

+ (UIButton *)backButton;

+ (UIButton *)okButton;

+ (UIButton *)deleteButton;

+ (UIButton *)bigCommonButtonWithFrame:(CGRect)frame;

+ (UIButton *)jumpToNextViewController;

@end
