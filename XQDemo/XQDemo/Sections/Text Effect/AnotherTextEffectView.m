//
//  AnotherTextEffectView.m
//  XQDemo
//
//  Created by XiangqiTu on 15-8-3.
//
//

#import "AnotherTextEffectView.h"

@interface AnotherTextEffectView ()

@property (nonatomic, strong) UIView        *backgroundView;

@end

@implementation AnotherTextEffectView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        [self.backgroundView setBackgroundColor:[UIColor blackColor]];
    }
    
    return self;
}

- (void)startAnimation
{
    CAReplicatorLayer *layer = [self canvasReplicatorLayer];
    [self.layer addSublayer:layer];
    
    CALayer *dotLayer = [self dotLayer];
    CAKeyframeAnimation *move = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    move.path = [self samuraiPath].CGPath;
    move.repeatCount = CGFLOAT_MAX;
    move.duration = 4;
    [dotLayer addAnimation:move forKey:@"samuraiPathMoveAnimation"];
    
    [layer addSublayer:dotLayer];
    
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setPath:[self samuraiPath].CGPath];
    [shapeLayer setBackgroundColor:[UIColor clearColor].CGColor];
    [shapeLayer setBorderWidth:1];
    [shapeLayer setBorderColor:[UIColor clearColor].CGColor];
    [self.layer addSublayer:shapeLayer];
    
    CABasicAnimation *fillColor = [CABasicAnimation animationWithKeyPath:@"fillColor"];
    fillColor.fromValue          = (id)[UIColor blackColor].CGColor;
    fillColor.toValue            = (id)[UIColor whiteColor].CGColor;
    fillColor.duration           = 4;
    fillColor.autoreverses       = YES;
    fillColor.fillMode = kCAFillModeForwards;
    fillColor.removedOnCompletion = NO;
    fillColor.repeatCount = CGFLOAT_MAX;
    [shapeLayer addAnimation:fillColor forKey:@"samuraiFillColorAnimation"];
}

- (CAReplicatorLayer *)canvasReplicatorLayer
{
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    [layer setFrame:self.bounds];
    [layer setInstanceCount:40];
    [layer setInstanceDelay:0.15];
    [layer setInstanceColor:[UIColor colorWithRed:0.509 green:1.000 blue:0.981 alpha:1.000].CGColor];
    [layer setInstanceGreenOffset:-0.03];
    
    return layer;
}

- (CALayer *)dotLayer
{
    CALayer *layer = [CALayer layer];
    [layer setBounds:CGRectMake(0, 0, 5, 5)];
    layer.borderWidth = 1;
    layer.cornerRadius = 2;
    layer.borderColor = [UIColor colorWithWhite:0.876 alpha:1.000].CGColor;
    layer.backgroundColor = [UIColor colorWithWhite:0.791 alpha:1.000].CGColor;
//    [layer setShouldRasterize:YES];
    [layer setRasterizationScale:[[UIScreen mainScreen] scale]];
    
    return layer;
}

- (UIBezierPath *)samuraiPath
{
    
    
    //// Text Drawing
    UIBezierPath* textPath = UIBezierPath.bezierPath;
    [textPath moveToPoint: CGPointMake(21.4, 44.08)];
    [textPath addLineToPoint: CGPointMake(21.12, 44.08)];
    [textPath addLineToPoint: CGPointMake(21.12, 132)];
    [textPath addLineToPoint: CGPointMake(11.6, 132)];
    [textPath addLineToPoint: CGPointMake(11.6, 31.2)];
    [textPath addLineToPoint: CGPointMake(22.38, 31.2)];
    [textPath addLineToPoint: CGPointMake(80.62, 119.26)];
    [textPath addLineToPoint: CGPointMake(80.9, 119.26)];
    [textPath addLineToPoint: CGPointMake(80.9, 31.2)];
    [textPath addLineToPoint: CGPointMake(90.42, 31.2)];
    [textPath addLineToPoint: CGPointMake(90.42, 132)];
    [textPath addLineToPoint: CGPointMake(79.36, 132)];
    [textPath addLineToPoint: CGPointMake(21.4, 44.08)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(140.54, 133.96)];
    [textPath addCurveToPoint: CGPointMake(127.45, 131.44) controlPoint1: CGPointMake(135.87, 133.87) controlPoint2: CGPointMake(131.51, 133.03)];
    [textPath addCurveToPoint: CGPointMake(116.81, 124.3) controlPoint1: CGPointMake(123.39, 129.85) controlPoint2: CGPointMake(119.84, 127.47)];
    [textPath addCurveToPoint: CGPointMake(109.6, 112.4) controlPoint1: CGPointMake(113.78, 121.13) controlPoint2: CGPointMake(111.37, 117.16)];
    [textPath addCurveToPoint: CGPointMake(106.94, 95.74) controlPoint1: CGPointMake(107.83, 107.64) controlPoint2: CGPointMake(106.94, 102.09)];
    [textPath addCurveToPoint: CGPointMake(109.04, 80.83) controlPoint1: CGPointMake(106.94, 90.42) controlPoint2: CGPointMake(107.64, 85.45)];
    [textPath addCurveToPoint: CGPointMake(115.34, 68.72) controlPoint1: CGPointMake(110.44, 76.21) controlPoint2: CGPointMake(112.54, 72.17)];
    [textPath addCurveToPoint: CGPointMake(125.84, 60.53) controlPoint1: CGPointMake(118.14, 65.27) controlPoint2: CGPointMake(121.64, 62.54)];
    [textPath addCurveToPoint: CGPointMake(140.54, 57.52) controlPoint1: CGPointMake(130.04, 58.52) controlPoint2: CGPointMake(134.94, 57.52)];
    [textPath addCurveToPoint: CGPointMake(155.38, 60.53) controlPoint1: CGPointMake(146.23, 57.52) controlPoint2: CGPointMake(151.18, 58.52)];
    [textPath addCurveToPoint: CGPointMake(165.88, 68.65) controlPoint1: CGPointMake(159.58, 62.54) controlPoint2: CGPointMake(163.08, 65.24)];
    [textPath addCurveToPoint: CGPointMake(172.11, 80.76) controlPoint1: CGPointMake(168.68, 72.06) controlPoint2: CGPointMake(170.76, 76.09)];
    [textPath addCurveToPoint: CGPointMake(174.14, 95.74) controlPoint1: CGPointMake(173.46, 85.43) controlPoint2: CGPointMake(174.14, 90.42)];
    [textPath addCurveToPoint: CGPointMake(171.76, 111.42) controlPoint1: CGPointMake(174.14, 101.53) controlPoint2: CGPointMake(173.35, 106.75)];
    [textPath addCurveToPoint: CGPointMake(164.97, 123.46) controlPoint1: CGPointMake(170.17, 116.09) controlPoint2: CGPointMake(167.91, 120.1)];
    [textPath addCurveToPoint: CGPointMake(154.33, 131.23) controlPoint1: CGPointMake(162.03, 126.82) controlPoint2: CGPointMake(158.48, 129.41)];
    [textPath addCurveToPoint: CGPointMake(140.54, 133.96) controlPoint1: CGPointMake(150.18, 133.05) controlPoint2: CGPointMake(145.58, 133.96)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(165.18, 95.74)];
    [textPath addCurveToPoint: CGPointMake(163.78, 83.7) controlPoint1: CGPointMake(165.18, 91.45) controlPoint2: CGPointMake(164.71, 87.43)];
    [textPath addCurveToPoint: CGPointMake(159.44, 73.97) controlPoint1: CGPointMake(162.85, 79.97) controlPoint2: CGPointMake(161.4, 76.72)];
    [textPath addCurveToPoint: CGPointMake(151.88, 67.46) controlPoint1: CGPointMake(157.48, 71.22) controlPoint2: CGPointMake(154.96, 69.05)];
    [textPath addCurveToPoint: CGPointMake(140.54, 65.08) controlPoint1: CGPointMake(148.8, 65.87) controlPoint2: CGPointMake(145.02, 65.08)];
    [textPath addCurveToPoint: CGPointMake(129.27, 67.67) controlPoint1: CGPointMake(136.15, 65.08) controlPoint2: CGPointMake(132.4, 65.94)];
    [textPath addCurveToPoint: CGPointMake(121.64, 74.53) controlPoint1: CGPointMake(126.14, 69.4) controlPoint2: CGPointMake(123.6, 71.68)];
    [textPath addCurveToPoint: CGPointMake(117.3, 84.33) controlPoint1: CGPointMake(119.68, 77.38) controlPoint2: CGPointMake(118.23, 80.64)];
    [textPath addCurveToPoint: CGPointMake(115.9, 95.74) controlPoint1: CGPointMake(116.37, 88.02) controlPoint2: CGPointMake(115.9, 91.82)];
    [textPath addCurveToPoint: CGPointMake(117.51, 108.13) controlPoint1: CGPointMake(115.9, 100.22) controlPoint2: CGPointMake(116.44, 104.35)];
    [textPath addCurveToPoint: CGPointMake(122.2, 117.86) controlPoint1: CGPointMake(118.58, 111.91) controlPoint2: CGPointMake(120.15, 115.15)];
    [textPath addCurveToPoint: CGPointMake(129.9, 124.16) controlPoint1: CGPointMake(124.25, 120.57) controlPoint2: CGPointMake(126.82, 122.67)];
    [textPath addCurveToPoint: CGPointMake(140.54, 126.4) controlPoint1: CGPointMake(132.98, 125.65) controlPoint2: CGPointMake(136.53, 126.4)];
    [textPath addCurveToPoint: CGPointMake(151.81, 123.81) controlPoint1: CGPointMake(144.93, 126.4) controlPoint2: CGPointMake(148.68, 125.54)];
    [textPath addCurveToPoint: CGPointMake(159.44, 116.88) controlPoint1: CGPointMake(154.94, 122.08) controlPoint2: CGPointMake(157.48, 119.77)];
    [textPath addCurveToPoint: CGPointMake(163.78, 107.08) controlPoint1: CGPointMake(161.4, 113.99) controlPoint2: CGPointMake(162.85, 110.72)];
    [textPath addCurveToPoint: CGPointMake(165.18, 95.74) controlPoint1: CGPointMake(164.71, 103.44) controlPoint2: CGPointMake(165.18, 99.66)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(300.98, 77.4)];
    [textPath addLineToPoint: CGPointMake(279.98, 77.4)];
    [textPath addLineToPoint: CGPointMake(279.98, 97.98)];
    [textPath addLineToPoint: CGPointMake(300.98, 97.98)];
    [textPath addLineToPoint: CGPointMake(300.98, 77.4)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(251.7, 117.02)];
    [textPath addLineToPoint: CGPointMake(241.9, 117.02)];
    [textPath addCurveToPoint: CGPointMake(242.81, 107.29) controlPoint1: CGPointMake(242.37, 113.47) controlPoint2: CGPointMake(242.67, 110.23)];
    [textPath addCurveToPoint: CGPointMake(243.02, 97.7) controlPoint1: CGPointMake(242.95, 104.35) controlPoint2: CGPointMake(243.02, 101.15)];
    [textPath addLineToPoint: CGPointMake(243.02, 56.82)];
    [textPath addCurveToPoint: CGPointMake(242.81, 48.91) controlPoint1: CGPointMake(243.02, 53.83) controlPoint2: CGPointMake(242.95, 51.2)];
    [textPath addCurveToPoint: CGPointMake(242.04, 41.7) controlPoint1: CGPointMake(242.67, 46.62) controlPoint2: CGPointMake(242.41, 44.22)];
    [textPath addCurveToPoint: CGPointMake(247.64, 42.33) controlPoint1: CGPointMake(244, 41.98) controlPoint2: CGPointMake(245.87, 42.19)];
    [textPath addCurveToPoint: CGPointMake(253.59, 42.68) controlPoint1: CGPointMake(249.41, 42.47) controlPoint2: CGPointMake(251.4, 42.59)];
    [textPath addCurveToPoint: CGPointMake(261.22, 42.89) controlPoint1: CGPointMake(255.78, 42.77) controlPoint2: CGPointMake(258.33, 42.84)];
    [textPath addCurveToPoint: CGPointMake(271.72, 42.96) controlPoint1: CGPointMake(264.11, 42.94) controlPoint2: CGPointMake(267.61, 42.96)];
    [textPath addCurveToPoint: CGPointMake(271.3, 25.32) controlPoint1: CGPointMake(271.72, 35.12) controlPoint2: CGPointMake(271.58, 29.24)];
    [textPath addCurveToPoint: CGPointMake(270.18, 17.2) controlPoint1: CGPointMake(271.02, 21.4) controlPoint2: CGPointMake(270.65, 18.69)];
    [textPath addCurveToPoint: CGPointMake(276.27, 17.97) controlPoint1: CGPointMake(272.42, 17.57) controlPoint2: CGPointMake(274.45, 17.83)];
    [textPath addCurveToPoint: CGPointMake(280.96, 18.18) controlPoint1: CGPointMake(278.09, 18.11) controlPoint2: CGPointMake(279.65, 18.18)];
    [textPath addCurveToPoint: CGPointMake(283.83, 18.88) controlPoint1: CGPointMake(282.55, 18.18) controlPoint2: CGPointMake(283.5, 18.41)];
    [textPath addCurveToPoint: CGPointMake(281.94, 20.98) controlPoint1: CGPointMake(284.16, 19.35) controlPoint2: CGPointMake(283.53, 20.05)];
    [textPath addCurveToPoint: CGPointMake(280.4, 23.85) controlPoint1: CGPointMake(281.19, 21.45) controlPoint2: CGPointMake(280.68, 22.4)];
    [textPath addCurveToPoint: CGPointMake(279.98, 31.06) controlPoint1: CGPointMake(280.12, 25.3) controlPoint2: CGPointMake(279.98, 27.7)];
    [textPath addLineToPoint: CGPointMake(279.98, 42.96)];
    [textPath addCurveToPoint: CGPointMake(291.67, 42.89) controlPoint1: CGPointMake(284.65, 42.96) controlPoint2: CGPointMake(288.54, 42.94)];
    [textPath addCurveToPoint: CGPointMake(299.65, 42.68) controlPoint1: CGPointMake(294.8, 42.84) controlPoint2: CGPointMake(297.46, 42.77)];
    [textPath addCurveToPoint: CGPointMake(305.46, 42.33) controlPoint1: CGPointMake(301.84, 42.59) controlPoint2: CGPointMake(303.78, 42.47)];
    [textPath addCurveToPoint: CGPointMake(310.64, 41.7) controlPoint1: CGPointMake(307.14, 42.19) controlPoint2: CGPointMake(308.87, 41.98)];
    [textPath addCurveToPoint: CGPointMake(309.66, 56.82) controlPoint1: CGPointMake(309.99, 45.53) controlPoint2: CGPointMake(309.66, 50.57)];
    [textPath addLineToPoint: CGPointMake(309.66, 99.66)];
    [textPath addCurveToPoint: CGPointMake(309.94, 107.64) controlPoint1: CGPointMake(309.66, 102.09) controlPoint2: CGPointMake(309.75, 104.75)];
    [textPath addCurveToPoint: CGPointMake(310.78, 116.04) controlPoint1: CGPointMake(310.13, 110.53) controlPoint2: CGPointMake(310.41, 113.33)];
    [textPath addLineToPoint: CGPointMake(300.98, 116.04)];
    [textPath addLineToPoint: CGPointMake(300.98, 104.7)];
    [textPath addLineToPoint: CGPointMake(279.98, 104.7)];
    [textPath addCurveToPoint: CGPointMake(280.05, 116.95) controlPoint1: CGPointMake(279.98, 109.18) controlPoint2: CGPointMake(280, 113.26)];
    [textPath addCurveToPoint: CGPointMake(280.26, 127.45) controlPoint1: CGPointMake(280.1, 120.64) controlPoint2: CGPointMake(280.17, 124.14)];
    [textPath addCurveToPoint: CGPointMake(280.61, 136.97) controlPoint1: CGPointMake(280.35, 130.76) controlPoint2: CGPointMake(280.47, 133.94)];
    [textPath addCurveToPoint: CGPointMake(281.1, 146.42) controlPoint1: CGPointMake(280.75, 140) controlPoint2: CGPointMake(280.91, 143.15)];
    [textPath addLineToPoint: CGPointMake(270.6, 146.42)];
    [textPath addCurveToPoint: CGPointMake(271.44, 127.24) controlPoint1: CGPointMake(270.97, 140.07) controlPoint2: CGPointMake(271.25, 133.68)];
    [textPath addCurveToPoint: CGPointMake(271.72, 104.7) controlPoint1: CGPointMake(271.63, 120.8) controlPoint2: CGPointMake(271.72, 113.29)];
    [textPath addLineToPoint: CGPointMake(251.7, 104.7)];
    [textPath addLineToPoint: CGPointMake(251.7, 117.02)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(251.7, 97.98)];
    [textPath addLineToPoint: CGPointMake(271.72, 97.98)];
    [textPath addLineToPoint: CGPointMake(271.72, 77.4)];
    [textPath addLineToPoint: CGPointMake(251.7, 77.4)];
    [textPath addLineToPoint: CGPointMake(251.7, 97.98)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(251.7, 49.4)];
    [textPath addLineToPoint: CGPointMake(251.7, 70.96)];
    [textPath addLineToPoint: CGPointMake(271.72, 70.96)];
    [textPath addLineToPoint: CGPointMake(271.72, 49.4)];
    [textPath addLineToPoint: CGPointMake(251.7, 49.4)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(300.98, 49.4)];
    [textPath addLineToPoint: CGPointMake(279.98, 49.4)];
    [textPath addLineToPoint: CGPointMake(279.98, 70.96)];
    [textPath addLineToPoint: CGPointMake(300.98, 70.96)];
    [textPath addLineToPoint: CGPointMake(300.98, 49.4)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(212.92, 84.4)];
    [textPath addCurveToPoint: CGPointMake(194.44, 100.5) controlPoint1: CGPointMake(207.23, 90.28) controlPoint2: CGPointMake(201.07, 95.65)];
    [textPath addCurveToPoint: CGPointMake(191.71, 96.79) controlPoint1: CGPointMake(193.51, 99.01) controlPoint2: CGPointMake(192.6, 97.77)];
    [textPath addCurveToPoint: CGPointMake(188.14, 93.64) controlPoint1: CGPointMake(190.82, 95.81) controlPoint2: CGPointMake(189.63, 94.76)];
    [textPath addCurveToPoint: CGPointMake(198.92, 85.94) controlPoint1: CGPointMake(191.59, 91.59) controlPoint2: CGPointMake(195.19, 89.02)];
    [textPath addCurveToPoint: CGPointMake(209.63, 76) controlPoint1: CGPointMake(202.65, 82.86) controlPoint2: CGPointMake(206.22, 79.55)];
    [textPath addCurveToPoint: CGPointMake(219.01, 64.87) controlPoint1: CGPointMake(213.04, 72.45) controlPoint2: CGPointMake(216.16, 68.74)];
    [textPath addCurveToPoint: CGPointMake(225.8, 53.46) controlPoint1: CGPointMake(221.86, 61) controlPoint2: CGPointMake(224.12, 57.19)];
    [textPath addCurveToPoint: CGPointMake(204.94, 53.95) controlPoint1: CGPointMake(217.03, 53.46) controlPoint2: CGPointMake(210.07, 53.62)];
    [textPath addCurveToPoint: CGPointMake(194.02, 55.28) controlPoint1: CGPointMake(199.81, 54.28) controlPoint2: CGPointMake(196.17, 54.72)];
    [textPath addLineToPoint: CGPointMake(194.02, 45.48)];
    [textPath addCurveToPoint: CGPointMake(203.89, 46.46) controlPoint1: CGPointMake(196.45, 45.95) controlPoint2: CGPointMake(199.74, 46.27)];
    [textPath addCurveToPoint: CGPointMake(216, 46.74) controlPoint1: CGPointMake(208.04, 46.65) controlPoint2: CGPointMake(212.08, 46.74)];
    [textPath addCurveToPoint: CGPointMake(223.7, 46.67) controlPoint1: CGPointMake(218.89, 46.74) controlPoint2: CGPointMake(221.46, 46.72)];
    [textPath addCurveToPoint: CGPointMake(229.72, 46.46) controlPoint1: CGPointMake(225.94, 46.62) controlPoint2: CGPointMake(227.95, 46.55)];
    [textPath addCurveToPoint: CGPointMake(234.41, 46.04) controlPoint1: CGPointMake(231.49, 46.37) controlPoint2: CGPointMake(233.06, 46.23)];
    [textPath addCurveToPoint: CGPointMake(238.26, 45.48) controlPoint1: CGPointMake(235.76, 45.85) controlPoint2: CGPointMake(237.05, 45.67)];
    [textPath addCurveToPoint: CGPointMake(236.58, 49.96) controlPoint1: CGPointMake(237.7, 47.07) controlPoint2: CGPointMake(237.14, 48.56)];
    [textPath addCurveToPoint: CGPointMake(234.69, 54.16) controlPoint1: CGPointMake(236.02, 51.36) controlPoint2: CGPointMake(235.39, 52.76)];
    [textPath addCurveToPoint: CGPointMake(232.38, 58.57) controlPoint1: CGPointMake(233.99, 55.56) controlPoint2: CGPointMake(233.22, 57.03)];
    [textPath addCurveToPoint: CGPointMake(229.3, 63.54) controlPoint1: CGPointMake(231.54, 60.11) controlPoint2: CGPointMake(230.51, 61.77)];
    [textPath addCurveToPoint: CGPointMake(225.38, 69.35) controlPoint1: CGPointMake(227.99, 65.59) controlPoint2: CGPointMake(226.69, 67.53)];
    [textPath addCurveToPoint: CGPointMake(221.32, 74.74) controlPoint1: CGPointMake(224.07, 71.17) controlPoint2: CGPointMake(222.72, 72.97)];
    [textPath addLineToPoint: CGPointMake(221.32, 75.44)];
    [textPath addCurveToPoint: CGPointMake(225.8, 79.85) controlPoint1: CGPointMake(222.91, 76.93) controlPoint2: CGPointMake(224.4, 78.4)];
    [textPath addCurveToPoint: CGPointMake(230, 84.33) controlPoint1: CGPointMake(227.2, 81.3) controlPoint2: CGPointMake(228.6, 82.79)];
    [textPath addCurveToPoint: CGPointMake(234.41, 89.23) controlPoint1: CGPointMake(231.4, 85.87) controlPoint2: CGPointMake(232.87, 87.5)];
    [textPath addCurveToPoint: CGPointMake(239.38, 94.9) controlPoint1: CGPointMake(235.95, 90.96) controlPoint2: CGPointMake(237.61, 92.85)];
    [textPath addLineToPoint: CGPointMake(232.52, 101.2)];
    [textPath addCurveToPoint: CGPointMake(227.2, 93.71) controlPoint1: CGPointMake(230.65, 98.49) controlPoint2: CGPointMake(228.88, 96)];
    [textPath addCurveToPoint: CGPointMake(221.32, 86.08) controlPoint1: CGPointMake(225.52, 91.42) controlPoint2: CGPointMake(223.56, 88.88)];
    [textPath addLineToPoint: CGPointMake(221.32, 122.76)];
    [textPath addCurveToPoint: CGPointMake(221.53, 134.45) controlPoint1: CGPointMake(221.32, 126.96) controlPoint2: CGPointMake(221.39, 130.86)];
    [textPath addCurveToPoint: CGPointMake(222.3, 146.14) controlPoint1: CGPointMake(221.67, 138.04) controlPoint2: CGPointMake(221.93, 141.94)];
    [textPath addLineToPoint: CGPointMake(211.94, 146.14)];
    [textPath addCurveToPoint: CGPointMake(212.71, 134.31) controlPoint1: CGPointMake(212.31, 141.75) controlPoint2: CGPointMake(212.57, 137.81)];
    [textPath addCurveToPoint: CGPointMake(212.92, 122.76) controlPoint1: CGPointMake(212.85, 130.81) controlPoint2: CGPointMake(212.92, 126.96)];
    [textPath addLineToPoint: CGPointMake(212.92, 84.4)];
    [textPath closePath];
    [textPath moveToPoint: CGPointMake(221.74, 42.54)];
    [textPath addCurveToPoint: CGPointMake(214.32, 33.3) controlPoint1: CGPointMake(219.31, 39.18) controlPoint2: CGPointMake(216.84, 36.1)];
    [textPath addCurveToPoint: CGPointMake(204.52, 24.2) controlPoint1: CGPointMake(211.8, 30.5) controlPoint2: CGPointMake(208.53, 27.47)];
    [textPath addLineToPoint: CGPointMake(210.26, 18.74)];
    [textPath addCurveToPoint: CGPointMake(215.58, 23.36) controlPoint1: CGPointMake(212.22, 20.42) controlPoint2: CGPointMake(213.99, 21.96)];
    [textPath addCurveToPoint: CGPointMake(220.06, 27.56) controlPoint1: CGPointMake(217.17, 24.76) controlPoint2: CGPointMake(218.66, 26.16)];
    [textPath addCurveToPoint: CGPointMake(224.12, 31.83) controlPoint1: CGPointMake(221.46, 28.96) controlPoint2: CGPointMake(222.81, 30.38)];
    [textPath addCurveToPoint: CGPointMake(228.32, 36.66) controlPoint1: CGPointMake(225.43, 33.28) controlPoint2: CGPointMake(226.83, 34.89)];
    [textPath addLineToPoint: CGPointMake(221.74, 42.54)];
    [textPath closePath];
    textPath.lineCapStyle = kCGLineCapRound;
    
    textPath.lineJoinStyle = kCGLineJoinRound;
    
    [UIColor.blackColor setFill];
    [textPath fill];

    return textPath;
}

@end
