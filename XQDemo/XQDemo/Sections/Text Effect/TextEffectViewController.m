//
//  TextEffectViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-8-3.
//
//

#import "TextEffectViewController.h"
#import "TextEffectView.h"
#import "QZShiningView.h"
#import "AnotherTextEffectView.h"

@interface TextEffectViewController ()

@property (nonatomic, strong) TextEffectView        *textEffectView;
@property (nonatomic, strong) QZShiningView         *shiningView;
@property (nonatomic, strong) AnotherTextEffectView *anotherEffectView;

@property (nonatomic, assign) NSInteger             currentEffectIndex;

@end

@implementation TextEffectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Text Effect";
    
    [self initNavigationItem];
    
    [self.view setBackgroundColor:[UIColor blackColor]];
    [self showTextEffectView];
}

- (void)initNavigationItem
{
    UIButton *exchangeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    [exchangeButton setTitle:@"切换" forState:UIControlStateNormal];
    [exchangeButton setBackgroundColor:[UIColor clearColor]];
    [exchangeButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [exchangeButton addTarget:self
                       action:@selector(responseToExchangeButton:)
             forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:exchangeButton];
}

- (void)responseToExchangeButton:(UIButton *)button
{
    [self removeAllTextEffect];
    self.currentEffectIndex ++;
    
    switch (self.currentEffectIndex) {
        case 0:
        {
            [self showTextEffectView];
            break;
        }
            case 1:
        {
            [self showShiningView];
            break;
        }
            case 2:
        {
            [self showAnotherEffectView];
            break;
        }
        default:
        {
            self.currentEffectIndex = 0;
            [self showTextEffectView];
            break;
        }
    }
}

- (void)removeAllTextEffect
{
    [self.textEffectView removeFromSuperview];
    self.textEffectView = nil;
    [self.anotherEffectView removeFromSuperview];
    self.anotherEffectView = nil;
    [self.shiningView removeFromSuperview];
    self.shiningView = nil;
}

- (void)showTextEffectView
{
    if (!self.textEffectView) {
        self.textEffectView = [[TextEffectView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [self.view addSubview:self.textEffectView];
    }
    self.textEffectView.center = self.view.center;
    [self.textEffectView startAllAnimations:nil];
}

- (void)showAnotherEffectView
{
    if (!self.anotherEffectView) {
        self.anotherEffectView = [[AnotherTextEffectView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [self.view addSubview:self.anotherEffectView];
    }
    
    self.anotherEffectView.center = self.view.center;
    [self.anotherEffectView startAnimation];
}

- (void)showShiningView
{
    if (!self.shiningView) {
        self.shiningView = [[QZShiningView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
        [self.view addSubview:self.shiningView];
    }
    
    self.shiningView.center = self.view.center;
    [self.shiningView startAllAnimations:nil];
}

@end
