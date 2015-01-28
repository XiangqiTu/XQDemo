//
//  HomePageViewController.m
//  test
//
//  Created by XiangqiTu on 14-11-11.
//
//

#import "HomePageViewController.h"
#import "HMSegmentedControl.h"

@interface HomePageViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) HMSegmentedControl    *segmentedControl;
@property (nonatomic, strong) UITableView           *allContentTableView;
@property (nonatomic, strong) UITableView           *myAttentionTableView;
@property (nonatomic, strong) UITableView           *multiStateTableView;
@property (nonatomic, strong) UIScrollView          *containerScrollView;

@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.902 green:0.901 blue:0.926 alpha:1.000]];
    [self setViewControllerPropertyForIOSVersion];
    [self initScrollView];
    [self initSegmentedControl];
}

- (void)initSegmentedControl
{
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat height = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    self.segmentedControl = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"全 部", @"关 注", @"动 态"]];
    [self.segmentedControl setSelectionStyle:HMSegmentedControlSelectionStyleTextWidthStripe];
    [self.segmentedControl setSegmentWidthStyle:HMSegmentedControlSegmentWidthStyleFixed];
    [self.segmentedControl setSelectionIndicatorLocation:HMSegmentedControlSelectionIndicatorLocationDown];
    [self.segmentedControl setSelectionIndicatorEdgeInsets:UIEdgeInsetsMake(0, 0, -5, 0)];
    [self.segmentedControl setSelectionIndicatorColor:[UIColor colorWithRed:0.305 green:0.383 blue:0.533 alpha:1.000]];
    [self.segmentedControl setSelectionIndicatorHeight:3];
    [self.segmentedControl setFont:[UIFont systemFontOfSize:14]];
    [self.segmentedControl setTextColor:[UIColor colorWithRed:0.047 green:0.052 blue:0.047 alpha:1.000]];
    [self.segmentedControl setSelectedTextColor:[UIColor colorWithRed:0.047 green:0.052 blue:0.047 alpha:1.000]];
    self.segmentedControl.frame = CGRectMake(0, 0, width, 40);
    self.segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth;
    [self.segmentedControl setBackgroundColor:[UIColor colorWithRed:0.902 green:0.901 blue:0.926 alpha:0.900]];
    [self.view addSubview:self.segmentedControl];
    
    __weak typeof(self) weakSelf = self;
    [self.segmentedControl setIndexChangeBlock:^(NSInteger index) {
        [weakSelf.containerScrollView scrollRectToVisible:CGRectMake(width * index, 0, width, height-64) animated:YES];
    }];
}

- (void)initScrollView
{
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]);
    CGFloat height = CGRectGetHeight([[UIScreen mainScreen] bounds]);
    self.containerScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, width, height-64)];
    [self.containerScrollView setBackgroundColor:[UIColor clearColor]];
    [self.containerScrollView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    [self.containerScrollView setContentSize:CGSizeMake(width*3, self.containerScrollView.frame.size.height-40)];
    [self.containerScrollView setShowsVerticalScrollIndicator:NO];
    [self.containerScrollView setShowsVerticalScrollIndicator:NO];
    [self.containerScrollView setBounces:NO];
    [self.containerScrollView setScrollsToTop:NO];
    [self.containerScrollView setPagingEnabled:YES];
    [self.containerScrollView setDelegate:self];
    [self.view addSubview:self.containerScrollView];
    
    self.allContentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height-64) style:UITableViewStylePlain];
    [self.allContentTableView setContentInset:UIEdgeInsetsMake(40, 0, 0, 0)];
    [self.allContentTableView setDataSource:self];
    [self.allContentTableView setDelegate:self];
    [self.allContentTableView setBackgroundColor:[UIColor clearColor]];
    [self.containerScrollView addSubview:self.allContentTableView];
    
    self.myAttentionTableView = [[UITableView alloc] initWithFrame:CGRectMake(width, 0, width, height-64) style:UITableViewStylePlain];
    [self.myAttentionTableView setContentInset:UIEdgeInsetsMake(40, 0, 0, 0)];
    [self.myAttentionTableView setBackgroundColor:[UIColor clearColor]];
    [self.myAttentionTableView setDataSource:self];
    [self.myAttentionTableView setDelegate:self];
    [self.containerScrollView addSubview:self.myAttentionTableView];
    
    self.multiStateTableView = [[UITableView alloc] initWithFrame:CGRectMake(width*2, 0, width, height-64) style:UITableViewStylePlain];
    [self.multiStateTableView setContentInset:UIEdgeInsetsMake(40, 0, 0, 0)];
    [self.multiStateTableView setDataSource:self];
    [self.multiStateTableView setDelegate:self];
    [self.multiStateTableView setBackgroundColor:[UIColor clearColor]];
    [self.containerScrollView addSubview:self.multiStateTableView];
}

- (void)setViewControllerPropertyForIOSVersion
{
    if (_Owner_IOS_VERSION >= 7.0) {
        if ([self respondsToSelector:@selector(edgesForExtendedLayout)]) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.extendedLayoutIncludesOpaqueBars = YES;
            self.automaticallyAdjustsScrollViewInsets = YES;
        }
    }
}

#pragma mark - UITableview Datasource & Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    
    [cell.textLabel setText:[NSString stringWithFormat:@"%d",(int)indexPath.row]];
    
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if ([scrollView isEqual:self.containerScrollView]) {
        CGFloat pageWidth = scrollView.frame.size.width;
        NSInteger page = scrollView.contentOffset.x / pageWidth;
        
        [self.segmentedControl setSelectedSegmentIndex:page animated:YES];
    }
}
@end
