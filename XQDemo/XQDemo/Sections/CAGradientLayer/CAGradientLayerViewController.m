//
//  CAGradientLayerViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-7-13.
//
//

#import "CAGradientLayerViewController.h"
#import "Masonry.h"

@interface CAGradientLayerViewController ()

@property (nonatomic, strong) CAGradientLayer   *gradientLayer;
@property (nonatomic, strong) CAShapeLayer      *nextButtonShapeLayer;

@property (nonatomic, strong) UILabel        *contentLabel;
@end

@implementation CAGradientLayerViewController

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor blackColor]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(responseToTap:)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:1];
    [tap setCancelsTouchesInView:YES];
    [self.view addGestureRecognizer:tap];
    
    [self.view.layer addSublayer:self.gradientLayer];
    
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:self.view.bounds];
    [contentLabel setBackgroundColor:[UIColor clearColor]];
    [contentLabel setTextAlignment:NSTextAlignmentCenter];
    [contentLabel setFont:[UIFont systemFontOfSize:16]];
    [contentLabel setTextColor:[UIColor blackColor]];
    [contentLabel setText:nil];
    [contentLabel setNumberOfLines:0];
    
    [self.view addSubview:contentLabel];
    
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(64, 18, 258, 18));
    }];
    self.contentLabel = contentLabel;
    
    self.gradientLayer.mask =self.contentLabel.layer;
    
    [self.contentLabel.layer addSublayer:self.nextButtonShapeLayer];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSString *str = @"  阿布从不愁吃穿，祖上留下来的财产多到任由他造10年也造不完。成长在这样的家庭，阿布打幼时就对金钱没有什么概念。\n\n  也由于此，阿布吃了不少亏。阿布小时候本是一个随和的孩子，与院里其他小朋友一起玩的时候，其他小朋友知道阿布家里有钱，就骗他说用他们手上的金色5角硬币换阿布手上的银色一元银币。『好！』阿布说。 就这样，小孩子骗了阿布好几次，阿布实在天真，一直蒙在鼓里，直到某一天阿布的妈妈告诉了阿布的真相，知道真相的阿布眼泪掉下来，一种上当受骗的羞耻感从心头涌上，阿布自我安慰，心想不就是这么点钱么，送他们也无妨。话是这么说，但上当了谁都不会开心。也由此，阿布再也不和他们做朋友了。\n\n  土豪，不需要朋友";
    [self delayShowString:[str copy]];
}

- (void)responseToTap:(id)gesture
{
    BOOL hidden = self.navigationController.navigationBar.hidden;
    [self.navigationController setNavigationBarHidden:!hidden animated:YES];
}

- (void)delayShowString:(NSString *)sourceString
{
    if (![sourceString length]) {
        return;
    }
    
    NSMutableString *mutStr = [NSMutableString string];
    if ([self.contentLabel.text length]) {
        [mutStr appendString:self.contentLabel.text];
    }
    
    NSString *oneChar = [sourceString substringWithRange:NSMakeRange(0, 1)];
    [mutStr appendString:oneChar];
    
    NSString *left = [sourceString substringFromIndex:1];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.contentLabel setText:mutStr];
        [self delayShowString:left];
    });
}

- (CAGradientLayer *)gradientLayer
{
    if (!_gradientLayer) {
        _gradientLayer = [[CAGradientLayer alloc] init];
        [_gradientLayer setFrame:self.view.bounds];
        CGColorRef color1 = [UIColor colorWithRed:0.0 green:1.0 blue:0.752 alpha:1].CGColor;
        CGColorRef color2 = [UIColor colorWithRed:1.000 green:0.571 blue:0.914 alpha:1.000].CGColor;
        CGColorRef color4 = [UIColor colorWithRed:0.949 green:0.03 blue:0.913 alpha:1].CGColor;
        [_gradientLayer setColors:[NSArray arrayWithObjects:(__bridge id)color1,(__bridge id)color2,(__bridge id)color4, nil]];
        [_gradientLayer setLocations:@[@0.35,@0.65,@0.905,@1]];
        [_gradientLayer setStartPoint:CGPointMake(0, 0)];
        [_gradientLayer setEndPoint:CGPointMake(1, 1)];
    }
    return _gradientLayer;
}

- (CAShapeLayer *)nextButtonShapeLayer
{
    if (!_nextButtonShapeLayer) {
        _nextButtonShapeLayer = [CAShapeLayer layer];
        CGFloat side = 60.0f;
        [_nextButtonShapeLayer setPosition:CGPointMake(self.contentLabel.bounds.size.width*0.5 - side*0.5, self.contentLabel.bounds.size.height*0.75)];
        [_nextButtonShapeLayer setStrokeColor:[UIColor blackColor].CGColor];
        [_nextButtonShapeLayer setFillColor:[UIColor clearColor].CGColor];
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, side, side)];
        [_nextButtonShapeLayer setPath:path.CGPath];
        [_nextButtonShapeLayer setLineWidth:1.0];
        [_nextButtonShapeLayer setOpacity:0.5];
    }
    
    return _nextButtonShapeLayer;
}
@end
