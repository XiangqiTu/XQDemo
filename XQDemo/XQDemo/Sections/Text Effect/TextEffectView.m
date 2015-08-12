//
//  TextEffectView.m
//
//  Code generated using QuartzCode 1.21 on 15-8-4.
//  www.quartzcodeapp.com
//

#import "TextEffectView.h"
#import "QCMethod.h"


@interface TextEffectView ()

@property (nonatomic, strong) CALayer *text;
@property (nonatomic, strong) CALayer *text2;

@end

@implementation TextEffectView

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		[self setupLayers];
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		[self setupLayers];
	}
	return self;
}


- (void)setupLayers{
	UIView*  aView        = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
	aView.backgroundColor = [UIColor blackColor];
	[self addSubview:aView];
	{
		CALayer * text = [CALayer layer];
		text.frame = CGRectMake(22.63, 160.5, 274.74, 55.05);
		[aView.layer addSublayer:text];
		_text = text;
		//text effect layer setup
		{
			CAShapeLayer * path = [CAShapeLayer layer];
			path.frame     = CGRectMake(-0, 19.95, 31.5, 33.75);
			path.opacity   = 0;
			path.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path.lineWidth = 0;
			path.path      = [self pathPath].CGPath;
			[text addSublayer:path];
			
			CAShapeLayer * path2 = [CAShapeLayer layer];
			path2.frame     = CGRectMake(31.5, 11.25, 55.2, 40.5);
			path2.opacity   = 0;
			path2.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path2.lineWidth = 0;
			path2.path      = [self path2Path].CGPath;
			[text addSublayer:path2];
			
			CAShapeLayer * path3 = [CAShapeLayer layer];
			path3.frame     = CGRectMake(73.65, 13.8, 61.44, 36.75);
			path3.opacity   = 0;
			path3.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path3.lineWidth = 0;
			path3.path      = [self path3Path].CGPath;
			[text addSublayer:path3];
			
			CAShapeLayer * path4 = [CAShapeLayer layer];
			path4.frame     = CGRectMake(129.3, 13.8, 47.25, 36.75);
			path4.opacity   = 0;
			path4.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path4.lineWidth = 0;
			path4.path      = [self path4Path].CGPath;
			[text addSublayer:path4];
			
			CAShapeLayer * path5 = [CAShapeLayer layer];
			path5.frame     = CGRectMake(165, 21, 37.5, 33.45);
			path5.opacity   = 0;
			path5.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path5.lineWidth = 0;
			path5.path      = [self path5Path].CGPath;
			[text addSublayer:path5];
			
			CAShapeLayer * path6 = [CAShapeLayer layer];
			path6.frame     = CGRectMake(193.35, 11.25, 55.2, 40.5);
			path6.opacity   = 0;
			path6.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path6.lineWidth = 0;
			path6.path      = [self path6Path].CGPath;
			[text addSublayer:path6];
			
			CAShapeLayer * path7 = [CAShapeLayer layer];
			path7.frame     = CGRectMake(239.25, 0, 35.49, 55.05);
			path7.opacity   = 0;
			path7.fillColor = [UIColor colorWithRed:1 green: 0.969 blue:0.965 alpha:1].CGColor;
			path7.lineWidth = 0;
			path7.path      = [self path7Path].CGPath;
			[text addSublayer:path7];
			
		}
		
		
		CALayer * text2 = [CALayer layer];
		text2.frame = CGRectMake(26.56, 79.81, 264.42, 40.75);
		[aView.layer addSublayer:text2];
		_text2 = text2;
		//text2 effect layer setup
		{
			CAShapeLayer * path8 = [CAShapeLayer layer];
			path8.frame           = CGRectMake(-0, 1, 30.37, 39.75);
			path8.opacity         = 0;
			path8.fillColor       = nil;
			path8.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path8.lineDashPattern = @[@6, @1];
			path8.lineDashPhase   = 1;
			path8.path            = [self path8Path].CGPath;
			[text2 addSublayer:path8];
			
			CAShapeLayer * path9 = [CAShapeLayer layer];
			path9.frame           = CGRectMake(39.48, 9.27, 27.82, 30.48);
			path9.opacity         = 0;
			path9.fillColor       = nil;
			path9.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path9.lineDashPattern = @[@6, @1];
			path9.lineDashPhase   = 1;
			path9.path            = [self path9Path].CGPath;
			[text2 addSublayer:path9];
			
			CAShapeLayer * path10 = [CAShapeLayer layer];
			path10.frame           = CGRectMake(76.58, 9.94, 23.85, 29.81);
			path10.opacity         = 0;
			path10.fillColor       = nil;
			path10.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path10.lineDashPattern = @[@6, @1];
			path10.lineDashPhase   = 1;
			path10.path            = [self path10Path].CGPath;
			[text2 addSublayer:path10];
			
			CAShapeLayer * path11 = [CAShapeLayer layer];
			path11.frame           = CGRectMake(109.4, 9.27, 27.82, 30.48);
			path11.opacity         = 0;
			path11.fillColor       = nil;
			path11.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path11.lineDashPattern = @[@6, @1];
			path11.lineDashPhase   = 1;
			path11.path            = [self path11Path].CGPath;
			[text2 addSublayer:path11];
			
			CAShapeLayer * path12 = [CAShapeLayer layer];
			path12.frame           = CGRectMake(146.5, 9.91, 41.09, 29.84);
			path12.opacity         = 0;
			path12.fillColor       = nil;
			path12.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path12.lineDashPattern = @[@6, @1];
			path12.lineDashPhase   = 1;
			path12.path            = [self path12Path].CGPath;
			[text2 addSublayer:path12];
			
			CAShapeLayer * path13 = [CAShapeLayer layer];
			path13.frame           = CGRectMake(196.53, 9.27, 27.82, 30.48);
			path13.opacity         = 0;
			path13.fillColor       = nil;
			path13.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path13.lineDashPattern = @[@6, @1];
			path13.lineDashPhase   = 1;
			path13.path            = [self path13Path].CGPath;
			[text2 addSublayer:path13];
			
			CAShapeLayer * path14 = [CAShapeLayer layer];
			path14.frame           = CGRectMake(233.63, 9.94, 16.11, 29.81);
			path14.opacity         = 0;
			path14.fillColor       = nil;
			path14.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path14.lineDashPattern = @[@6, @1];
			path14.lineDashPhase   = 1;
			path14.path            = [self path14Path].CGPath;
			[text2 addSublayer:path14];
			
			CAShapeLayer * path15 = [CAShapeLayer layer];
			path15.frame           = CGRectMake(259.13, 0, 5.29, 39.75);
			path15.opacity         = 0;
			path15.fillColor       = nil;
			path15.strokeColor     = [UIColor colorWithRed:1 green: 0.999 blue:0.982 alpha:1].CGColor;
			path15.lineDashPattern = @[@6, @1];
			path15.lineDashPhase   = 1;
			path15.path            = [self path15Path].CGPath;
			[text2 addSublayer:path15];
			
		}
		
		
	}
	
}


- (IBAction)startAllAnimations:(id)sender{
	
	[QCMethod addSublayersAnimation:[self textSublayersAnimation] forKey:@"textSublayersAnimation" forLayer:self.text];
	[QCMethod addSublayersAnimation:[self text2SublayersAnimation] forKey:@"text2SublayersAnimation" forLayer:self.text2];
}

- (CAAnimationGroup*)textSublayersAnimation{
	CABasicAnimation * transformAnim = [CABasicAnimation animationWithKeyPath:@"transform"];
	transformAnim.fromValue          = [NSValue valueWithCATransform3D:CATransform3DConcat(CATransform3DMakeScale(0, 0, 0), CATransform3DMakeTranslation(0, 55, 0))];;
	transformAnim.toValue            = [NSValue valueWithCATransform3D:CATransform3DIdentity];;
	transformAnim.duration           = 1.2;
	transformAnim.timingFunction     = [CAMediaTimingFunction functionWithControlPoints:0.0578 :-3.95 :0.465 :2.94];
	[transformAnim setValue:@0.25 forKeyPath:@"instanceDelay"];
	[transformAnim setValue:@1 forKeyPath:@"instanceOrder"];
	
	CABasicAnimation * opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacityAnim.fromValue          = @0;
	opacityAnim.toValue            = @1;
	opacityAnim.duration           = 1.2;
	[opacityAnim setValue:@0.24 forKeyPath:@"instanceDelay"];
	[opacityAnim setValue:@1 forKeyPath:@"instanceOrder"];
	
	CAAnimationGroup *text2AnimGroup   = [CAAnimationGroup animation];
	text2AnimGroup.animations          = @[transformAnim, opacityAnim];
	[text2AnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	text2AnimGroup.fillMode            = kCAFillModeForwards;
	text2AnimGroup.removedOnCompletion = NO;
	text2AnimGroup.duration = [QCMethod maxDurationOfEffectAnimation:text2AnimGroup sublayersCount:_text.sublayers.count];
	
	return text2AnimGroup;
}



- (CAAnimationGroup*)text2SublayersAnimation{
	CABasicAnimation * opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacityAnim.toValue            = @1;
	opacityAnim.duration           = 0.7;
	[opacityAnim setValue:@0.35 forKeyPath:@"instanceDelay"];
	[opacityAnim setValue:@0 forKeyPath:@"instanceOrder"];
	
	CABasicAnimation * strokeEndAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
	strokeEndAnim.fromValue          = @0;
	strokeEndAnim.duration           = 0.7;
	[strokeEndAnim setValue:@0.35 forKeyPath:@"instanceDelay"];
	[strokeEndAnim setValue:@0 forKeyPath:@"instanceOrder"];
	
	CAAnimationGroup *textAnimGroup   = [CAAnimationGroup animation];
	textAnimGroup.animations          = @[opacityAnim, strokeEndAnim];
	[textAnimGroup.animations setValue:kCAFillModeForwards forKeyPath:@"fillMode"];
	textAnimGroup.fillMode            = kCAFillModeForwards;
	textAnimGroup.removedOnCompletion = NO;
	textAnimGroup.duration = [QCMethod maxDurationOfEffectAnimation:textAnimGroup sublayersCount:_text2.sublayers.count];
	
	
	return textAnimGroup;
}

#pragma mark - Bezier Path

- (UIBezierPath*)pathPath{
	UIBezierPath *pathPath = [UIBezierPath bezierPath];
	[pathPath moveToPoint:CGPointMake(29.85, 4.95)];
	[pathPath addCurveToPoint:CGPointMake(29.1, 5.1) controlPoint1:CGPointMake(29.55, 5.45) controlPoint2:CGPointMake(29.3, 5.5)];
	[pathPath addCurveToPoint:CGPointMake(25.35, 3.15) controlPoint1:CGPointMake(28.5, 3.8) controlPoint2:CGPointMake(27.25, 3.15)];
	[pathPath addCurveToPoint:CGPointMake(21.15, 4.35) controlPoint1:CGPointMake(23.95, 3.15) controlPoint2:CGPointMake(22.55, 3.55)];
	[pathPath addCurveToPoint:CGPointMake(19.05, 7.95) controlPoint1:CGPointMake(19.75, 5.15) controlPoint2:CGPointMake(19.05, 6.35)];
	[pathPath addCurveToPoint:CGPointMake(19.8, 10.35) controlPoint1:CGPointMake(19.05, 8.75) controlPoint2:CGPointMake(19.3, 9.55)];
	[pathPath addCurveToPoint:CGPointMake(21.9, 13.5) controlPoint1:CGPointMake(20.3, 11.15) controlPoint2:CGPointMake(21, 12.2)];
	[pathPath addCurveToPoint:CGPointMake(24.15, 17.1) controlPoint1:CGPointMake(22.7, 14.7) controlPoint2:CGPointMake(23.45, 15.9)];
	[pathPath addCurveToPoint:CGPointMake(25.2, 20.85) controlPoint1:CGPointMake(24.85, 18.3) controlPoint2:CGPointMake(25.2, 19.55)];
	[pathPath addCurveToPoint:CGPointMake(23.4, 27.225) controlPoint1:CGPointMake(25.2, 23.45) controlPoint2:CGPointMake(24.6, 25.575)];
	[pathPath addCurveToPoint:CGPointMake(19.125, 31.2) controlPoint1:CGPointMake(22.2, 28.875) controlPoint2:CGPointMake(20.775, 30.2)];
	[pathPath addCurveToPoint:CGPointMake(14.1, 33.225) controlPoint1:CGPointMake(17.475, 32.2) controlPoint2:CGPointMake(15.8, 32.875)];
	[pathPath addCurveToPoint:CGPointMake(10.05, 33.75) controlPoint1:CGPointMake(12.4, 33.575) controlPoint2:CGPointMake(11.05, 33.75)];
	[pathPath addCurveToPoint:CGPointMake(0, 27.6) controlPoint1:CGPointMake(3.95, 33.75) controlPoint2:CGPointMake(0.6, 31.7)];
	[pathPath addCurveToPoint:CGPointMake(1.725, 26.475) controlPoint1:CGPointMake(0.5, 27.3) controlPoint2:CGPointMake(1.075, 26.925)];
	[pathPath addCurveToPoint:CGPointMake(3.15, 25.2) controlPoint1:CGPointMake(2.375, 26.025) controlPoint2:CGPointMake(2.85, 25.6)];
	[pathPath addCurveToPoint:CGPointMake(3.6, 25.8) controlPoint1:CGPointMake(3.35, 25.2) controlPoint2:CGPointMake(3.5, 25.4)];
	[pathPath addCurveToPoint:CGPointMake(6.45, 30.45) controlPoint1:CGPointMake(4.1, 27.6) controlPoint2:CGPointMake(5.05, 29.15)];
	[pathPath addCurveToPoint:CGPointMake(11.4, 32.4) controlPoint1:CGPointMake(7.85, 31.75) controlPoint2:CGPointMake(9.5, 32.4)];
	[pathPath addCurveToPoint:CGPointMake(14.25, 32.175) controlPoint1:CGPointMake(12.2, 32.4) controlPoint2:CGPointMake(13.15, 32.325)];
	[pathPath addCurveToPoint:CGPointMake(17.325, 31.125) controlPoint1:CGPointMake(15.35, 32.025) controlPoint2:CGPointMake(16.375, 31.675)];
	[pathPath addCurveToPoint:CGPointMake(19.8, 28.8) controlPoint1:CGPointMake(18.275, 30.575) controlPoint2:CGPointMake(19.1, 29.8)];
	[pathPath addCurveToPoint:CGPointMake(20.85, 24.75) controlPoint1:CGPointMake(20.5, 27.8) controlPoint2:CGPointMake(20.85, 26.45)];
	[pathPath addCurveToPoint:CGPointMake(20.1, 21.15) controlPoint1:CGPointMake(20.85, 23.45) controlPoint2:CGPointMake(20.6, 22.25)];
	[pathPath addCurveToPoint:CGPointMake(18.45, 18.15) controlPoint1:CGPointMake(19.6, 20.05) controlPoint2:CGPointMake(19.05, 19.05)];
	[pathPath addCurveToPoint:CGPointMake(16.65, 15.15) controlPoint1:CGPointMake(17.85, 17.15) controlPoint2:CGPointMake(17.25, 16.15)];
	[pathPath addCurveToPoint:CGPointMake(15.75, 11.85) controlPoint1:CGPointMake(16.05, 14.15) controlPoint2:CGPointMake(15.75, 13.05)];
	[pathPath addCurveToPoint:CGPointMake(17.025, 7.95) controlPoint1:CGPointMake(15.75, 10.65) controlPoint2:CGPointMake(16.175, 9.35)];
	[pathPath addCurveToPoint:CGPointMake(20.25, 4.125) controlPoint1:CGPointMake(17.875, 6.55) controlPoint2:CGPointMake(18.95, 5.275)];
	[pathPath addCurveToPoint:CGPointMake(24.525, 1.2) controlPoint1:CGPointMake(21.55, 2.975) controlPoint2:CGPointMake(22.975, 2)];
	[pathPath addCurveToPoint:CGPointMake(29.1, 0) controlPoint1:CGPointMake(26.075, 0.4) controlPoint2:CGPointMake(27.6, 0)];
	[pathPath addCurveToPoint:CGPointMake(31.5, 1.5) controlPoint1:CGPointMake(30.7, 0) controlPoint2:CGPointMake(31.5, 0.5)];
	[pathPath addCurveToPoint:CGPointMake(30.6, 3.225) controlPoint1:CGPointMake(31.2, 2) controlPoint2:CGPointMake(30.9, 2.575)];
	[pathPath addCurveToPoint:CGPointMake(29.85, 4.95) controlPoint1:CGPointMake(30.3, 3.875) controlPoint2:CGPointMake(30.05, 4.45)];
	[pathPath closePath];
	[pathPath moveToPoint:CGPointMake(29.85, 4.95)];
	
	return pathPath;
}

- (UIBezierPath*)path2Path{
	UIBezierPath *path2Path = [UIBezierPath bezierPath];
	[path2Path moveToPoint:CGPointMake(55.2, 16.65)];
	[path2Path addCurveToPoint:CGPointMake(47.625, 25.125) controlPoint1:CGPointMake(52.9, 19.45) controlPoint2:CGPointMake(50.375, 22.275)];
	[path2Path addCurveToPoint:CGPointMake(39.3, 32.85) controlPoint1:CGPointMake(44.875, 27.975) controlPoint2:CGPointMake(42.1, 30.55)];
	[path2Path addCurveToPoint:CGPointMake(30.975, 38.4) controlPoint1:CGPointMake(36.5, 35.15) controlPoint2:CGPointMake(33.725, 37)];
	[path2Path addCurveToPoint:CGPointMake(23.4, 40.5) controlPoint1:CGPointMake(28.225, 39.8) controlPoint2:CGPointMake(25.7, 40.5)];
	[path2Path addCurveToPoint:CGPointMake(19.2, 39) controlPoint1:CGPointMake(21.4, 40.5) controlPoint2:CGPointMake(20, 40)];
	[path2Path addCurveToPoint:CGPointMake(18, 35.25) controlPoint1:CGPointMake(18.4, 38) controlPoint2:CGPointMake(18, 36.75)];
	[path2Path addCurveToPoint:CGPointMake(19.275, 29.625) controlPoint1:CGPointMake(18, 33.85) controlPoint2:CGPointMake(18.425, 31.975)];
	[path2Path addCurveToPoint:CGPointMake(23.1, 22.05) controlPoint1:CGPointMake(20.125, 27.275) controlPoint2:CGPointMake(21.4, 24.75)];
	[path2Path addCurveToPoint:CGPointMake(18.6, 27.45) controlPoint1:CGPointMake(21.8, 23.75) controlPoint2:CGPointMake(20.3, 25.55)];
	[path2Path addCurveToPoint:CGPointMake(13.35, 32.625) controlPoint1:CGPointMake(16.9, 29.35) controlPoint2:CGPointMake(15.15, 31.075)];
	[path2Path addCurveToPoint:CGPointMake(7.95, 36.525) controlPoint1:CGPointMake(11.55, 34.175) controlPoint2:CGPointMake(9.75, 35.475)];
	[path2Path addCurveToPoint:CGPointMake(3.15, 38.1) controlPoint1:CGPointMake(6.15, 37.575) controlPoint2:CGPointMake(4.55, 38.1)];
	[path2Path addCurveToPoint:CGPointMake(0, 34.95) controlPoint1:CGPointMake(1.05, 38.1) controlPoint2:CGPointMake(0, 37.05)];
	[path2Path addCurveToPoint:CGPointMake(2.7, 26.25) controlPoint1:CGPointMake(0, 32.65) controlPoint2:CGPointMake(0.9, 29.75)];
	[path2Path addCurveToPoint:CGPointMake(9.975, 16.125) controlPoint1:CGPointMake(4.5, 22.75) controlPoint2:CGPointMake(6.925, 19.375)];
	[path2Path addCurveToPoint:CGPointMake(20.4, 7.725) controlPoint1:CGPointMake(13.025, 12.875) controlPoint2:CGPointMake(16.5, 10.075)];
	[path2Path addCurveToPoint:CGPointMake(32.55, 4.2) controlPoint1:CGPointMake(24.3, 5.375) controlPoint2:CGPointMake(28.35, 4.2)];
	[path2Path addCurveToPoint:CGPointMake(33.9, 2.1) controlPoint1:CGPointMake(33.05, 3.2) controlPoint2:CGPointMake(33.5, 2.5)];
	[path2Path addCurveToPoint:CGPointMake(35.1, 1.2) controlPoint1:CGPointMake(34.3, 1.7) controlPoint2:CGPointMake(34.7, 1.4)];
	[path2Path addLineToPoint:CGPointMake(39.3, 0)];
	[path2Path addLineToPoint:CGPointMake(39.6, 0.15)];
	[path2Path addCurveToPoint:CGPointMake(38.175, 2.025) controlPoint1:CGPointMake(39.1, 0.65) controlPoint2:CGPointMake(38.625, 1.275)];
	[path2Path addCurveToPoint:CGPointMake(36.75, 4.35) controlPoint1:CGPointMake(37.725, 2.775) controlPoint2:CGPointMake(37.25, 3.55)];
	[path2Path addCurveToPoint:CGPointMake(39, 4.5) controlPoint1:CGPointMake(37.25, 4.35) controlPoint2:CGPointMake(38, 4.4)];
	[path2Path addCurveToPoint:CGPointMake(41.25, 4.8) controlPoint1:CGPointMake(40, 4.6) controlPoint2:CGPointMake(40.75, 4.7)];
	[path2Path addCurveToPoint:CGPointMake(42, 5.55) controlPoint1:CGPointMake(41.75, 5) controlPoint2:CGPointMake(42, 5.25)];
	[path2Path addCurveToPoint:CGPointMake(41.55, 6) controlPoint1:CGPointMake(42, 5.85) controlPoint2:CGPointMake(41.85, 6)];
	[path2Path addCurveToPoint:CGPointMake(38.85, 5.55) controlPoint1:CGPointMake(40.95, 5.8) controlPoint2:CGPointMake(40.05, 5.65)];
	[path2Path addCurveToPoint:CGPointMake(36.15, 5.4) controlPoint1:CGPointMake(37.65, 5.45) controlPoint2:CGPointMake(36.75, 5.4)];
	[path2Path addCurveToPoint:CGPointMake(26.025, 24.675) controlPoint1:CGPointMake(31.55, 13.5) controlPoint2:CGPointMake(28.175, 19.925)];
	[path2Path addCurveToPoint:CGPointMake(22.8, 35.25) controlPoint1:CGPointMake(23.875, 29.425) controlPoint2:CGPointMake(22.8, 32.95)];
	[path2Path addCurveToPoint:CGPointMake(23.475, 37.5) controlPoint1:CGPointMake(22.8, 36.15) controlPoint2:CGPointMake(23.025, 36.9)];
	[path2Path addCurveToPoint:CGPointMake(26.25, 38.4) controlPoint1:CGPointMake(23.925, 38.1) controlPoint2:CGPointMake(24.85, 38.4)];
	[path2Path addCurveToPoint:CGPointMake(31.95, 36.675) controlPoint1:CGPointMake(27.85, 38.4) controlPoint2:CGPointMake(29.75, 37.825)];
	[path2Path addCurveToPoint:CGPointMake(39, 31.875) controlPoint1:CGPointMake(34.15, 35.525) controlPoint2:CGPointMake(36.5, 33.925)];
	[path2Path addCurveToPoint:CGPointMake(46.725, 24.75) controlPoint1:CGPointMake(41.5, 29.825) controlPoint2:CGPointMake(44.075, 27.45)];
	[path2Path addCurveToPoint:CGPointMake(54.3, 16.2) controlPoint1:CGPointMake(49.375, 22.05) controlPoint2:CGPointMake(51.9, 19.2)];
	[path2Path addCurveToPoint:CGPointMake(54.9, 15.975) controlPoint1:CGPointMake(54.5, 15.9) controlPoint2:CGPointMake(54.7, 15.825)];
	[path2Path addCurveToPoint:CGPointMake(55.2, 16.65) controlPoint1:CGPointMake(55.1, 16.125) controlPoint2:CGPointMake(55.2, 16.35)];
	[path2Path closePath];
	[path2Path moveToPoint:CGPointMake(31.8, 5.25)];
	[path2Path addCurveToPoint:CGPointMake(22.05, 8.85) controlPoint1:CGPointMake(28.4, 5.25) controlPoint2:CGPointMake(25.15, 6.45)];
	[path2Path addCurveToPoint:CGPointMake(13.8, 17.325) controlPoint1:CGPointMake(18.95, 11.25) controlPoint2:CGPointMake(16.2, 14.075)];
	[path2Path addCurveToPoint:CGPointMake(8.025, 27) controlPoint1:CGPointMake(11.4, 20.575) controlPoint2:CGPointMake(9.475, 23.8)];
	[path2Path addCurveToPoint:CGPointMake(5.85, 34.05) controlPoint1:CGPointMake(6.575, 30.2) controlPoint2:CGPointMake(5.85, 32.55)];
	[path2Path addCurveToPoint:CGPointMake(6.75, 35.25) controlPoint1:CGPointMake(5.85, 34.85) controlPoint2:CGPointMake(6.15, 35.25)];
	[path2Path addCurveToPoint:CGPointMake(9.525, 34.05) controlPoint1:CGPointMake(7.35, 35.25) controlPoint2:CGPointMake(8.275, 34.85)];
	[path2Path addCurveToPoint:CGPointMake(13.8, 30.825) controlPoint1:CGPointMake(10.775, 33.25) controlPoint2:CGPointMake(12.2, 32.175)];
	[path2Path addCurveToPoint:CGPointMake(18.675, 26.1) controlPoint1:CGPointMake(15.4, 29.475) controlPoint2:CGPointMake(17.025, 27.9)];
	[path2Path addCurveToPoint:CGPointMake(23.25, 20.25) controlPoint1:CGPointMake(20.325, 24.3) controlPoint2:CGPointMake(21.85, 22.35)];
	[path2Path addCurveToPoint:CGPointMake(27.9, 12.6) controlPoint1:CGPointMake(24.85, 17.85) controlPoint2:CGPointMake(26.4, 15.3)];
	[path2Path addCurveToPoint:CGPointMake(31.95, 5.4) controlPoint1:CGPointMake(29.4, 9.9) controlPoint2:CGPointMake(30.75, 7.5)];
	[path2Path closePath];
	[path2Path moveToPoint:CGPointMake(31.8, 5.25)];
	
	return path2Path;
}

- (UIBezierPath*)path3Path{
	UIBezierPath *path3Path = [UIBezierPath bezierPath];
	[path3Path moveToPoint:CGPointMake(60.9, 19.35)];
	[path3Path addCurveToPoint:CGPointMake(55.875, 24.75) controlPoint1:CGPointMake(59.5, 20.95) controlPoint2:CGPointMake(57.825, 22.75)];
	[path3Path addCurveToPoint:CGPointMake(49.65, 30.45) controlPoint1:CGPointMake(53.925, 26.75) controlPoint2:CGPointMake(51.85, 28.65)];
	[path3Path addCurveToPoint:CGPointMake(42.825, 34.95) controlPoint1:CGPointMake(47.45, 32.25) controlPoint2:CGPointMake(45.175, 33.75)];
	[path3Path addCurveToPoint:CGPointMake(36, 36.75) controlPoint1:CGPointMake(40.475, 36.15) controlPoint2:CGPointMake(38.2, 36.75)];
	[path3Path addCurveToPoint:CGPointMake(31.8, 35.55) controlPoint1:CGPointMake(34, 36.75) controlPoint2:CGPointMake(32.6, 36.35)];
	[path3Path addCurveToPoint:CGPointMake(30.6, 31.8) controlPoint1:CGPointMake(31, 34.75) controlPoint2:CGPointMake(30.6, 33.5)];
	[path3Path addCurveToPoint:CGPointMake(32.325, 26.4) controlPoint1:CGPointMake(30.6, 30.7) controlPoint2:CGPointMake(31.175, 28.9)];
	[path3Path addCurveToPoint:CGPointMake(36.15, 18.6) controlPoint1:CGPointMake(33.475, 23.9) controlPoint2:CGPointMake(34.75, 21.3)];
	[path3Path addCurveToPoint:CGPointMake(39.975, 10.875) controlPoint1:CGPointMake(37.55, 15.9) controlPoint2:CGPointMake(38.825, 13.325)];
	[path3Path addCurveToPoint:CGPointMake(41.7, 5.7) controlPoint1:CGPointMake(41.125, 8.425) controlPoint2:CGPointMake(41.7, 6.7)];
	[path3Path addCurveToPoint:CGPointMake(40.95, 4.8) controlPoint1:CGPointMake(41.7, 5.1) controlPoint2:CGPointMake(41.45, 4.8)];
	[path3Path addCurveToPoint:CGPointMake(36.525, 7.875) controlPoint1:CGPointMake(39.65, 5.5) controlPoint2:CGPointMake(38.175, 6.525)];
	[path3Path addCurveToPoint:CGPointMake(31.65, 12.3) controlPoint1:CGPointMake(34.875, 9.225) controlPoint2:CGPointMake(33.25, 10.7)];
	[path3Path addCurveToPoint:CGPointMake(27.225, 16.95) controlPoint1:CGPointMake(30.05, 13.9) controlPoint2:CGPointMake(28.575, 15.45)];
	[path3Path addCurveToPoint:CGPointMake(24.15, 20.7) controlPoint1:CGPointMake(25.875, 18.45) controlPoint2:CGPointMake(24.85, 19.7)];
	[path3Path addCurveToPoint:CGPointMake(22.05, 24.3) controlPoint1:CGPointMake(23.45, 21.7) controlPoint2:CGPointMake(22.75, 22.9)];
	[path3Path addCurveToPoint:CGPointMake(20.025, 28.35) controlPoint1:CGPointMake(21.35, 25.7) controlPoint2:CGPointMake(20.675, 27.05)];
	[path3Path addCurveToPoint:CGPointMake(18.075, 31.65) controlPoint1:CGPointMake(19.375, 29.65) controlPoint2:CGPointMake(18.725, 30.75)];
	[path3Path addCurveToPoint:CGPointMake(16.35, 33) controlPoint1:CGPointMake(17.425, 32.55) controlPoint2:CGPointMake(16.85, 33)];
	[path3Path addCurveToPoint:CGPointMake(15, 32.25) controlPoint1:CGPointMake(15.85, 33) controlPoint2:CGPointMake(15.4, 32.75)];
	[path3Path addCurveToPoint:CGPointMake(14.4, 30.75) controlPoint1:CGPointMake(14.6, 31.75) controlPoint2:CGPointMake(14.4, 31.25)];
	[path3Path addCurveToPoint:CGPointMake(14.85, 29.175) controlPoint1:CGPointMake(14.4, 30.45) controlPoint2:CGPointMake(14.55, 29.925)];
	[path3Path addCurveToPoint:CGPointMake(16.5, 26.4) controlPoint1:CGPointMake(15.15, 28.425) controlPoint2:CGPointMake(15.7, 27.5)];
	[path3Path addCurveToPoint:CGPointMake(20.025, 20.7) controlPoint1:CGPointMake(17.8, 24.6) controlPoint2:CGPointMake(18.975, 22.7)];
	[path3Path addCurveToPoint:CGPointMake(22.725, 15.15) controlPoint1:CGPointMake(21.075, 18.7) controlPoint2:CGPointMake(21.975, 16.85)];
	[path3Path addCurveToPoint:CGPointMake(24.45, 10.8) controlPoint1:CGPointMake(23.475, 13.45) controlPoint2:CGPointMake(24.05, 12)];
	[path3Path addCurveToPoint:CGPointMake(25.05, 8.7) controlPoint1:CGPointMake(24.85, 9.6) controlPoint2:CGPointMake(25.05, 8.9)];
	[path3Path addCurveToPoint:CGPointMake(24.45, 7.5) controlPoint1:CGPointMake(25.05, 7.9) controlPoint2:CGPointMake(24.85, 7.5)];
	[path3Path addCurveToPoint:CGPointMake(21.375, 9.375) controlPoint1:CGPointMake(23.85, 7.5) controlPoint2:CGPointMake(22.825, 8.125)];
	[path3Path addCurveToPoint:CGPointMake(16.65, 13.95) controlPoint1:CGPointMake(19.925, 10.625) controlPoint2:CGPointMake(18.35, 12.15)];
	[path3Path addCurveToPoint:CGPointMake(11.625, 19.65) controlPoint1:CGPointMake(14.95, 15.75) controlPoint2:CGPointMake(13.275, 17.65)];
	[path3Path addCurveToPoint:CGPointMake(7.5, 25.05) controlPoint1:CGPointMake(9.975, 21.65) controlPoint2:CGPointMake(8.6, 23.45)];
	[path3Path addCurveToPoint:CGPointMake(3.9, 30.6) controlPoint1:CGPointMake(6.1, 27.15) controlPoint2:CGPointMake(4.9, 29)];
	[path3Path addCurveToPoint:CGPointMake(1.65, 33) controlPoint1:CGPointMake(2.9, 32.2) controlPoint2:CGPointMake(2.15, 33)];
	[path3Path addCurveToPoint:CGPointMake(0.225, 31.95) controlPoint1:CGPointMake(0.85, 33) controlPoint2:CGPointMake(0.375, 32.65)];
	[path3Path addCurveToPoint:CGPointMake(0, 29.85) controlPoint1:CGPointMake(0.075, 31.25) controlPoint2:CGPointMake(0, 30.55)];
	[path3Path addCurveToPoint:CGPointMake(0.6, 27.9) controlPoint1:CGPointMake(0, 29.05) controlPoint2:CGPointMake(0.2, 28.4)];
	[path3Path addCurveToPoint:CGPointMake(8.55, 14.7) controlPoint1:CGPointMake(3.3, 23.6) controlPoint2:CGPointMake(5.95, 19.2)];
	[path3Path addCurveToPoint:CGPointMake(16.35, 1.35) controlPoint1:CGPointMake(11.15, 10.2) controlPoint2:CGPointMake(13.75, 5.75)];
	[path3Path addCurveToPoint:CGPointMake(18, 0) controlPoint1:CGPointMake(16.85, 0.45) controlPoint2:CGPointMake(17.4, 0)];
	[path3Path addCurveToPoint:CGPointMake(19.35, 0.825) controlPoint1:CGPointMake(18.5, 0) controlPoint2:CGPointMake(18.95, 0.275)];
	[path3Path addCurveToPoint:CGPointMake(19.95, 2.4) controlPoint1:CGPointMake(19.75, 1.375) controlPoint2:CGPointMake(19.95, 1.9)];
	[path3Path addCurveToPoint:CGPointMake(16.35, 9.75) controlPoint1:CGPointMake(19.25, 4.4) controlPoint2:CGPointMake(18.05, 6.85)];
	[path3Path addCurveToPoint:CGPointMake(11.85, 17.7) controlPoint1:CGPointMake(14.65, 12.65) controlPoint2:CGPointMake(13.15, 15.3)];
	[path3Path addCurveToPoint:CGPointMake(21.9, 7.275) controlPoint1:CGPointMake(15.85, 13.1) controlPoint2:CGPointMake(19.2, 9.625)];
	[path3Path addCurveToPoint:CGPointMake(28.5, 3.75) controlPoint1:CGPointMake(24.6, 4.925) controlPoint2:CGPointMake(26.8, 3.75)];
	[path3Path addCurveToPoint:CGPointMake(30.15, 6) controlPoint1:CGPointMake(29.6, 3.75) controlPoint2:CGPointMake(30.15, 4.5)];
	[path3Path addCurveToPoint:CGPointMake(28.8, 10.575) controlPoint1:CGPointMake(30.15, 7) controlPoint2:CGPointMake(29.7, 8.525)];
	[path3Path addCurveToPoint:CGPointMake(26.4, 15.6) controlPoint1:CGPointMake(27.9, 12.625) controlPoint2:CGPointMake(27.1, 14.3)];
	[path3Path addCurveToPoint:CGPointMake(26.325, 16.125) controlPoint1:CGPointMake(26.2, 16) controlPoint2:CGPointMake(26.175, 16.175)];
	[path3Path addCurveToPoint:CGPointMake(26.85, 15.75) controlPoint1:CGPointMake(26.475, 16.075) controlPoint2:CGPointMake(26.65, 15.95)];
	[path3Path addCurveToPoint:CGPointMake(30.975, 11.325) controlPoint1:CGPointMake(28.05, 14.35) controlPoint2:CGPointMake(29.425, 12.875)];
	[path3Path addCurveToPoint:CGPointMake(35.925, 6.9) controlPoint1:CGPointMake(32.525, 9.775) controlPoint2:CGPointMake(34.175, 8.3)];
	[path3Path addCurveToPoint:CGPointMake(41.175, 3) controlPoint1:CGPointMake(37.675, 5.5) controlPoint2:CGPointMake(39.425, 4.2)];
	[path3Path addCurveToPoint:CGPointMake(46.05, 0.15) controlPoint1:CGPointMake(42.925, 1.8) controlPoint2:CGPointMake(44.55, 0.85)];
	[path3Path addCurveToPoint:CGPointMake(48.3, 2.25) controlPoint1:CGPointMake(47.55, 0.15) controlPoint2:CGPointMake(48.3, 0.85)];
	[path3Path addCurveToPoint:CGPointMake(48.15, 3.15) controlPoint1:CGPointMake(48.3, 2.55) controlPoint2:CGPointMake(48.25, 2.85)];
	[path3Path addCurveToPoint:CGPointMake(47.7, 4.2) controlPoint1:CGPointMake(48.05, 3.45) controlPoint2:CGPointMake(47.9, 3.8)];
	[path3Path addCurveToPoint:CGPointMake(44.925, 9.6) controlPoint1:CGPointMake(47.2, 5.3) controlPoint2:CGPointMake(46.275, 7.1)];
	[path3Path addCurveToPoint:CGPointMake(40.8, 17.625) controlPoint1:CGPointMake(43.575, 12.1) controlPoint2:CGPointMake(42.2, 14.775)];
	[path3Path addCurveToPoint:CGPointMake(37.125, 25.875) controlPoint1:CGPointMake(39.4, 20.475) controlPoint2:CGPointMake(38.175, 23.225)];
	[path3Path addCurveToPoint:CGPointMake(35.55, 31.95) controlPoint1:CGPointMake(36.075, 28.525) controlPoint2:CGPointMake(35.55, 30.55)];
	[path3Path addCurveToPoint:CGPointMake(38.4, 34.95) controlPoint1:CGPointMake(35.55, 33.95) controlPoint2:CGPointMake(36.5, 34.95)];
	[path3Path addCurveToPoint:CGPointMake(44.1, 33.15) controlPoint1:CGPointMake(40.2, 34.95) controlPoint2:CGPointMake(42.1, 34.35)];
	[path3Path addCurveToPoint:CGPointMake(50.1, 28.8) controlPoint1:CGPointMake(46.1, 31.95) controlPoint2:CGPointMake(48.1, 30.5)];
	[path3Path addCurveToPoint:CGPointMake(55.65, 23.475) controlPoint1:CGPointMake(52.1, 27.1) controlPoint2:CGPointMake(53.95, 25.325)];
	[path3Path addCurveToPoint:CGPointMake(60, 18.6) controlPoint1:CGPointMake(57.35, 21.625) controlPoint2:CGPointMake(58.8, 20)];
	[path3Path addCurveToPoint:CGPointMake(61.2, 17.85) controlPoint1:CGPointMake(60.4, 18) controlPoint2:CGPointMake(60.8, 17.75)];
	[path3Path addCurveToPoint:CGPointMake(60.9, 19.35) controlPoint1:CGPointMake(61.6, 17.95) controlPoint2:CGPointMake(61.5, 18.45)];
	[path3Path closePath];
	[path3Path moveToPoint:CGPointMake(60.9, 19.35)];
	
	return path3Path;
}

- (UIBezierPath*)path4Path{
	UIBezierPath *path4Path = [UIBezierPath bezierPath];
	[path4Path moveToPoint:CGPointMake(47.25, 14.25)];
	[path4Path addCurveToPoint:CGPointMake(41.25, 21.825) controlPoint1:CGPointMake(45.55, 16.65) controlPoint2:CGPointMake(43.55, 19.175)];
	[path4Path addCurveToPoint:CGPointMake(34.05, 29.1) controlPoint1:CGPointMake(38.95, 24.475) controlPoint2:CGPointMake(36.55, 26.9)];
	[path4Path addCurveToPoint:CGPointMake(26.4, 34.575) controlPoint1:CGPointMake(31.55, 31.3) controlPoint2:CGPointMake(29, 33.125)];
	[path4Path addCurveToPoint:CGPointMake(19.05, 36.75) controlPoint1:CGPointMake(23.8, 36.025) controlPoint2:CGPointMake(21.35, 36.75)];
	[path4Path addCurveToPoint:CGPointMake(15.075, 35.4) controlPoint1:CGPointMake(17.35, 36.75) controlPoint2:CGPointMake(16.025, 36.3)];
	[path4Path addCurveToPoint:CGPointMake(13.65, 31.2) controlPoint1:CGPointMake(14.125, 34.5) controlPoint2:CGPointMake(13.65, 33.1)];
	[path4Path addCurveToPoint:CGPointMake(14.025, 28.125) controlPoint1:CGPointMake(13.65, 30.3) controlPoint2:CGPointMake(13.775, 29.275)];
	[path4Path addCurveToPoint:CGPointMake(15.3, 24.3) controlPoint1:CGPointMake(14.275, 26.975) controlPoint2:CGPointMake(14.7, 25.7)];
	[path4Path addCurveToPoint:CGPointMake(13.275, 26.775) controlPoint1:CGPointMake(14.7, 25) controlPoint2:CGPointMake(14.025, 25.825)];
	[path4Path addCurveToPoint:CGPointMake(10.725, 29.475) controlPoint1:CGPointMake(12.525, 27.725) controlPoint2:CGPointMake(11.675, 28.625)];
	[path4Path addCurveToPoint:CGPointMake(7.575, 31.575) controlPoint1:CGPointMake(9.775, 30.325) controlPoint2:CGPointMake(8.725, 31.025)];
	[path4Path addCurveToPoint:CGPointMake(3.75, 32.4) controlPoint1:CGPointMake(6.425, 32.125) controlPoint2:CGPointMake(5.15, 32.4)];
	[path4Path addCurveToPoint:CGPointMake(1.05, 31.425) controlPoint1:CGPointMake(2.65, 32.4) controlPoint2:CGPointMake(1.75, 32.075)];
	[path4Path addCurveToPoint:CGPointMake(0, 28.35) controlPoint1:CGPointMake(0.35, 30.775) controlPoint2:CGPointMake(0, 29.75)];
	[path4Path addCurveToPoint:CGPointMake(0.525, 25.35) controlPoint1:CGPointMake(0, 27.55) controlPoint2:CGPointMake(0.175, 26.55)];
	[path4Path addCurveToPoint:CGPointMake(2.475, 20.475) controlPoint1:CGPointMake(0.875, 24.15) controlPoint2:CGPointMake(1.525, 22.525)];
	[path4Path addCurveToPoint:CGPointMake(6.375, 12.825) controlPoint1:CGPointMake(3.425, 18.425) controlPoint2:CGPointMake(4.725, 15.875)];
	[path4Path addCurveToPoint:CGPointMake(12.75, 1.5) controlPoint1:CGPointMake(8.025, 9.775) controlPoint2:CGPointMake(10.15, 6)];
	[path4Path addCurveToPoint:CGPointMake(14.1, 0) controlPoint1:CGPointMake(13.25, 0.5) controlPoint2:CGPointMake(13.7, 0)];
	[path4Path addCurveToPoint:CGPointMake(16.275, 1.275) controlPoint1:CGPointMake(14.8, 0) controlPoint2:CGPointMake(15.525, 0.425)];
	[path4Path addCurveToPoint:CGPointMake(17.4, 3) controlPoint1:CGPointMake(17.025, 2.125) controlPoint2:CGPointMake(17.4, 2.7)];
	[path4Path addCurveToPoint:CGPointMake(16.5, 4.8) controlPoint1:CGPointMake(17.4, 3.3) controlPoint2:CGPointMake(17.1, 3.9)];
	[path4Path addCurveToPoint:CGPointMake(12, 12) controlPoint1:CGPointMake(14.9, 7.2) controlPoint2:CGPointMake(13.4, 9.6)];
	[path4Path addCurveToPoint:CGPointMake(8.325, 18.75) controlPoint1:CGPointMake(10.6, 14.4) controlPoint2:CGPointMake(9.375, 16.65)];
	[path4Path addCurveToPoint:CGPointMake(5.775, 24.375) controlPoint1:CGPointMake(7.275, 20.85) controlPoint2:CGPointMake(6.425, 22.725)];
	[path4Path addCurveToPoint:CGPointMake(4.8, 28.2) controlPoint1:CGPointMake(5.125, 26.025) controlPoint2:CGPointMake(4.8, 27.3)];
	[path4Path addCurveToPoint:CGPointMake(6.45, 30.45) controlPoint1:CGPointMake(4.8, 29.7) controlPoint2:CGPointMake(5.35, 30.45)];
	[path4Path addCurveToPoint:CGPointMake(10.575, 28.125) controlPoint1:CGPointMake(7.45, 30.45) controlPoint2:CGPointMake(8.825, 29.675)];
	[path4Path addCurveToPoint:CGPointMake(16.8, 20.25) controlPoint1:CGPointMake(12.325, 26.575) controlPoint2:CGPointMake(14.4, 23.95)];
	[path4Path addCurveToPoint:CGPointMake(19.575, 15.225) controlPoint1:CGPointMake(17.7, 18.65) controlPoint2:CGPointMake(18.625, 16.975)];
	[path4Path addCurveToPoint:CGPointMake(22.35, 10.2) controlPoint1:CGPointMake(20.525, 13.475) controlPoint2:CGPointMake(21.45, 11.8)];
	[path4Path addCurveToPoint:CGPointMake(24.9, 5.775) controlPoint1:CGPointMake(23.25, 8.6) controlPoint2:CGPointMake(24.1, 7.125)];
	[path4Path addCurveToPoint:CGPointMake(26.7, 2.7) controlPoint1:CGPointMake(25.7, 4.425) controlPoint2:CGPointMake(26.3, 3.4)];
	[path4Path addCurveToPoint:CGPointMake(27.9, 1.65) controlPoint1:CGPointMake(27.2, 2) controlPoint2:CGPointMake(27.6, 1.65)];
	[path4Path addCurveToPoint:CGPointMake(29.25, 2.925) controlPoint1:CGPointMake(28.3, 1.65) controlPoint2:CGPointMake(28.75, 2.075)];
	[path4Path addCurveToPoint:CGPointMake(30, 6) controlPoint1:CGPointMake(29.75, 3.775) controlPoint2:CGPointMake(30, 4.8)];
	[path4Path addCurveToPoint:CGPointMake(29.4, 8.25) controlPoint1:CGPointMake(30, 6.8) controlPoint2:CGPointMake(29.8, 7.55)];
	[path4Path addCurveToPoint:CGPointMake(25.575, 13.575) controlPoint1:CGPointMake(28.2, 10.05) controlPoint2:CGPointMake(26.925, 11.825)];
	[path4Path addCurveToPoint:CGPointMake(21.825, 19.05) controlPoint1:CGPointMake(24.225, 15.325) controlPoint2:CGPointMake(22.975, 17.15)];
	[path4Path addCurveToPoint:CGPointMake(18.9, 25.05) controlPoint1:CGPointMake(20.675, 20.95) controlPoint2:CGPointMake(19.7, 22.95)];
	[path4Path addCurveToPoint:CGPointMake(17.7, 31.95) controlPoint1:CGPointMake(18.1, 27.15) controlPoint2:CGPointMake(17.7, 29.45)];
	[path4Path addCurveToPoint:CGPointMake(20.85, 35.25) controlPoint1:CGPointMake(17.7, 34.15) controlPoint2:CGPointMake(18.75, 35.25)];
	[path4Path addCurveToPoint:CGPointMake(25.875, 33.675) controlPoint1:CGPointMake(22.25, 35.25) controlPoint2:CGPointMake(23.925, 34.725)];
	[path4Path addCurveToPoint:CGPointMake(32.25, 29.25) controlPoint1:CGPointMake(27.825, 32.625) controlPoint2:CGPointMake(29.95, 31.15)];
	[path4Path addCurveToPoint:CGPointMake(39.375, 22.35) controlPoint1:CGPointMake(34.55, 27.35) controlPoint2:CGPointMake(36.925, 25.05)];
	[path4Path addCurveToPoint:CGPointMake(46.35, 13.5) controlPoint1:CGPointMake(41.825, 19.65) controlPoint2:CGPointMake(44.15, 16.7)];
	[path4Path addCurveToPoint:CGPointMake(47.25, 14.25) controlPoint1:CGPointMake(46.95, 13.3) controlPoint2:CGPointMake(47.25, 13.55)];
	[path4Path closePath];
	[path4Path moveToPoint:CGPointMake(47.25, 14.25)];
	
	return path4Path;
}

- (UIBezierPath*)path5Path{
	UIBezierPath *path5Path = [UIBezierPath bezierPath];
	[path5Path moveToPoint:CGPointMake(37.5, 2.25)];
	[path5Path addCurveToPoint:CGPointMake(35.625, 4.8) controlPoint1:CGPointMake(36.9, 2.95) controlPoint2:CGPointMake(36.275, 3.8)];
	[path5Path addCurveToPoint:CGPointMake(34.35, 7.05) controlPoint1:CGPointMake(34.975, 5.8) controlPoint2:CGPointMake(34.55, 6.55)];
	[path5Path addCurveToPoint:CGPointMake(33.75, 7.5) controlPoint1:CGPointMake(34.25, 7.35) controlPoint2:CGPointMake(34.05, 7.5)];
	[path5Path addCurveToPoint:CGPointMake(33.3, 7.05) controlPoint1:CGPointMake(33.65, 7.5) controlPoint2:CGPointMake(33.5, 7.35)];
	[path5Path addCurveToPoint:CGPointMake(32.475, 6.075) controlPoint1:CGPointMake(33.1, 6.75) controlPoint2:CGPointMake(32.825, 6.425)];
	[path5Path addCurveToPoint:CGPointMake(31.05, 5.1) controlPoint1:CGPointMake(32.125, 5.725) controlPoint2:CGPointMake(31.65, 5.4)];
	[path5Path addCurveToPoint:CGPointMake(28.5, 4.65) controlPoint1:CGPointMake(30.45, 4.8) controlPoint2:CGPointMake(29.6, 4.65)];
	[path5Path addCurveToPoint:CGPointMake(24.15, 6) controlPoint1:CGPointMake(27.2, 4.65) controlPoint2:CGPointMake(25.75, 5.1)];
	[path5Path addCurveToPoint:CGPointMake(19.95, 9) controlPoint1:CGPointMake(22.55, 6.9) controlPoint2:CGPointMake(21.15, 7.9)];
	[path5Path addCurveToPoint:CGPointMake(14.925, 14.25) controlPoint1:CGPointMake(18.05, 10.6) controlPoint2:CGPointMake(16.375, 12.35)];
	[path5Path addCurveToPoint:CGPointMake(10.8, 20.175) controlPoint1:CGPointMake(13.475, 16.15) controlPoint2:CGPointMake(12.1, 18.125)];
	[path5Path addCurveToPoint:CGPointMake(7.05, 26.475) controlPoint1:CGPointMake(9.5, 22.225) controlPoint2:CGPointMake(8.25, 24.325)];
	[path5Path addCurveToPoint:CGPointMake(3.15, 33) controlPoint1:CGPointMake(5.85, 28.625) controlPoint2:CGPointMake(4.55, 30.8)];
	[path5Path addCurveToPoint:CGPointMake(2.25, 33.45) controlPoint1:CGPointMake(3.05, 33.3) controlPoint2:CGPointMake(2.75, 33.45)];
	[path5Path addCurveToPoint:CGPointMake(0.975, 32.55) controlPoint1:CGPointMake(2.05, 33.45) controlPoint2:CGPointMake(1.625, 33.15)];
	[path5Path addCurveToPoint:CGPointMake(0, 31.2) controlPoint1:CGPointMake(0.325, 31.95) controlPoint2:CGPointMake(0, 31.5)];
	[path5Path addCurveToPoint:CGPointMake(1.05, 28.5) controlPoint1:CGPointMake(0, 30.6) controlPoint2:CGPointMake(0.35, 29.7)];
	[path5Path addCurveToPoint:CGPointMake(5.925, 20.025) controlPoint1:CGPointMake(2.65, 25.7) controlPoint2:CGPointMake(4.275, 22.875)];
	[path5Path addCurveToPoint:CGPointMake(10.575, 12) controlPoint1:CGPointMake(7.575, 17.175) controlPoint2:CGPointMake(9.125, 14.5)];
	[path5Path addCurveToPoint:CGPointMake(14.4, 5.475) controlPoint1:CGPointMake(12.025, 9.5) controlPoint2:CGPointMake(13.3, 7.325)];
	[path5Path addCurveToPoint:CGPointMake(16.65, 1.35) controlPoint1:CGPointMake(15.5, 3.625) controlPoint2:CGPointMake(16.25, 2.25)];
	[path5Path addCurveToPoint:CGPointMake(17.7, 0) controlPoint1:CGPointMake(17.15, 0.45) controlPoint2:CGPointMake(17.5, 0)];
	[path5Path addCurveToPoint:CGPointMake(19.2, 0.75) controlPoint1:CGPointMake(17.9, 0) controlPoint2:CGPointMake(18.4, 0.25)];
	[path5Path addCurveToPoint:CGPointMake(20.4, 2.85) controlPoint1:CGPointMake(20, 1.25) controlPoint2:CGPointMake(20.4, 1.95)];
	[path5Path addCurveToPoint:CGPointMake(19.875, 4.35) controlPoint1:CGPointMake(20.4, 3.15) controlPoint2:CGPointMake(20.225, 3.65)];
	[path5Path addCurveToPoint:CGPointMake(18.675, 6.525) controlPoint1:CGPointMake(19.525, 5.05) controlPoint2:CGPointMake(19.125, 5.775)];
	[path5Path addCurveToPoint:CGPointMake(17.4, 8.7) controlPoint1:CGPointMake(18.225, 7.275) controlPoint2:CGPointMake(17.8, 8)];
	[path5Path addCurveToPoint:CGPointMake(16.5, 10.2) controlPoint1:CGPointMake(17, 9.4) controlPoint2:CGPointMake(16.7, 9.9)];
	[path5Path addCurveToPoint:CGPointMake(16.35, 10.95) controlPoint1:CGPointMake(16.2, 10.7) controlPoint2:CGPointMake(16.15, 10.95)];
	[path5Path addCurveToPoint:CGPointMake(17.1, 10.5) controlPoint1:CGPointMake(16.55, 10.95) controlPoint2:CGPointMake(16.8, 10.8)];
	[path5Path addCurveToPoint:CGPointMake(20.775, 7.2) controlPoint1:CGPointMake(18.1, 9.5) controlPoint2:CGPointMake(19.325, 8.4)];
	[path5Path addCurveToPoint:CGPointMake(25.35, 3.825) controlPoint1:CGPointMake(22.225, 6) controlPoint2:CGPointMake(23.75, 4.875)];
	[path5Path addCurveToPoint:CGPointMake(30.075, 1.2) controlPoint1:CGPointMake(26.95, 2.775) controlPoint2:CGPointMake(28.525, 1.9)];
	[path5Path addCurveToPoint:CGPointMake(34.2, 0.15) controlPoint1:CGPointMake(31.625, 0.5) controlPoint2:CGPointMake(33, 0.15)];
	[path5Path addCurveToPoint:CGPointMake(36.525, 0.825) controlPoint1:CGPointMake(35.1, 0.15) controlPoint2:CGPointMake(35.875, 0.375)];
	[path5Path addCurveToPoint:CGPointMake(37.5, 2.25) controlPoint1:CGPointMake(37.175, 1.275) controlPoint2:CGPointMake(37.5, 1.75)];
	[path5Path closePath];
	[path5Path moveToPoint:CGPointMake(37.5, 2.25)];
	
	return path5Path;
}

- (UIBezierPath*)path6Path{
	UIBezierPath *path6Path = [UIBezierPath bezierPath];
	[path6Path moveToPoint:CGPointMake(55.2, 16.65)];
	[path6Path addCurveToPoint:CGPointMake(47.625, 25.125) controlPoint1:CGPointMake(52.9, 19.45) controlPoint2:CGPointMake(50.375, 22.275)];
	[path6Path addCurveToPoint:CGPointMake(39.3, 32.85) controlPoint1:CGPointMake(44.875, 27.975) controlPoint2:CGPointMake(42.1, 30.55)];
	[path6Path addCurveToPoint:CGPointMake(30.975, 38.4) controlPoint1:CGPointMake(36.5, 35.15) controlPoint2:CGPointMake(33.725, 37)];
	[path6Path addCurveToPoint:CGPointMake(23.4, 40.5) controlPoint1:CGPointMake(28.225, 39.8) controlPoint2:CGPointMake(25.7, 40.5)];
	[path6Path addCurveToPoint:CGPointMake(19.2, 39) controlPoint1:CGPointMake(21.4, 40.5) controlPoint2:CGPointMake(20, 40)];
	[path6Path addCurveToPoint:CGPointMake(18, 35.25) controlPoint1:CGPointMake(18.4, 38) controlPoint2:CGPointMake(18, 36.75)];
	[path6Path addCurveToPoint:CGPointMake(19.275, 29.625) controlPoint1:CGPointMake(18, 33.85) controlPoint2:CGPointMake(18.425, 31.975)];
	[path6Path addCurveToPoint:CGPointMake(23.1, 22.05) controlPoint1:CGPointMake(20.125, 27.275) controlPoint2:CGPointMake(21.4, 24.75)];
	[path6Path addCurveToPoint:CGPointMake(18.6, 27.45) controlPoint1:CGPointMake(21.8, 23.75) controlPoint2:CGPointMake(20.3, 25.55)];
	[path6Path addCurveToPoint:CGPointMake(13.35, 32.625) controlPoint1:CGPointMake(16.9, 29.35) controlPoint2:CGPointMake(15.15, 31.075)];
	[path6Path addCurveToPoint:CGPointMake(7.95, 36.525) controlPoint1:CGPointMake(11.55, 34.175) controlPoint2:CGPointMake(9.75, 35.475)];
	[path6Path addCurveToPoint:CGPointMake(3.15, 38.1) controlPoint1:CGPointMake(6.15, 37.575) controlPoint2:CGPointMake(4.55, 38.1)];
	[path6Path addCurveToPoint:CGPointMake(0, 34.95) controlPoint1:CGPointMake(1.05, 38.1) controlPoint2:CGPointMake(0, 37.05)];
	[path6Path addCurveToPoint:CGPointMake(2.7, 26.25) controlPoint1:CGPointMake(0, 32.65) controlPoint2:CGPointMake(0.9, 29.75)];
	[path6Path addCurveToPoint:CGPointMake(9.975, 16.125) controlPoint1:CGPointMake(4.5, 22.75) controlPoint2:CGPointMake(6.925, 19.375)];
	[path6Path addCurveToPoint:CGPointMake(20.4, 7.725) controlPoint1:CGPointMake(13.025, 12.875) controlPoint2:CGPointMake(16.5, 10.075)];
	[path6Path addCurveToPoint:CGPointMake(32.55, 4.2) controlPoint1:CGPointMake(24.3, 5.375) controlPoint2:CGPointMake(28.35, 4.2)];
	[path6Path addCurveToPoint:CGPointMake(33.9, 2.1) controlPoint1:CGPointMake(33.05, 3.2) controlPoint2:CGPointMake(33.5, 2.5)];
	[path6Path addCurveToPoint:CGPointMake(35.1, 1.2) controlPoint1:CGPointMake(34.3, 1.7) controlPoint2:CGPointMake(34.7, 1.4)];
	[path6Path addLineToPoint:CGPointMake(39.3, 0)];
	[path6Path addLineToPoint:CGPointMake(39.6, 0.15)];
	[path6Path addCurveToPoint:CGPointMake(38.175, 2.025) controlPoint1:CGPointMake(39.1, 0.65) controlPoint2:CGPointMake(38.625, 1.275)];
	[path6Path addCurveToPoint:CGPointMake(36.75, 4.35) controlPoint1:CGPointMake(37.725, 2.775) controlPoint2:CGPointMake(37.25, 3.55)];
	[path6Path addCurveToPoint:CGPointMake(39, 4.5) controlPoint1:CGPointMake(37.25, 4.35) controlPoint2:CGPointMake(38, 4.4)];
	[path6Path addCurveToPoint:CGPointMake(41.25, 4.8) controlPoint1:CGPointMake(40, 4.6) controlPoint2:CGPointMake(40.75, 4.7)];
	[path6Path addCurveToPoint:CGPointMake(42, 5.55) controlPoint1:CGPointMake(41.75, 5) controlPoint2:CGPointMake(42, 5.25)];
	[path6Path addCurveToPoint:CGPointMake(41.55, 6) controlPoint1:CGPointMake(42, 5.85) controlPoint2:CGPointMake(41.85, 6)];
	[path6Path addCurveToPoint:CGPointMake(38.85, 5.55) controlPoint1:CGPointMake(40.95, 5.8) controlPoint2:CGPointMake(40.05, 5.65)];
	[path6Path addCurveToPoint:CGPointMake(36.15, 5.4) controlPoint1:CGPointMake(37.65, 5.45) controlPoint2:CGPointMake(36.75, 5.4)];
	[path6Path addCurveToPoint:CGPointMake(26.025, 24.675) controlPoint1:CGPointMake(31.55, 13.5) controlPoint2:CGPointMake(28.175, 19.925)];
	[path6Path addCurveToPoint:CGPointMake(22.8, 35.25) controlPoint1:CGPointMake(23.875, 29.425) controlPoint2:CGPointMake(22.8, 32.95)];
	[path6Path addCurveToPoint:CGPointMake(23.475, 37.5) controlPoint1:CGPointMake(22.8, 36.15) controlPoint2:CGPointMake(23.025, 36.9)];
	[path6Path addCurveToPoint:CGPointMake(26.25, 38.4) controlPoint1:CGPointMake(23.925, 38.1) controlPoint2:CGPointMake(24.85, 38.4)];
	[path6Path addCurveToPoint:CGPointMake(31.95, 36.675) controlPoint1:CGPointMake(27.85, 38.4) controlPoint2:CGPointMake(29.75, 37.825)];
	[path6Path addCurveToPoint:CGPointMake(39, 31.875) controlPoint1:CGPointMake(34.15, 35.525) controlPoint2:CGPointMake(36.5, 33.925)];
	[path6Path addCurveToPoint:CGPointMake(46.725, 24.75) controlPoint1:CGPointMake(41.5, 29.825) controlPoint2:CGPointMake(44.075, 27.45)];
	[path6Path addCurveToPoint:CGPointMake(54.3, 16.2) controlPoint1:CGPointMake(49.375, 22.05) controlPoint2:CGPointMake(51.9, 19.2)];
	[path6Path addCurveToPoint:CGPointMake(54.9, 15.975) controlPoint1:CGPointMake(54.5, 15.9) controlPoint2:CGPointMake(54.7, 15.825)];
	[path6Path addCurveToPoint:CGPointMake(55.2, 16.65) controlPoint1:CGPointMake(55.1, 16.125) controlPoint2:CGPointMake(55.2, 16.35)];
	[path6Path closePath];
	[path6Path moveToPoint:CGPointMake(31.8, 5.25)];
	[path6Path addCurveToPoint:CGPointMake(22.05, 8.85) controlPoint1:CGPointMake(28.4, 5.25) controlPoint2:CGPointMake(25.15, 6.45)];
	[path6Path addCurveToPoint:CGPointMake(13.8, 17.325) controlPoint1:CGPointMake(18.95, 11.25) controlPoint2:CGPointMake(16.2, 14.075)];
	[path6Path addCurveToPoint:CGPointMake(8.025, 27) controlPoint1:CGPointMake(11.4, 20.575) controlPoint2:CGPointMake(9.475, 23.8)];
	[path6Path addCurveToPoint:CGPointMake(5.85, 34.05) controlPoint1:CGPointMake(6.575, 30.2) controlPoint2:CGPointMake(5.85, 32.55)];
	[path6Path addCurveToPoint:CGPointMake(6.75, 35.25) controlPoint1:CGPointMake(5.85, 34.85) controlPoint2:CGPointMake(6.15, 35.25)];
	[path6Path addCurveToPoint:CGPointMake(9.525, 34.05) controlPoint1:CGPointMake(7.35, 35.25) controlPoint2:CGPointMake(8.275, 34.85)];
	[path6Path addCurveToPoint:CGPointMake(13.8, 30.825) controlPoint1:CGPointMake(10.775, 33.25) controlPoint2:CGPointMake(12.2, 32.175)];
	[path6Path addCurveToPoint:CGPointMake(18.675, 26.1) controlPoint1:CGPointMake(15.4, 29.475) controlPoint2:CGPointMake(17.025, 27.9)];
	[path6Path addCurveToPoint:CGPointMake(23.25, 20.25) controlPoint1:CGPointMake(20.325, 24.3) controlPoint2:CGPointMake(21.85, 22.35)];
	[path6Path addCurveToPoint:CGPointMake(27.9, 12.6) controlPoint1:CGPointMake(24.85, 17.85) controlPoint2:CGPointMake(26.4, 15.3)];
	[path6Path addCurveToPoint:CGPointMake(31.95, 5.4) controlPoint1:CGPointMake(29.4, 9.9) controlPoint2:CGPointMake(30.75, 7.5)];
	[path6Path closePath];
	[path6Path moveToPoint:CGPointMake(31.8, 5.25)];
	
	return path6Path;
}

- (UIBezierPath*)path7Path{
	UIBezierPath *path7Path = [UIBezierPath bezierPath];
	[path7Path moveToPoint:CGPointMake(28.5, 1.95)];
	[path7Path addCurveToPoint:CGPointMake(26.925, 5.55) controlPoint1:CGPointMake(28.5, 3.15) controlPoint2:CGPointMake(27.975, 4.35)];
	[path7Path addCurveToPoint:CGPointMake(23.4, 7.35) controlPoint1:CGPointMake(25.875, 6.75) controlPoint2:CGPointMake(24.7, 7.35)];
	[path7Path addCurveToPoint:CGPointMake(21.6, 5.55) controlPoint1:CGPointMake(22.2, 7.35) controlPoint2:CGPointMake(21.6, 6.75)];
	[path7Path addCurveToPoint:CGPointMake(23.025, 1.8) controlPoint1:CGPointMake(21.6, 4.25) controlPoint2:CGPointMake(22.075, 3)];
	[path7Path addCurveToPoint:CGPointMake(26.55, 0) controlPoint1:CGPointMake(23.975, 0.6) controlPoint2:CGPointMake(25.15, 0)];
	[path7Path addCurveToPoint:CGPointMake(28.5, 1.95) controlPoint1:CGPointMake(27.85, 0) controlPoint2:CGPointMake(28.5, 0.65)];
	[path7Path closePath];
	[path7Path moveToPoint:CGPointMake(35.25, 35.4)];
	[path7Path addCurveToPoint:CGPointMake(27, 44.25) controlPoint1:CGPointMake(32.85, 38.5) controlPoint2:CGPointMake(30.1, 41.45)];
	[path7Path addCurveToPoint:CGPointMake(18.45, 51) controlPoint1:CGPointMake(23.9, 47.05) controlPoint2:CGPointMake(21.05, 49.3)];
	[path7Path addCurveToPoint:CGPointMake(12.3, 54) controlPoint1:CGPointMake(16.45, 52.3) controlPoint2:CGPointMake(14.4, 53.3)];
	[path7Path addCurveToPoint:CGPointMake(6.6, 55.05) controlPoint1:CGPointMake(10.2, 54.7) controlPoint2:CGPointMake(8.3, 55.05)];
	[path7Path addCurveToPoint:CGPointMake(4.5, 54.9) controlPoint1:CGPointMake(6, 55.05) controlPoint2:CGPointMake(5.3, 55)];
	[path7Path addCurveToPoint:CGPointMake(2.325, 54.15) controlPoint1:CGPointMake(3.7, 54.8) controlPoint2:CGPointMake(2.975, 54.55)];
	[path7Path addCurveToPoint:CGPointMake(0.675, 52.575) controlPoint1:CGPointMake(1.675, 53.75) controlPoint2:CGPointMake(1.125, 53.225)];
	[path7Path addCurveToPoint:CGPointMake(0, 49.95) controlPoint1:CGPointMake(0.225, 51.925) controlPoint2:CGPointMake(0, 51.05)];
	[path7Path addCurveToPoint:CGPointMake(1.5, 44.625) controlPoint1:CGPointMake(0, 48.65) controlPoint2:CGPointMake(0.5, 46.875)];
	[path7Path addCurveToPoint:CGPointMake(5.025, 37.65) controlPoint1:CGPointMake(2.5, 42.375) controlPoint2:CGPointMake(3.675, 40.05)];
	[path7Path addCurveToPoint:CGPointMake(9.075, 30.75) controlPoint1:CGPointMake(6.375, 35.25) controlPoint2:CGPointMake(7.725, 32.95)];
	[path7Path addCurveToPoint:CGPointMake(12.3, 25.8) controlPoint1:CGPointMake(10.425, 28.55) controlPoint2:CGPointMake(11.5, 26.9)];
	[path7Path addCurveToPoint:CGPointMake(14.925, 23.775) controlPoint1:CGPointMake(12.8, 25) controlPoint2:CGPointMake(13.675, 24.325)];
	[path7Path addCurveToPoint:CGPointMake(17.4, 22.95) controlPoint1:CGPointMake(16.175, 23.225) controlPoint2:CGPointMake(17, 22.95)];
	[path7Path addCurveToPoint:CGPointMake(18.15, 23.4) controlPoint1:CGPointMake(17.9, 22.95) controlPoint2:CGPointMake(18.15, 23.1)];
	[path7Path addCurveToPoint:CGPointMake(17.925, 24.3) controlPoint1:CGPointMake(18.15, 23.6) controlPoint2:CGPointMake(18.075, 23.9)];
	[path7Path addCurveToPoint:CGPointMake(17.4, 25.2) controlPoint1:CGPointMake(17.775, 24.7) controlPoint2:CGPointMake(17.6, 25)];
	[path7Path addCurveToPoint:CGPointMake(13.425, 31.8) controlPoint1:CGPointMake(16.1, 27.2) controlPoint2:CGPointMake(14.775, 29.4)];
	[path7Path addCurveToPoint:CGPointMake(9.75, 38.775) controlPoint1:CGPointMake(12.075, 34.2) controlPoint2:CGPointMake(10.85, 36.525)];
	[path7Path addCurveToPoint:CGPointMake(7.125, 45) controlPoint1:CGPointMake(8.65, 41.025) controlPoint2:CGPointMake(7.775, 43.1)];
	[path7Path addCurveToPoint:CGPointMake(6.15, 49.5) controlPoint1:CGPointMake(6.475, 46.9) controlPoint2:CGPointMake(6.15, 48.4)];
	[path7Path addCurveToPoint:CGPointMake(7.125, 52.125) controlPoint1:CGPointMake(6.15, 50.7) controlPoint2:CGPointMake(6.475, 51.575)];
	[path7Path addCurveToPoint:CGPointMake(9.75, 52.95) controlPoint1:CGPointMake(7.775, 52.675) controlPoint2:CGPointMake(8.65, 52.95)];
	[path7Path addCurveToPoint:CGPointMake(16.35, 50.925) controlPoint1:CGPointMake(11.75, 52.95) controlPoint2:CGPointMake(13.95, 52.275)];
	[path7Path addCurveToPoint:CGPointMake(23.475, 46.05) controlPoint1:CGPointMake(18.75, 49.575) controlPoint2:CGPointMake(21.125, 47.95)];
	[path7Path addCurveToPoint:CGPointMake(30, 40.05) controlPoint1:CGPointMake(25.825, 44.15) controlPoint2:CGPointMake(28, 42.15)];
	[path7Path addCurveToPoint:CGPointMake(34.65, 34.65) controlPoint1:CGPointMake(32, 37.95) controlPoint2:CGPointMake(33.55, 36.15)];
	[path7Path addCurveToPoint:CGPointMake(35.475, 34.275) controlPoint1:CGPointMake(35.15, 34.15) controlPoint2:CGPointMake(35.425, 34.025)];
	[path7Path addCurveToPoint:CGPointMake(35.25, 35.4) controlPoint1:CGPointMake(35.525, 34.525) controlPoint2:CGPointMake(35.45, 34.9)];
	[path7Path closePath];
	[path7Path moveToPoint:CGPointMake(35.25, 35.4)];
	
	return path7Path;
}

- (UIBezierPath*)path8Path{
	UIBezierPath *path8Path = [UIBezierPath bezierPath];
	[path8Path moveToPoint:CGPointMake(0, 39.746)];
	[path8Path addLineToPoint:CGPointMake(0, 0)];
	[path8Path addLineToPoint:CGPointMake(5.532, 0)];
	[path8Path addLineToPoint:CGPointMake(25.54, 30.696)];
	[path8Path addLineToPoint:CGPointMake(25.54, 0)];
	[path8Path addLineToPoint:CGPointMake(30.374, 0)];
	[path8Path addLineToPoint:CGPointMake(30.374, 39.746)];
	[path8Path addLineToPoint:CGPointMake(24.868, 39.746)];
	[path8Path addLineToPoint:CGPointMake(4.834, 9.05)];
	[path8Path addLineToPoint:CGPointMake(4.834, 39.746)];
	[path8Path closePath];
	[path8Path moveToPoint:CGPointMake(0, 39.746)];
	
	return path8Path;
}

- (UIBezierPath*)path9Path{
	UIBezierPath *path9Path = [UIBezierPath bezierPath];
	[path9Path moveToPoint:CGPointMake(13.723, 30.481)];
	[path9Path addCurveToPoint:CGPointMake(3.733, 26.332) controlPoint1:CGPointMake(9.552, 30.481) controlPoint2:CGPointMake(6.222, 29.098)];
	[path9Path addCurveToPoint:CGPointMake(0, 15.227) controlPoint1:CGPointMake(1.244, 23.566) controlPoint2:CGPointMake(0, 19.864)];
	[path9Path addCurveToPoint:CGPointMake(3.746, 4.095) controlPoint1:CGPointMake(0, 10.536) controlPoint2:CGPointMake(1.249, 6.826)];
	[path9Path addCurveToPoint:CGPointMake(13.911, 0) controlPoint1:CGPointMake(6.244, 1.365) controlPoint2:CGPointMake(9.632, 0)];
	[path9Path addCurveToPoint:CGPointMake(24.076, 4.095) controlPoint1:CGPointMake(18.19, 0) controlPoint2:CGPointMake(21.578, 1.365)];
	[path9Path addCurveToPoint:CGPointMake(27.822, 15.173) controlPoint1:CGPointMake(26.573, 6.826) controlPoint2:CGPointMake(27.822, 10.518)];
	[path9Path addCurveToPoint:CGPointMake(24.062, 26.399) controlPoint1:CGPointMake(27.822, 19.936) controlPoint2:CGPointMake(26.569, 23.678)];
	[path9Path addCurveToPoint:CGPointMake(13.723, 30.481) controlPoint1:CGPointMake(21.556, 29.12) controlPoint2:CGPointMake(18.11, 30.481)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(13.804, 26.506)];
	[path9Path addCurveToPoint:CGPointMake(22.209, 15.173) controlPoint1:CGPointMake(19.408, 26.506) controlPoint2:CGPointMake(22.209, 22.729)];
	[path9Path addCurveToPoint:CGPointMake(13.911, 3.975) controlPoint1:CGPointMake(22.209, 7.707) controlPoint2:CGPointMake(19.443, 3.975)];
	[path9Path addCurveToPoint:CGPointMake(5.64, 15.227) controlPoint1:CGPointMake(8.397, 3.975) controlPoint2:CGPointMake(5.64, 7.725)];
	[path9Path addCurveToPoint:CGPointMake(13.804, 26.506) controlPoint1:CGPointMake(5.64, 22.747) controlPoint2:CGPointMake(8.361, 26.506)];
	[path9Path closePath];
	[path9Path moveToPoint:CGPointMake(13.804, 26.506)];
	
	return path9Path;
}

- (UIBezierPath*)path10Path{
	UIBezierPath *path10Path = [UIBezierPath bezierPath];
	[path10Path moveToPoint:CGPointMake(0, 29.81)];
	[path10Path addLineToPoint:CGPointMake(0, 0.645)];
	[path10Path addLineToPoint:CGPointMake(5.291, 0.645)];
	[path10Path addLineToPoint:CGPointMake(5.291, 6.123)];
	[path10Path addCurveToPoint:CGPointMake(15.549, 0) controlPoint1:CGPointMake(8.084, 2.041) controlPoint2:CGPointMake(11.503, 0)];
	[path10Path addCurveToPoint:CGPointMake(21.592, 2.404) controlPoint1:CGPointMake(18.074, 0) controlPoint2:CGPointMake(20.088, 0.801)];
	[path10Path addCurveToPoint:CGPointMake(23.848, 8.862) controlPoint1:CGPointMake(23.096, 4.006) controlPoint2:CGPointMake(23.848, 6.159)];
	[path10Path addLineToPoint:CGPointMake(23.848, 29.81)];
	[path10Path addLineToPoint:CGPointMake(18.557, 29.81)];
	[path10Path addLineToPoint:CGPointMake(18.557, 10.581)];
	[path10Path addCurveToPoint:CGPointMake(17.604, 5.948) controlPoint1:CGPointMake(18.557, 8.415) controlPoint2:CGPointMake(18.239, 6.871)];
	[path10Path addCurveToPoint:CGPointMake(14.448, 4.565) controlPoint1:CGPointMake(16.968, 5.026) controlPoint2:CGPointMake(15.916, 4.565)];
	[path10Path addCurveToPoint:CGPointMake(5.291, 10.93) controlPoint1:CGPointMake(11.208, 4.565) controlPoint2:CGPointMake(8.155, 6.687)];
	[path10Path addLineToPoint:CGPointMake(5.291, 29.81)];
	[path10Path closePath];
	[path10Path moveToPoint:CGPointMake(0, 29.81)];
	
	return path10Path;
}

- (UIBezierPath*)path11Path{
	UIBezierPath *path11Path = [UIBezierPath bezierPath];
	[path11Path moveToPoint:CGPointMake(13.723, 30.481)];
	[path11Path addCurveToPoint:CGPointMake(3.733, 26.332) controlPoint1:CGPointMake(9.552, 30.481) controlPoint2:CGPointMake(6.222, 29.098)];
	[path11Path addCurveToPoint:CGPointMake(0, 15.227) controlPoint1:CGPointMake(1.244, 23.566) controlPoint2:CGPointMake(0, 19.864)];
	[path11Path addCurveToPoint:CGPointMake(3.746, 4.095) controlPoint1:CGPointMake(0, 10.536) controlPoint2:CGPointMake(1.249, 6.826)];
	[path11Path addCurveToPoint:CGPointMake(13.911, 0) controlPoint1:CGPointMake(6.244, 1.365) controlPoint2:CGPointMake(9.632, 0)];
	[path11Path addCurveToPoint:CGPointMake(24.076, 4.095) controlPoint1:CGPointMake(18.19, 0) controlPoint2:CGPointMake(21.578, 1.365)];
	[path11Path addCurveToPoint:CGPointMake(27.822, 15.173) controlPoint1:CGPointMake(26.573, 6.826) controlPoint2:CGPointMake(27.822, 10.518)];
	[path11Path addCurveToPoint:CGPointMake(24.062, 26.399) controlPoint1:CGPointMake(27.822, 19.936) controlPoint2:CGPointMake(26.569, 23.678)];
	[path11Path addCurveToPoint:CGPointMake(13.723, 30.481) controlPoint1:CGPointMake(21.556, 29.12) controlPoint2:CGPointMake(18.11, 30.481)];
	[path11Path closePath];
	[path11Path moveToPoint:CGPointMake(13.804, 26.506)];
	[path11Path addCurveToPoint:CGPointMake(22.209, 15.173) controlPoint1:CGPointMake(19.408, 26.506) controlPoint2:CGPointMake(22.209, 22.729)];
	[path11Path addCurveToPoint:CGPointMake(13.911, 3.975) controlPoint1:CGPointMake(22.209, 7.707) controlPoint2:CGPointMake(19.443, 3.975)];
	[path11Path addCurveToPoint:CGPointMake(5.64, 15.227) controlPoint1:CGPointMake(8.397, 3.975) controlPoint2:CGPointMake(5.64, 7.725)];
	[path11Path addCurveToPoint:CGPointMake(13.804, 26.506) controlPoint1:CGPointMake(5.64, 22.747) controlPoint2:CGPointMake(8.361, 26.506)];
	[path11Path closePath];
	[path11Path moveToPoint:CGPointMake(13.804, 26.506)];
	
	return path11Path;
}

- (UIBezierPath*)path12Path{
	UIBezierPath *path12Path = [UIBezierPath bezierPath];
	[path12Path moveToPoint:CGPointMake(0, 29.836)];
	[path12Path addLineToPoint:CGPointMake(0, 0.671)];
	[path12Path addLineToPoint:CGPointMake(5.291, 0.671)];
	[path12Path addLineToPoint:CGPointMake(5.291, 6.15)];
	[path12Path addCurveToPoint:CGPointMake(15.227, 0.027) controlPoint1:CGPointMake(7.869, 2.068) controlPoint2:CGPointMake(11.181, 0.027)];
	[path12Path addCurveToPoint:CGPointMake(23.203, 6.15) controlPoint1:CGPointMake(19.13, 0.027) controlPoint2:CGPointMake(21.789, 2.068)];
	[path12Path addCurveToPoint:CGPointMake(32.979, 0) controlPoint1:CGPointMake(25.71, 2.05) controlPoint2:CGPointMake(28.968, 0)];
	[path12Path addCurveToPoint:CGPointMake(38.967, 2.269) controlPoint1:CGPointMake(35.557, 0) controlPoint2:CGPointMake(37.553, 0.756)];
	[path12Path addCurveToPoint:CGPointMake(41.089, 8.621) controlPoint1:CGPointMake(40.382, 3.782) controlPoint2:CGPointMake(41.089, 5.899)];
	[path12Path addLineToPoint:CGPointMake(41.089, 29.836)];
	[path12Path addLineToPoint:CGPointMake(35.771, 29.836)];
	[path12Path addLineToPoint:CGPointMake(35.771, 9.453)];
	[path12Path addCurveToPoint:CGPointMake(31.824, 4.458) controlPoint1:CGPointMake(35.771, 6.123) controlPoint2:CGPointMake(34.456, 4.458)];
	[path12Path addCurveToPoint:CGPointMake(23.203, 10.286) controlPoint1:CGPointMake(29.084, 4.458) controlPoint2:CGPointMake(26.211, 6.401)];
	[path12Path addLineToPoint:CGPointMake(23.203, 29.836)];
	[path12Path addLineToPoint:CGPointMake(17.886, 29.836)];
	[path12Path addLineToPoint:CGPointMake(17.886, 9.453)];
	[path12Path addCurveToPoint:CGPointMake(13.857, 4.431) controlPoint1:CGPointMake(17.886, 6.105) controlPoint2:CGPointMake(16.543, 4.431)];
	[path12Path addCurveToPoint:CGPointMake(5.291, 10.286) controlPoint1:CGPointMake(11.19, 4.431) controlPoint2:CGPointMake(8.334, 6.383)];
	[path12Path addLineToPoint:CGPointMake(5.291, 29.836)];
	[path12Path closePath];
	[path12Path moveToPoint:CGPointMake(0, 29.836)];
	
	return path12Path;
}

- (UIBezierPath*)path13Path{
	UIBezierPath *path13Path = [UIBezierPath bezierPath];
	[path13Path moveToPoint:CGPointMake(13.723, 30.481)];
	[path13Path addCurveToPoint:CGPointMake(3.733, 26.332) controlPoint1:CGPointMake(9.552, 30.481) controlPoint2:CGPointMake(6.222, 29.098)];
	[path13Path addCurveToPoint:CGPointMake(0, 15.227) controlPoint1:CGPointMake(1.244, 23.566) controlPoint2:CGPointMake(0, 19.864)];
	[path13Path addCurveToPoint:CGPointMake(3.746, 4.095) controlPoint1:CGPointMake(0, 10.536) controlPoint2:CGPointMake(1.249, 6.826)];
	[path13Path addCurveToPoint:CGPointMake(13.911, 0) controlPoint1:CGPointMake(6.244, 1.365) controlPoint2:CGPointMake(9.632, 0)];
	[path13Path addCurveToPoint:CGPointMake(24.076, 4.095) controlPoint1:CGPointMake(18.19, 0) controlPoint2:CGPointMake(21.578, 1.365)];
	[path13Path addCurveToPoint:CGPointMake(27.822, 15.173) controlPoint1:CGPointMake(26.573, 6.826) controlPoint2:CGPointMake(27.822, 10.518)];
	[path13Path addCurveToPoint:CGPointMake(24.062, 26.399) controlPoint1:CGPointMake(27.822, 19.936) controlPoint2:CGPointMake(26.569, 23.678)];
	[path13Path addCurveToPoint:CGPointMake(13.723, 30.481) controlPoint1:CGPointMake(21.556, 29.12) controlPoint2:CGPointMake(18.11, 30.481)];
	[path13Path closePath];
	[path13Path moveToPoint:CGPointMake(13.804, 26.506)];
	[path13Path addCurveToPoint:CGPointMake(22.209, 15.173) controlPoint1:CGPointMake(19.408, 26.506) controlPoint2:CGPointMake(22.209, 22.729)];
	[path13Path addCurveToPoint:CGPointMake(13.911, 3.975) controlPoint1:CGPointMake(22.209, 7.707) controlPoint2:CGPointMake(19.443, 3.975)];
	[path13Path addCurveToPoint:CGPointMake(5.64, 15.227) controlPoint1:CGPointMake(8.397, 3.975) controlPoint2:CGPointMake(5.64, 7.725)];
	[path13Path addCurveToPoint:CGPointMake(13.804, 26.506) controlPoint1:CGPointMake(5.64, 22.747) controlPoint2:CGPointMake(8.361, 26.506)];
	[path13Path closePath];
	[path13Path moveToPoint:CGPointMake(13.804, 26.506)];
	
	return path13Path;
}

- (UIBezierPath*)path14Path{
	UIBezierPath *path14Path = [UIBezierPath bezierPath];
	[path14Path moveToPoint:CGPointMake(0, 29.81)];
	[path14Path addLineToPoint:CGPointMake(0, 0.645)];
	[path14Path addLineToPoint:CGPointMake(5.291, 0.645)];
	[path14Path addLineToPoint:CGPointMake(5.291, 6.123)];
	[path14Path addCurveToPoint:CGPointMake(14.421, 0) controlPoint1:CGPointMake(7.385, 2.041) controlPoint2:CGPointMake(10.429, 0)];
	[path14Path addCurveToPoint:CGPointMake(16.113, 0.134) controlPoint1:CGPointMake(14.958, 0) controlPoint2:CGPointMake(15.522, 0.045)];
	[path14Path addLineToPoint:CGPointMake(16.113, 5.076)];
	[path14Path addCurveToPoint:CGPointMake(13.696, 4.619) controlPoint1:CGPointMake(15.2, 4.771) controlPoint2:CGPointMake(14.395, 4.619)];
	[path14Path addCurveToPoint:CGPointMake(5.291, 10.581) controlPoint1:CGPointMake(10.348, 4.619) controlPoint2:CGPointMake(7.546, 6.606)];
	[path14Path addLineToPoint:CGPointMake(5.291, 29.81)];
	[path14Path closePath];
	[path14Path moveToPoint:CGPointMake(0, 29.81)];
	
	return path14Path;
}

- (UIBezierPath*)path15Path{
	UIBezierPath *path15Path = [UIBezierPath bezierPath];
	[path15Path moveToPoint:CGPointMake(0, 39.746)];
	[path15Path addLineToPoint:CGPointMake(0, 10.581)];
	[path15Path addLineToPoint:CGPointMake(5.291, 10.581)];
	[path15Path addLineToPoint:CGPointMake(5.291, 39.746)];
	[path15Path closePath];
	[path15Path moveToPoint:CGPointMake(0, 5.291)];
	[path15Path addLineToPoint:CGPointMake(0, 0)];
	[path15Path addLineToPoint:CGPointMake(5.291, 0)];
	[path15Path addLineToPoint:CGPointMake(5.291, 5.291)];
	[path15Path closePath];
	[path15Path moveToPoint:CGPointMake(0, 5.291)];
	
	return path15Path;
}

@end