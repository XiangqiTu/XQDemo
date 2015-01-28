//
//  BaseFlowTagsView.h
//  FunApplication
//
//  Created by XiangqiTu on 14-11-15.
//  Copyright (c) 2014年 Fun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseFlowTagsView : UIView

@property (nonatomic, assign) CGFloat scale; //缩放比率
@property (nonatomic, assign) CGFloat arg; //弧度

- (id)initWithImage:(UIImage *)image;

+ (void)setActiveBaseFlowTagsView:(BaseFlowTagsView*)view;

- (void)setScale:(CGFloat)scale;

@end
