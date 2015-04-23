//
//  HomePageCoverFlowViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-4-13.
//
//

#import "HomePageCoverFlowViewController.h"
#import "HomeDateContainerView.h"

@interface HomePageCoverFlowViewController ()

@property (nonatomic, strong) HomeDateContainerView     *dateContainerView;

@end

@implementation HomePageCoverFlowViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setEdgesForExtendedLayout:UIRectEdgeTop];
    self.title = @"首页日期";
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initSubViews];
    
}

- (void)initSubViews
{
    CGFloat width = [[UIScreen mainScreen] bounds].size.width;
    self.dateContainerView = [[NSBundle mainBundle] loadNibNamed:@"HomeDateContainerView" owner:self options:nil][0];
    [self.dateContainerView setFrame:CGRectMake(0, 64, width, self.dateContainerView.frame.size.height)];
    [self.view addSubview:self.dateContainerView];
    [self.dateContainerView caculateDateWithTimestamp:@""];
}

@end
