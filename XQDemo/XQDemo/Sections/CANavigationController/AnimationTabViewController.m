//
//  AnimationTabViewController.m
//  MyTest
//
//  Created by xhguo on 15/5/26.
//  Copyright (c) 2015年 Baiai Mac. All rights reserved.
//

#import "AnimationTabViewController.h"

@interface AnimationTabViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) UIImageView *imgProfile;
@property (nonatomic, retain) UITableView *tableView;

@end

@implementation AnimationTabViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.title = @"With UITableView";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewControllerProperty];
    [self initSubViews];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
}

- (void)initSubViews
{
    UIImage *image = [UIImage imageNamed:@"test"];
    self.imgProfile = [[UIImageView alloc] initWithImage:image];
    self.imgProfile.frame             = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,
                                                                   0,
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.height-44)
                                                  style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor redColor];
    
    UIView *v = [[UIView alloc] initWithFrame:self.imgProfile.frame];
    [v setBackgroundColor:[UIColor clearColor]];
    [self.tableView setTableHeaderView:v];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.imgProfile];
}

- (void)setViewControllerProperty
{
    [self setExtendedLayoutIncludesOpaqueBars:YES];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    [self setEdgesForExtendedLayout:UIRectEdgeAll];
}

- (void)updateImg {
    
    CGFloat yOffset   = _tableView.contentOffset.y;
    
    NSLog(@"yOffset === %f",yOffset);
    
    if (yOffset < 0) {
        
        CABasicAnimation * fadIn = [CABasicAnimation animationWithKeyPath:@"opacity"];

        fadIn.fromValue = [NSNumber numberWithInt:1];

        fadIn.toValue = [NSNumber numberWithFloat:ABS(yOffset)/100];
        
        fadIn.duration = 0.5;
            
        fadIn.fillMode = kCAFillModeBackwards;
            
        fadIn.beginTime = CACurrentMediaTime() + 0.5;
        
        [self.navigationController.navigationBar.layer addAnimation:fadIn forKey:nil];

        CGFloat factor = ((ABS(yOffset)+self.view.frame.size.width));
        CGRect f = CGRectMake(-(factor-self.view.frame.size.width)/2, 0, factor, self.view.frame.size.width+ABS(yOffset));
        self.imgProfile.frame = f;
    }else {
        
        CGRect f = self.imgProfile.frame;
        f.origin.y = -yOffset;
        self.imgProfile.frame = f;
    }
    
}

#pragma mark - Table View Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateImg];
}

#pragma mark - Table View Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section == 0)
//        return 1;
//    else
        return 1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellReuseIdentifier   = @"SectionTwoCell";
//    NSString *windowReuseIdentifier = @"SectionOneCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellReuseIdentifier];
    
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellReuseIdentifier];
        cell.contentView.backgroundColor = [UIColor lightGrayColor];
        
    }
    
    cell.textLabel.text = [ NSString stringWithFormat:@"cell %li",(long)indexPath.row];
    
    cell.selectionStyle              = UITableViewCellSelectionStyleNone;
    
    return cell;
}

@end
