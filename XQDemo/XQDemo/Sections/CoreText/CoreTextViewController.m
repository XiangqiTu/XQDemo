//
//  CoreTextViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-7-7.
//
//

#import "CoreTextViewController.h"
#import "CTDisplayView.h"
#import "Masonry.h"

@interface CoreTextViewController ()

@property (nonatomic, strong) CTDisplayView     *displayView;

@end

@implementation CoreTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"CoreText";
    [self.view setBackgroundColor:[UIColor greenColor]];
    self.displayView = [[CTDisplayView alloc] initWithFrame:self.view.frame];
    [self.displayView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.displayView];
    
    UIView *superView = self.view;
    [self.displayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView).insets(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
}

@end
