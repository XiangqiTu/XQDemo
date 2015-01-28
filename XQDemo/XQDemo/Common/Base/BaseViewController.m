//
//  BaseViewController.m
//  iPhone Meiquan Client
//
//  Created by XiangqiTu on 14-5-29.
//  Copyright (c) 2014年 meiquan. All rights reserved.
//

#import "BaseViewController.h"
#import "UIButton+CommonButton.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.loadingViewManager = [[LoadingViewManager alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setBackBarItem
{
    UIButton* bt = [UIButton backButton];
    [bt addTarget:self action:@selector(responseToBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setLeftBarItemWithButton:bt];
}

- (void)setTapBackGround
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(responseTapBackground)];
    tap.cancelsTouchesInView = YES;
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:tap];
}

- (void)responseToBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)responseTapBackground
{
    [self.view endEditing:YES];
}
#pragma mark - UIStatus Bar
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
    return nil;
}
@end
