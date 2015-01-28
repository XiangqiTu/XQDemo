//
//  AutoLayoutViewController.m
//  test
//
//  Created by XiangqiTu on 14-10-20.
//
//

#import "AutoLayoutViewController.h"

@interface AutoLayoutViewController ()

@property (nonatomic, weak) IBOutlet    UIButton *firstButton;
@property (nonatomic, weak) IBOutlet    UIButton *secondButton;

@end

@implementation AutoLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setViewControllerPropertyForIOSVersion];
}

- (void)setViewControllerPropertyForIOSVersion
{
    if (_Owner_IOS_VERSION >= 7.0) {
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = NO;
        }
    }
}

@end
