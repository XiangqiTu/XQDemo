//
//  BaseViewController.h
//  iPhone Meiquan Client
//
//  Created by XiangqiTu on 14-5-29.
//  Copyright (c) 2014年 meiquan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoadingViewManager.h"
#import "UIViewController+NavigationBarItemFlexiable.h"

@interface BaseViewController : UIViewController

@property (nonatomic, strong)   LoadingViewManager                              *loadingViewManager;

- (void)setBackBarItem;

- (void)setTapBackGround;

- (void)responseToBackButton:(id)sender;

- (void)responseTapBackground;

@end
