//
//  ShapreLayerControllerViewController.m
//  test
//
//  Created by XiangqiTu on 15-1-27.
//
//

#import "ShapreLayerControllerViewController.h"

#define kOriginX        30.0

typedef enum {
    E_SharpeLayer_QRCode = 0,
    E_SharpeLayer_Cover = 1,
    E_SharpeLayer_Words = 2,
}E_SharpeLayer_Style;

@interface ShapreLayerControllerViewController ()
{
    int     _style;
}

@property (nonatomic, strong) CAShapeLayer  *maskLayer;
//@property (nonatomic, strong) CAShapeLayer  *maskBgLayer;

@property (nonatomic, weak) IBOutlet UIView        *overlayView;
@property (nonatomic, weak) IBOutlet UIButton      *actionButton;

@property (nonatomic, strong) UIImageView                *customImageView;

@end

@implementation ShapreLayerControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor greenColor]];
    [self.overlayView.layer addSublayer:self.maskLayer];
//    [self.overlayView.layer addSublayer:self.maskBgLayer];
    [self.overlayView addSubview:self.customImageView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self showOverlayViewWithStyle:_style];
    
}

- (IBAction)responseToActionButton:(UIButton *)button
{
    [self showOverlayViewWithStyle:_style];
    _style ++;
    
//    [self.maskLayer setTransform:CATransform3DMakeRotation(_style * 0.4 * M_PI_4, 0, 0, 1)];
}

- (void)showOverlayViewWithStyle:(E_SharpeLayer_Style)style
{
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.view.frame];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRect:[self maskRectWithStyle:style]];
    [clipPath appendPath:maskPath];
    clipPath.usesEvenOddFillRule = YES;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    pathAnimation.duration = [CATransaction animationDuration];
    pathAnimation.timingFunction = [CATransaction animationTimingFunction];
    [self.maskLayer addAnimation:pathAnimation forKey:@"path"];
    
    self.maskLayer.path = [clipPath CGPath];
    
    pathAnimation.delegate = self;
    
    [UIView animateWithDuration:0.25
                     animations:^{
                         [self.customImageView setFrame:[self maskRectWithStyle:style]];
                     }];
    
}

- (CAShapeLayer *)maskLayer
{
    if (!_maskLayer) {
        _maskLayer = [CAShapeLayer layer];
        _maskLayer.fillRule = kCAFillRuleEvenOdd;
        _maskLayer.fillColor = [UIColor colorWithWhite:0.739 alpha:0.700].CGColor;
    }
    return _maskLayer;
}

//- (CALayer *)maskBgLayer
//{
//    if (!_maskBgLayer) {
//        _maskBgLayer = [CAShapeLayer layer];
//        UIImage *colorImg = [[UIImage imageNamed:@"chat_bubble_out"] resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)];
//        _maskBgLayer.fillColor = [UIColor clearColor].CGColor;
//        _maskBgLayer.contents = (__bridge id)(colorImg.CGImage);
//    }
//    
//    return _maskBgLayer;
//}

- (UIView *)customImageView
{
    if (!_customImageView) {
        _customImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        _customImageView.layer.borderWidth = 5;
//        _customImageView.layer.borderColor = [UIColor redColor].CGColor;
        [_customImageView setBackgroundColor:[UIColor clearColor]];
        [_customImageView setImage:[[UIImage imageNamed:@"chat_shetter"] resizableImageWithCapInsets:UIEdgeInsetsMake(20, 20, 20, 20)]];
    }
    
    return _customImageView;
}

- (CGRect)maskRectWithStyle:(E_SharpeLayer_Style)style
{
    CGRect bounds = self.view.bounds;
    
    CGFloat width = CGRectGetWidth(bounds);
    CGFloat height = CGRectGetHeight(bounds);
    
    CGRect maskRect = CGRectZero;
    CGPoint center = CGPointMake(width / 2, height / 2);
    switch (style) {
        case E_SharpeLayer_QRCode:
        {
            CGFloat side =  width - kOriginX*2;
            maskRect = CGRectMake(center.x - side/2, center.y - side/2, side, side);
            break;
        }
         case E_SharpeLayer_Cover:
        {
            maskRect = CGRectMake(center.x - 100, center.y-50, 200, 100);
            break;
        }
            case E_SharpeLayer_Words:
        {
            maskRect = CGRectMake(center.x - 80, center.y-30, 160, 60);
            break;
        }
        default:
        {
            CGFloat side =  width - kOriginX*2;
            maskRect = CGRectMake(center.x - side/2, center.y - side/2, side, side);
            _style = 0;
            break;
        }
    }

    return maskRect;
}

#pragma mark - CAAnimation Delegate
- (void)animationDidStart:(CAAnimation *)anim
{
    

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{

}
@end
