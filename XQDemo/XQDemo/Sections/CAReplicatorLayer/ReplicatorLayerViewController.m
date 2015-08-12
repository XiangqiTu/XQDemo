//
//  ReplicatorLayerViewController.m
//  XQDemo
//
//  Created by XiangqiTu on 15-3-19.
//
//

#import "ReplicatorLayerViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ReplicatorLayerViewController ()

//@property (nonatomic, strong) CAReplicatorLayer     *musicLayer;
//@property (nonatomic, strong) CAReplicatorLayer     *activityLayer;

@end

@implementation ReplicatorLayerViewController(Fuck)

@dynamic cao; //runtime set &get

- (int)count
{
    NSLog(@"category count");
    return 1;
}

- (void)setCao:(NSString *)cao
{
    
}

- (NSString *)cao
{
    return @"";
}

- (NSString *)whoIsCao
{
    return @"caocaocao";
}

@end


@implementation ReplicatorLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view.layer addSublayer:self.activityLayer];
}

- (int)count
{
    NSLog(@"extension Count ");
    return 9;
}

#pragma mark - MusicLayer
- (CAReplicatorLayer *)musicLayer
{
    if (_musicLayer) {
        return _musicLayer;
    }
    
    _musicLayer = [[CAReplicatorLayer alloc] init];
    [_musicLayer setBounds:CGRectMake(0, 0, 60, 60)];
    [_musicLayer setPosition:self.view.center];
    [_musicLayer setBackgroundColor:[UIColor clearColor].CGColor];
    [_musicLayer setInstanceCount:3];
    [_musicLayer setInstanceTransform:CATransform3DMakeTranslation(20.0, 0.0, 0.0)];
    [_musicLayer setInstanceDelay:0.33f];
    [_musicLayer setMasksToBounds:YES];
    
    CALayer *bar = [[CALayer alloc] init];
    [bar setBounds:CGRectMake(0, 0, 8, 40)];
    [bar setPosition:CGPointMake(10, 75)];
    [bar setCornerRadius:2.0];
    [bar setBackgroundColor:[UIColor redColor].CGColor];
    [_musicLayer addSublayer:bar];
    
    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    [animation setKeyPath:@"position.y"];
    [animation setToValue:@(bar.position.y - 35.0)];
    animation.duration = 0.5;
    animation.autoreverses = true;
    animation.repeatCount = CGFLOAT_MAX;
    [bar addAnimation:animation forKey:nil];
    
    return _musicLayer;
}

- (CAReplicatorLayer *)activityLayer
{
    if (_activityLayer) {
        return _activityLayer;
    }
    
    _activityLayer = [CAReplicatorLayer new];
    [_activityLayer setBounds:CGRectMake(0, 0, 200, 200)];
    [_activityLayer setCornerRadius:10];
    [_activityLayer setBackgroundColor:[UIColor blackColor].CGColor];
    [_activityLayer setPosition:self.view.center];
    
    int nDot = 15;
    [_activityLayer setInstanceCount:nDot];
    CGFloat angle = (CGFloat)(2*M_PI) /(CGFloat)nDot;
    [_activityLayer setInstanceTransform:CATransform3DMakeRotation(angle, 0, 0, 1)];
    _activityLayer.instanceDelay = 1.5/(double)nDot;
    [_activityLayer setInstanceColor:[UIColor purpleColor].CGColor];
    [_activityLayer setInstanceRedOffset:-0.01];
    [_activityLayer setInstanceGreenOffset:0.02];
    [_activityLayer setInstanceBlueOffset:0.01];
    
    CALayer *dot = [CALayer new];
    [dot setBounds:CGRectMake(0, 0, 14, 14)];
    [dot setPosition:CGPointMake(100, 40)];
    [dot setBackgroundColor:[UIColor colorWithWhite:0.8 alpha:1.0].CGColor];
    [dot setBorderColor:[UIColor whiteColor].CGColor];
    dot.borderWidth = 1.0;
    dot.cornerRadius = 7.0;
    [_activityLayer addSublayer:dot];
    
    CABasicAnimation *animation = [CABasicAnimation new];
    [animation setKeyPath:@"transform.scale"];
    [animation setFromValue:@1.0];
    [animation setToValue:@0.1];
    [animation setDuration:1.5];
    [animation setRepeatCount:CGFLOAT_MAX];
    [dot addAnimation:animation forKey:nil];
    
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01);

    return _activityLayer;
}

@end
