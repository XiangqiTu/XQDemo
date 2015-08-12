//
//  QZShiningView.m
//
//  Code generated using QuartzCode 1.21 on 15-8-4.
//  www.quartzcodeapp.com
//

#import "QZShiningView.h"
#import "QCMethod.h"


@interface QZShiningView ()

@property (nonatomic, strong) UIView *aView2;
@property (nonatomic, strong) CAShapeLayer *text;

@end

@implementation QZShiningView

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


- (void)setFrame:(CGRect)frame{
	[super setFrame:frame];
	[self setupLayerFrames];
}

- (void)setBounds:(CGRect)bounds{
	[super setBounds:bounds];
	[self setupLayerFrames];
}

- (void)setupLayers{
	UIView*  aView2        = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
	aView2.backgroundColor = [UIColor blackColor];
	[self addSubview:aView2];
	_aView2 = aView2;
	{
		CAShapeLayer * text = [CAShapeLayer layer];
		[aView2.layer addSublayer:text];
		text.strokeColor = [UIColor blackColor].CGColor;
		_text = text;
		
	}
	
	
	[self setupLayerFrames];
}


- (void)setupLayerFrames{
	_aView2.frame = CGRectMake(0, 0,  CGRectGetWidth(_aView2.layer.superlayer.bounds),  CGRectGetHeight(_aView2.layer.superlayer.bounds));
	_text.frame   = CGRectMake(0.08218 * CGRectGetWidth(_text.superlayer.bounds), 0.22836 * CGRectGetHeight(_text.superlayer.bounds), 0.8325 * CGRectGetWidth(_text.superlayer.bounds), 0.12453 * CGRectGetHeight(_text.superlayer.bounds));
	_text.path    = [self textPathWithBounds:_text.bounds].CGPath;
}


- (IBAction)startAllAnimations:(id)sender{
	
	[self.text addAnimation:[self textAnimation] forKey:@"textAnimation"];
}


- (IBAction)startReverseAnimations:(id)sender{
	CGFloat totalDuration = 5.91;
//	[self startAView2Animation];
	[self.text addAnimation:[QCMethod reverseAnimation:[self textAnimation] totalDuration:totalDuration] forKey:@"textAnimation"];
}

- (CABasicAnimation*)textAnimation{
	CABasicAnimation * strokeColorAnim = [CABasicAnimation animationWithKeyPath:@"strokeColor"];
	strokeColorAnim.fromValue          = (id)[UIColor colorWithRed:0.899 green: 0.0823 blue:0.913 alpha:1].CGColor;
	strokeColorAnim.toValue            = (id)[UIColor colorWithRed:0.989 green: 0.982 blue:0.107 alpha:1].CGColor;
	strokeColorAnim.duration           = 2.96;
	strokeColorAnim.autoreverses       = YES;
	strokeColorAnim.fillMode = kCAFillModeBoth;
	strokeColorAnim.removedOnCompletion = NO;
    strokeColorAnim.repeatCount = CGFLOAT_MAX;
	
	return strokeColorAnim;
}

#pragma mark - Bezier Path

- (UIBezierPath*)textPathWithBounds:(CGRect)bound{
	UIBezierPath *textPath = [UIBezierPath bezierPath];
	CGFloat minX = CGRectGetMinX(bound), minY = CGRectGetMinY(bound), w = CGRectGetWidth(bound), h = CGRectGetHeight(bound);
	
	[textPath moveToPoint:CGPointMake(minX + 0.10454 * w, minY + 0.54956 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.08446 * w, minY + 0.55709 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.08164 * w, minY + 0.50627 * h) controlPoint1:CGPointMake(minX + 0.08408 * w, minY + 0.53701 * h) controlPoint2:CGPointMake(minX + 0.08315 * w, minY + 0.52008 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.07601 * w, minY + 0.47365 * h) controlPoint1:CGPointMake(minX + 0.08014 * w, minY + 0.49247 * h) controlPoint2:CGPointMake(minX + 0.07827 * w, minY + 0.4816 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.06832 * w, minY + 0.45671 * h) controlPoint1:CGPointMake(minX + 0.07376 * w, minY + 0.4657 * h) controlPoint2:CGPointMake(minX + 0.0712 * w, minY + 0.46006 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.05931 * w, minY + 0.45169 * h) controlPoint1:CGPointMake(minX + 0.06544 * w, minY + 0.45337 * h) controlPoint2:CGPointMake(minX + 0.06244 * w, minY + 0.45169 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04946 * w, minY + 0.46236 * h) controlPoint1:CGPointMake(minX + 0.05506 * w, minY + 0.45169 * h) controlPoint2:CGPointMake(minX + 0.05177 * w, minY + 0.45525 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04598 * w, minY + 0.49812 * h) controlPoint1:CGPointMake(minX + 0.04714 * w, minY + 0.46947 * h) controlPoint2:CGPointMake(minX + 0.04598 * w, minY + 0.48139 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04936 * w, minY + 0.53074 * h) controlPoint1:CGPointMake(minX + 0.04598 * w, minY + 0.51234 * h) controlPoint2:CGPointMake(minX + 0.04711 * w, minY + 0.52321 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.05837 * w, minY + 0.55019 * h) controlPoint1:CGPointMake(minX + 0.05161 * w, minY + 0.53827 * h) controlPoint2:CGPointMake(minX + 0.05462 * w, minY + 0.54475 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.07132 * w, minY + 0.56713 * h) controlPoint1:CGPointMake(minX + 0.06212 * w, minY + 0.55563 * h) controlPoint2:CGPointMake(minX + 0.06644 * w, minY + 0.56127 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.08652 * w, minY + 0.59222 * h) controlPoint1:CGPointMake(minX + 0.0762 * w, minY + 0.57298 * h) controlPoint2:CGPointMake(minX + 0.08127 * w, minY + 0.58135 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.10088 * w, minY + 0.64806 * h) controlPoint1:CGPointMake(minX + 0.09291 * w, minY + 0.6056 * h) controlPoint2:CGPointMake(minX + 0.09769 * w, minY + 0.62422 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.10567 * w, minY + 0.75282 * h) controlPoint1:CGPointMake(minX + 0.10407 * w, minY + 0.67189 * h) controlPoint2:CGPointMake(minX + 0.10567 * w, minY + 0.70682 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.10191 * w, minY + 0.85571 * h) controlPoint1:CGPointMake(minX + 0.10567 * w, minY + 0.79214 * h) controlPoint2:CGPointMake(minX + 0.10442 * w, minY + 0.82643 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.09225 * w, minY + 0.92848 * h) controlPoint1:CGPointMake(minX + 0.09941 * w, minY + 0.88499 * h) controlPoint2:CGPointMake(minX + 0.09619 * w, minY + 0.90924 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.07902 * w, minY + 0.97177 * h) controlPoint1:CGPointMake(minX + 0.08831 * w, minY + 0.94772 * h) controlPoint2:CGPointMake(minX + 0.0839 * w, minY + 0.96215 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.06438 * w, minY + 0.9862 * h) controlPoint1:CGPointMake(minX + 0.07414 * w, minY + 0.98139 * h) controlPoint2:CGPointMake(minX + 0.06926 * w, minY + 0.9862 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04692 * w, minY + 0.97992 * h) controlPoint1:CGPointMake(minX + 0.05712 * w, minY + 0.9862 * h) controlPoint2:CGPointMake(minX + 0.0513 * w, minY + 0.98411 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.03632 * w, minY + 0.96675 * h) controlPoint1:CGPointMake(minX + 0.04254 * w, minY + 0.97574 * h) controlPoint2:CGPointMake(minX + 0.03901 * w, minY + 0.97135 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.02994 * w, minY + 0.95358 * h) controlPoint1:CGPointMake(minX + 0.03363 * w, minY + 0.96215 * h) controlPoint2:CGPointMake(minX + 0.0315 * w, minY + 0.95776 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.02496 * w, minY + 0.9473 * h) controlPoint1:CGPointMake(minX + 0.02837 * w, minY + 0.94939 * h) controlPoint2:CGPointMake(minX + 0.02671 * w, minY + 0.9473 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.02215 * w, minY + 0.9542 * h) controlPoint1:CGPointMake(minX + 0.02384 * w, minY + 0.9473 * h) controlPoint2:CGPointMake(minX + 0.0229 * w, minY + 0.9496 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.01952 * w, minY + 0.97867 * h) controlPoint1:CGPointMake(minX + 0.0214 * w, minY + 0.9588 * h) controlPoint2:CGPointMake(minX + 0.02052 * w, minY + 0.96696 * h)];
	[textPath addLineToPoint:CGPointMake(minX, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.00563 * w, minY + 0.76412 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.02515 * w, minY + 0.7591 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.02862 * w, minY + 0.80427 * h) controlPoint1:CGPointMake(minX + 0.0254 * w, minY + 0.77666 * h) controlPoint2:CGPointMake(minX + 0.02656 * w, minY + 0.79172 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.03651 * w, minY + 0.83563 * h) controlPoint1:CGPointMake(minX + 0.03069 * w, minY + 0.81681 * h) controlPoint2:CGPointMake(minX + 0.03331 * w, minY + 0.82727 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04702 * w, minY + 0.85445 * h) controlPoint1:CGPointMake(minX + 0.0397 * w, minY + 0.844 * h) controlPoint2:CGPointMake(minX + 0.0432 * w, minY + 0.85027 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.05837 * w, minY + 0.86073 * h) controlPoint1:CGPointMake(minX + 0.05083 * w, minY + 0.85864 * h) controlPoint2:CGPointMake(minX + 0.05462 * w, minY + 0.86073 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.067 * w, minY + 0.85006 * h) controlPoint1:CGPointMake(minX + 0.062 * w, minY + 0.86073 * h) controlPoint2:CGPointMake(minX + 0.06488 * w, minY + 0.85717 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.0702 * w, minY + 0.80678 * h) controlPoint1:CGPointMake(minX + 0.06913 * w, minY + 0.84295 * h) controlPoint2:CGPointMake(minX + 0.0702 * w, minY + 0.82852 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.06738 * w, minY + 0.77666 * h) controlPoint1:CGPointMake(minX + 0.0702 * w, minY + 0.79339 * h) controlPoint2:CGPointMake(minX + 0.06926 * w, minY + 0.78335 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.05968 * w, minY + 0.76035 * h) controlPoint1:CGPointMake(minX + 0.0655 * w, minY + 0.76997 * h) controlPoint2:CGPointMake(minX + 0.06294 * w, minY + 0.76453 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.04842 * w, minY + 0.7478 * h) controlPoint1:CGPointMake(minX + 0.05643 * w, minY + 0.75617 * h) controlPoint2:CGPointMake(minX + 0.05268 * w, minY + 0.75199 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.03491 * w, minY + 0.72898 * h) controlPoint1:CGPointMake(minX + 0.04417 * w, minY + 0.74362 * h) controlPoint2:CGPointMake(minX + 0.03966 * w, minY + 0.73735 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.01623 * w, minY + 0.66311 * h) controlPoint1:CGPointMake(minX + 0.02603 * w, minY + 0.71309 * h) controlPoint2:CGPointMake(minX + 0.0198 * w, minY + 0.69113 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.01089 * w, minY + 0.54203 * h) controlPoint1:CGPointMake(minX + 0.01267 * w, minY + 0.63509 * h) controlPoint2:CGPointMake(minX + 0.01089 * w, minY + 0.59473 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.01333 * w, minY + 0.46173 * h) controlPoint1:CGPointMake(minX + 0.01089 * w, minY + 0.51443 * h) controlPoint2:CGPointMake(minX + 0.0117 * w, minY + 0.48766 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.02083 * w, minY + 0.39335 * h) controlPoint1:CGPointMake(minX + 0.01495 * w, minY + 0.4358 * h) controlPoint2:CGPointMake(minX + 0.01745 * w, minY + 0.41301 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.0336 * w, minY + 0.34567 * h) controlPoint1:CGPointMake(minX + 0.02421 * w, minY + 0.37369 * h) controlPoint2:CGPointMake(minX + 0.02847 * w, minY + 0.3578 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.0518 * w, minY + 0.32748 * h) controlPoint1:CGPointMake(minX + 0.03873 * w, minY + 0.33354 * h) controlPoint2:CGPointMake(minX + 0.04479 * w, minY + 0.32748 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.06569 * w, minY + 0.33438 * h) controlPoint1:CGPointMake(minX + 0.05743 * w, minY + 0.32748 * h) controlPoint2:CGPointMake(minX + 0.06206 * w, minY + 0.32978 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.0747 * w, minY + 0.34881 * h) controlPoint1:CGPointMake(minX + 0.06932 * w, minY + 0.33898 * h) controlPoint2:CGPointMake(minX + 0.07232 * w, minY + 0.34379 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.08052 * w, minY + 0.36324 * h) controlPoint1:CGPointMake(minX + 0.07708 * w, minY + 0.35383 * h) controlPoint2:CGPointMake(minX + 0.07902 * w, minY + 0.35864 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.08483 * w, minY + 0.37014 * h) controlPoint1:CGPointMake(minX + 0.08202 * w, minY + 0.36784 * h) controlPoint2:CGPointMake(minX + 0.08346 * w, minY + 0.37014 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.09215 * w, minY + 0.34003 * h) controlPoint1:CGPointMake(minX + 0.08684 * w, minY + 0.37014 * h) controlPoint2:CGPointMake(minX + 0.08928 * w, minY + 0.3601 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.10998 * w, minY + 0.34003 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.22635 * w, minY + 0.81807 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.22607 * w, minY + 0.82873 * h) controlPoint1:CGPointMake(minX + 0.22623 * w, minY + 0.82225 * h) controlPoint2:CGPointMake(minX + 0.22613 * w, minY + 0.82581 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.22598 * w, minY + 0.83814 * h) controlPoint1:CGPointMake(minX + 0.22601 * w, minY + 0.83166 * h) controlPoint2:CGPointMake(minX + 0.22598 * w, minY + 0.8348 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.23048 * w, minY + 0.86826 * h) controlPoint1:CGPointMake(minX + 0.22598 * w, minY + 0.85822 * h) controlPoint2:CGPointMake(minX + 0.22748 * w, minY + 0.86826 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.2348 * w, minY + 0.85383 * h) controlPoint1:CGPointMake(minX + 0.23223 * w, minY + 0.86826 * h) controlPoint2:CGPointMake(minX + 0.23367 * w, minY + 0.86345 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.23705 * w, minY + 0.81807 * h) controlPoint1:CGPointMake(minX + 0.23592 * w, minY + 0.84421 * h) controlPoint2:CGPointMake(minX + 0.23667 * w, minY + 0.83229 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.23855 * w, minY + 0.76412 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.25169 * w, minY + 0.76412 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.25094 * w, minY + 0.78795 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.2455 * w, minY + 0.89084 * h) controlPoint1:CGPointMake(minX + 0.24981 * w, minY + 0.83062 * h) controlPoint2:CGPointMake(minX + 0.248 * w, minY + 0.86491 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.23686 * w, minY + 0.95107 * h) controlPoint1:CGPointMake(minX + 0.24299 * w, minY + 0.91677 * h) controlPoint2:CGPointMake(minX + 0.24012 * w, minY + 0.93685 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.22635 * w, minY + 0.97992 * h) controlPoint1:CGPointMake(minX + 0.23361 * w, minY + 0.96529 * h) controlPoint2:CGPointMake(minX + 0.23011 * w, minY + 0.97491 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.21509 * w, minY + 0.98745 * h) controlPoint1:CGPointMake(minX + 0.2226 * w, minY + 0.98494 * h) controlPoint2:CGPointMake(minX + 0.21884 * w, minY + 0.98745 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.20298 * w, minY + 0.97867 * h) controlPoint1:CGPointMake(minX + 0.21034 * w, minY + 0.98745 * h) controlPoint2:CGPointMake(minX + 0.2063 * w, minY + 0.98453 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.19482 * w, minY + 0.95358 * h) controlPoint1:CGPointMake(minX + 0.19967 * w, minY + 0.97281 * h) controlPoint2:CGPointMake(minX + 0.19695 * w, minY + 0.96445 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.18994 * w, minY + 0.91343 * h) controlPoint1:CGPointMake(minX + 0.19269 * w, minY + 0.9427 * h) controlPoint2:CGPointMake(minX + 0.19107 * w, minY + 0.92932 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.18769 * w, minY + 0.86073 * h) controlPoint1:CGPointMake(minX + 0.18881 * w, minY + 0.89753 * h) controlPoint2:CGPointMake(minX + 0.18806 * w, minY + 0.87997 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.18196 * w, minY + 0.91217 * h) controlPoint1:CGPointMake(minX + 0.18619 * w, minY + 0.87829 * h) controlPoint2:CGPointMake(minX + 0.18428 * w, minY + 0.89544 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.17361 * w, minY + 0.95671 * h) controlPoint1:CGPointMake(minX + 0.17965 * w, minY + 0.9289 * h) controlPoint2:CGPointMake(minX + 0.17686 * w, minY + 0.94375 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16235 * w, minY + 0.98808 * h) controlPoint1:CGPointMake(minX + 0.17036 * w, minY + 0.96968 * h) controlPoint2:CGPointMake(minX + 0.1666 * w, minY + 0.98013 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.1479 * w, minY + h) controlPoint1:CGPointMake(minX + 0.1581 * w, minY + 0.99603 * h) controlPoint2:CGPointMake(minX + 0.15328 * w, minY + h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.12519 * w, minY + 0.95859 * h) controlPoint1:CGPointMake(minX + 0.13739 * w, minY + h) controlPoint2:CGPointMake(minX + 0.12982 * w, minY + 0.9862 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.11824 * w, minY + 0.83689 * h) controlPoint1:CGPointMake(minX + 0.12056 * w, minY + 0.93099 * h) controlPoint2:CGPointMake(minX + 0.11824 * w, minY + 0.89042 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.13551 * w, minY + 0.67503 * h) controlPoint1:CGPointMake(minX + 0.11824 * w, minY + 0.76579 * h) controlPoint2:CGPointMake(minX + 0.124 * w, minY + 0.71184 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.1463 * w, minY + 0.65056 * h) controlPoint1:CGPointMake(minX + 0.13864 * w, minY + 0.66499 * h) controlPoint2:CGPointMake(minX + 0.14224 * w, minY + 0.65684 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.15953 * w, minY + 0.633 * h) controlPoint1:CGPointMake(minX + 0.15037 * w, minY + 0.64429 * h) controlPoint2:CGPointMake(minX + 0.15478 * w, minY + 0.63844 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.17483 * w, minY + 0.61355 * h) controlPoint1:CGPointMake(minX + 0.16429 * w, minY + 0.62756 * h) controlPoint2:CGPointMake(minX + 0.16939 * w, minY + 0.62108 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.19182 * w, minY + 0.58344 * h) controlPoint1:CGPointMake(minX + 0.18027 * w, minY + 0.60602 * h) controlPoint2:CGPointMake(minX + 0.18594 * w, minY + 0.59599 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.19238 * w, minY + 0.56587 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.19294 * w, minY + 0.53827 * h) controlPoint1:CGPointMake(minX + 0.19263 * w, minY + 0.55667 * h) controlPoint2:CGPointMake(minX + 0.19282 * w, minY + 0.54747 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.19313 * w, minY + 0.51317 * h) controlPoint1:CGPointMake(minX + 0.19307 * w, minY + 0.52907 * h) controlPoint2:CGPointMake(minX + 0.19313 * w, minY + 0.5207 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.18966 * w, minY + 0.44166 * h) controlPoint1:CGPointMake(minX + 0.19313 * w, minY + 0.48222 * h) controlPoint2:CGPointMake(minX + 0.19197 * w, minY + 0.45839 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.17718 * w, minY + 0.41656 * h) controlPoint1:CGPointMake(minX + 0.18734 * w, minY + 0.42493 * h) controlPoint2:CGPointMake(minX + 0.18318 * w, minY + 0.41656 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16676 * w, minY + 0.42221 * h) controlPoint1:CGPointMake(minX + 0.17317 * w, minY + 0.41656 * h) controlPoint2:CGPointMake(minX + 0.1697 * w, minY + 0.41844 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.15747 * w, minY + 0.44542 * h) controlPoint1:CGPointMake(minX + 0.16382 * w, minY + 0.42597 * h) controlPoint2:CGPointMake(minX + 0.16072 * w, minY + 0.43371 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16488 * w, minY + 0.46048 * h) controlPoint1:CGPointMake(minX + 0.16035 * w, minY + 0.44709 * h) controlPoint2:CGPointMake(minX + 0.16282 * w, minY + 0.45211 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16798 * w, minY + 0.50941 * h) controlPoint1:CGPointMake(minX + 0.16695 * w, minY + 0.46884 * h) controlPoint2:CGPointMake(minX + 0.16798 * w, minY + 0.48515 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16273 * w, minY + 0.57779 * h) controlPoint1:CGPointMake(minX + 0.16798 * w, minY + 0.53618 * h) controlPoint2:CGPointMake(minX + 0.16623 * w, minY + 0.55897 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.14884 * w, minY + 0.60602 * h) controlPoint1:CGPointMake(minX + 0.15922 * w, minY + 0.59661 * h) controlPoint2:CGPointMake(minX + 0.15459 * w, minY + 0.60602 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.13664 * w, minY + 0.58657 * h) controlPoint1:CGPointMake(minX + 0.14321 * w, minY + 0.60602 * h) controlPoint2:CGPointMake(minX + 0.13914 * w, minY + 0.59954 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.13288 * w, minY + 0.5207 * h) controlPoint1:CGPointMake(minX + 0.13413 * w, minY + 0.57361 * h) controlPoint2:CGPointMake(minX + 0.13288 * w, minY + 0.55165 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.13654 * w, minY + 0.44228 * h) controlPoint1:CGPointMake(minX + 0.13288 * w, minY + 0.4931 * h) controlPoint2:CGPointMake(minX + 0.1341 * w, minY + 0.46696 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.14715 * w, minY + 0.37704 * h) controlPoint1:CGPointMake(minX + 0.13898 * w, minY + 0.41761 * h) controlPoint2:CGPointMake(minX + 0.14252 * w, minY + 0.39586 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16432 * w, minY + 0.33187 * h) controlPoint1:CGPointMake(minX + 0.15178 * w, minY + 0.35822 * h) controlPoint2:CGPointMake(minX + 0.1575 * w, minY + 0.34316 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.1875 * w, minY + 0.31493 * h) controlPoint1:CGPointMake(minX + 0.17114 * w, minY + 0.32058 * h) controlPoint2:CGPointMake(minX + 0.17887 * w, minY + 0.31493 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.20289 * w, minY + 0.32434 * h) controlPoint1:CGPointMake(minX + 0.19238 * w, minY + 0.31493 * h) controlPoint2:CGPointMake(minX + 0.19751 * w, minY + 0.31807 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.21772 * w, minY + 0.35822 * h) controlPoint1:CGPointMake(minX + 0.20827 * w, minY + 0.33061 * h) controlPoint2:CGPointMake(minX + 0.21321 * w, minY + 0.34191 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.22889 * w, minY + 0.42409 * h) controlPoint1:CGPointMake(minX + 0.22222 * w, minY + 0.37453 * h) controlPoint2:CGPointMake(minX + 0.22594 * w, minY + 0.39649 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.2333 * w, minY + 0.52949 * h) controlPoint1:CGPointMake(minX + 0.23183 * w, minY + 0.45169 * h) controlPoint2:CGPointMake(minX + 0.2333 * w, minY + 0.48683 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.23273 * w, minY + 0.57716 * h) controlPoint1:CGPointMake(minX + 0.2333 * w, minY + 0.54538 * h) controlPoint2:CGPointMake(minX + 0.23311 * w, minY + 0.56127 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.1905 * w, minY + 0.63864 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.17793 * w, minY + 0.68256 * h) controlPoint1:CGPointMake(minX + 0.186 * w, minY + 0.65705 * h) controlPoint2:CGPointMake(minX + 0.18181 * w, minY + 0.67169 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16779 * w, minY + 0.71393 * h) controlPoint1:CGPointMake(minX + 0.17405 * w, minY + 0.69343 * h) controlPoint2:CGPointMake(minX + 0.17067 * w, minY + 0.70389 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16104 * w, minY + 0.74906 * h) controlPoint1:CGPointMake(minX + 0.16491 * w, minY + 0.72396 * h) controlPoint2:CGPointMake(minX + 0.16266 * w, minY + 0.73568 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.1586 * w, minY + 0.80552 * h) controlPoint1:CGPointMake(minX + 0.15941 * w, minY + 0.76244 * h) controlPoint2:CGPointMake(minX + 0.1586 * w, minY + 0.78126 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16038 * w, minY + 0.83563 * h) controlPoint1:CGPointMake(minX + 0.1586 * w, minY + 0.81723 * h) controlPoint2:CGPointMake(minX + 0.15919 * w, minY + 0.82727 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.16667 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.16157 * w, minY + 0.844 * h) controlPoint2:CGPointMake(minX + 0.16366 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.17802 * w, minY + 0.82434 * h) controlPoint1:CGPointMake(minX + 0.17055 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.17433 * w, minY + 0.84023 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.1875 * w, minY + 0.75659 * h) controlPoint1:CGPointMake(minX + 0.18171 * w, minY + 0.80845 * h) controlPoint2:CGPointMake(minX + 0.18487 * w, minY + 0.78586 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.45927 * w, minY + 0.80176 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.47279 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.45927 * w, minY + 0.83271 * h) controlPoint2:CGPointMake(minX + 0.46378 * w, minY + 0.84818 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.46941 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.40315 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.40653 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.4161 * w, minY + 0.79172 * h) controlPoint1:CGPointMake(minX + 0.41191 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.4151 * w, minY + 0.82936 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.41929 * w, minY + 0.67127 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.42042 * w, minY + 0.59348 * h) controlPoint1:CGPointMake(minX + 0.42005 * w, minY + 0.64115 * h) controlPoint2:CGPointMake(minX + 0.42042 * w, minY + 0.61522 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.41366 * w, minY + 0.51443 * h) controlPoint1:CGPointMake(minX + 0.42042 * w, minY + 0.54078 * h) controlPoint2:CGPointMake(minX + 0.41817 * w, minY + 0.51443 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.39433 * w, minY + 0.65747 * h) controlPoint1:CGPointMake(minX + 0.40578 * w, minY + 0.51443 * h) controlPoint2:CGPointMake(minX + 0.39934 * w, minY + 0.56211 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.39058 * w, minY + 0.80678 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.39245 * w, minY + 0.83814 * h) controlPoint1:CGPointMake(minX + 0.39058 * w, minY + 0.821 * h) controlPoint2:CGPointMake(minX + 0.3912 * w, minY + 0.83145 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.39733 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.39371 * w, minY + 0.84483 * h) controlPoint2:CGPointMake(minX + 0.39533 * w, minY + 0.84818 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.39396 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.33446 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.33784 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.34722 * w, minY + 0.79172 * h) controlPoint1:CGPointMake(minX + 0.34309 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.34622 * w, minY + 0.82936 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.35041 * w, minY + 0.67127 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.35154 * w, minY + 0.59222 * h) controlPoint1:CGPointMake(minX + 0.35116 * w, minY + 0.64032 * h) controlPoint2:CGPointMake(minX + 0.35154 * w, minY + 0.61397 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.34478 * w, minY + 0.51443 * h) controlPoint1:CGPointMake(minX + 0.35154 * w, minY + 0.54036 * h) controlPoint2:CGPointMake(minX + 0.34929 * w, minY + 0.51443 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.32564 * w, minY + 0.65747 * h) controlPoint1:CGPointMake(minX + 0.33702 * w, minY + 0.51443 * h) controlPoint2:CGPointMake(minX + 0.33064 * w, minY + 0.56211 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.3217 * w, minY + 0.80928 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.32864 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.3217 * w, minY + 0.83522 * h) controlPoint2:CGPointMake(minX + 0.32401 * w, minY + 0.84818 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.32526 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.2592 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.26258 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.27853 * w, minY + 0.79172 * h) controlPoint1:CGPointMake(minX + 0.27221 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.27753 * w, minY + 0.82936 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.28547 * w, minY + 0.52572 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.28557 * w, minY + 0.5207 * h) controlPoint1:CGPointMake(minX + 0.28547 * w, minY + 0.52405 * h) controlPoint2:CGPointMake(minX + 0.2855 * w, minY + 0.52238 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.28566 * w, minY + 0.51568 * h) controlPoint1:CGPointMake(minX + 0.28563 * w, minY + 0.51903 * h) controlPoint2:CGPointMake(minX + 0.28566 * w, minY + 0.51736 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.27271 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.28566 * w, minY + 0.48473 * h) controlPoint2:CGPointMake(minX + 0.28134 * w, minY + 0.46926 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.27609 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.3339 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.33052 * w, minY + 0.46801 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.37106 * w, minY + 0.32748 * h) controlPoint1:CGPointMake(minX + 0.34078 * w, minY + 0.37432 * h) controlPoint2:CGPointMake(minX + 0.35429 * w, minY + 0.32748 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.39114 * w, minY + 0.36261 * h) controlPoint1:CGPointMake(minX + 0.37932 * w, minY + 0.32748 * h) controlPoint2:CGPointMake(minX + 0.38601 * w, minY + 0.33919 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.39884 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.39627 * w, minY + 0.38603 * h) controlPoint2:CGPointMake(minX + 0.39884 * w, minY + 0.42158 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.41761 * w, minY + 0.35822 * h) controlPoint1:CGPointMake(minX + 0.40484 * w, minY + 0.41573 * h) controlPoint2:CGPointMake(minX + 0.4111 * w, minY + 0.37871 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.43975 * w, minY + 0.32748 * h) controlPoint1:CGPointMake(minX + 0.42411 * w, minY + 0.33772 * h) controlPoint2:CGPointMake(minX + 0.43149 * w, minY + 0.32748 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.45983 * w, minY + 0.36386 * h) controlPoint1:CGPointMake(minX + 0.44814 * w, minY + 0.32748 * h) controlPoint2:CGPointMake(minX + 0.45483 * w, minY + 0.33961 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.46734 * w, minY + 0.47553 * h) controlPoint1:CGPointMake(minX + 0.46484 * w, minY + 0.38812 * h) controlPoint2:CGPointMake(minX + 0.46734 * w, minY + 0.42534 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.46678 * w, minY + 0.51443 * h) controlPoint1:CGPointMake(minX + 0.46734 * w, minY + 0.48808 * h) controlPoint2:CGPointMake(minX + 0.46715 * w, minY + 0.50105 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.61655 * w, minY + 0.80301 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.63119 * w, minY + 0.84944 * h) controlPoint1:CGPointMake(minX + 0.61655 * w, minY + 0.83396 * h) controlPoint2:CGPointMake(minX + 0.62143 * w, minY + 0.84944 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.62782 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.56926 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.57207 * w, minY + 0.85696 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.55302 * w, minY + 0.95985 * h) controlPoint1:CGPointMake(minX + 0.56644 * w, minY + 0.90464 * h) controlPoint2:CGPointMake(minX + 0.56009 * w, minY + 0.93894 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.52778 * w, minY + 0.99122 * h) controlPoint1:CGPointMake(minX + 0.54595 * w, minY + 0.98076 * h) controlPoint2:CGPointMake(minX + 0.53754 * w, minY + 0.99122 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.51042 * w, minY + 0.95671 * h) controlPoint1:CGPointMake(minX + 0.52027 * w, minY + 0.99122 * h) controlPoint2:CGPointMake(minX + 0.51448 * w, minY + 0.97972 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.50432 * w, minY + 0.8532 * h) controlPoint1:CGPointMake(minX + 0.50635 * w, minY + 0.93371 * h) controlPoint2:CGPointMake(minX + 0.50432 * w, minY + 0.89921 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.5045 * w, minY + 0.82936 * h) controlPoint1:CGPointMake(minX + 0.50432 * w, minY + 0.84483 * h) controlPoint2:CGPointMake(minX + 0.50438 * w, minY + 0.83689 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.50507 * w, minY + 0.80427 * h) controlPoint1:CGPointMake(minX + 0.50463 * w, minY + 0.82183 * h) controlPoint2:CGPointMake(minX + 0.50482 * w, minY + 0.81347 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.51239 * w, minY + 0.51694 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.49775 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.51239 * w, minY + 0.48515 * h) controlPoint2:CGPointMake(minX + 0.50751 * w, minY + 0.46926 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.50113 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.5595 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.55124 * w, minY + 0.65245 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.55011 * w, minY + 0.72773 * h) controlPoint1:CGPointMake(minX + 0.55049 * w, minY + 0.68172 * h) controlPoint2:CGPointMake(minX + 0.55011 * w, minY + 0.70682 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.55781 * w, minY + 0.80928 * h) controlPoint1:CGPointMake(minX + 0.55011 * w, minY + 0.7821 * h) controlPoint2:CGPointMake(minX + 0.55268 * w, minY + 0.80928 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.56869 * w, minY + 0.77353 * h) controlPoint1:CGPointMake(minX + 0.56206 * w, minY + 0.80928 * h) controlPoint2:CGPointMake(minX + 0.56569 * w, minY + 0.79737 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.57733 * w, minY + 0.66625 * h) controlPoint1:CGPointMake(minX + 0.5717 * w, minY + 0.74969 * h) controlPoint2:CGPointMake(minX + 0.57457 * w, minY + 0.71393 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.58127 * w, minY + 0.51568 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.5702 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.58127 * w, minY + 0.48473 * h) controlPoint2:CGPointMake(minX + 0.57758 * w, minY + 0.46926 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.57357 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.62857 * w, minY + 0.34003 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.71622 * w, minY + 0.4542 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73076 * w, minY + 0.35006 * h) controlPoint1:CGPointMake(minX + 0.72035 * w, minY + 0.4082 * h) controlPoint2:CGPointMake(minX + 0.72519 * w, minY + 0.37348 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.75038 * w, minY + 0.31493 * h) controlPoint1:CGPointMake(minX + 0.73633 * w, minY + 0.32664 * h) controlPoint2:CGPointMake(minX + 0.74287 * w, minY + 0.31493 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.75835 * w, minY + 0.32371 * h) controlPoint1:CGPointMake(minX + 0.75313 * w, minY + 0.31493 * h) controlPoint2:CGPointMake(minX + 0.75579 * w, minY + 0.31786 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.7653 * w, minY + 0.35132 * h) controlPoint1:CGPointMake(minX + 0.76092 * w, minY + 0.32957 * h) controlPoint2:CGPointMake(minX + 0.76323 * w, minY + 0.33877 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.77027 * w, minY + 0.399 * h) controlPoint1:CGPointMake(minX + 0.76736 * w, minY + 0.36386 * h) controlPoint2:CGPointMake(minX + 0.76902 * w, minY + 0.37976 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.77215 * w, minY + 0.46675 * h) controlPoint1:CGPointMake(minX + 0.77152 * w, minY + 0.41824 * h) controlPoint2:CGPointMake(minX + 0.77215 * w, minY + 0.44082 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.77074 * w, minY + 0.53074 * h) controlPoint1:CGPointMake(minX + 0.77215 * w, minY + 0.4885 * h) controlPoint2:CGPointMake(minX + 0.77168 * w, minY + 0.50983 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.76661 * w, minY + 0.58657 * h) controlPoint1:CGPointMake(minX + 0.7698 * w, minY + 0.55165 * h) controlPoint2:CGPointMake(minX + 0.76842 * w, minY + 0.57026 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.75976 * w, minY + 0.62547 * h) controlPoint1:CGPointMake(minX + 0.7648 * w, minY + 0.60289 * h) controlPoint2:CGPointMake(minX + 0.76251 * w, minY + 0.61585 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.75 * w, minY + 0.6399 * h) controlPoint1:CGPointMake(minX + 0.75701 * w, minY + 0.63509 * h) controlPoint2:CGPointMake(minX + 0.75375 * w, minY + 0.6399 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73752 * w, minY + 0.6123 * h) controlPoint1:CGPointMake(minX + 0.74462 * w, minY + 0.6399 * h) controlPoint2:CGPointMake(minX + 0.74046 * w, minY + 0.6307 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73311 * w, minY + 0.54454 * h) controlPoint1:CGPointMake(minX + 0.73458 * w, minY + 0.59389 * h) controlPoint2:CGPointMake(minX + 0.73311 * w, minY + 0.57131 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73667 * w, minY + 0.48055 * h) controlPoint1:CGPointMake(minX + 0.73311 * w, minY + 0.52028 * h) controlPoint2:CGPointMake(minX + 0.7343 * w, minY + 0.49895 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.74737 * w, minY + 0.44793 * h) controlPoint1:CGPointMake(minX + 0.73905 * w, minY + 0.46215 * h) controlPoint2:CGPointMake(minX + 0.74262 * w, minY + 0.45128 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73949 * w, minY + 0.42284 * h) controlPoint1:CGPointMake(minX + 0.74562 * w, minY + 0.4312 * h) controlPoint2:CGPointMake(minX + 0.74299 * w, minY + 0.42284 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.73076 * w, minY + 0.44166 * h) controlPoint1:CGPointMake(minX + 0.73649 * w, minY + 0.42284 * h) controlPoint2:CGPointMake(minX + 0.73358 * w, minY + 0.42911 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.72288 * w, minY + 0.48871 * h) controlPoint1:CGPointMake(minX + 0.72795 * w, minY + 0.4542 * h) controlPoint2:CGPointMake(minX + 0.72532 * w, minY + 0.46989 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.7164 * w, minY + 0.55144 * h) controlPoint1:CGPointMake(minX + 0.72044 * w, minY + 0.50753 * h) controlPoint2:CGPointMake(minX + 0.71828 * w, minY + 0.52844 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.7119 * w, minY + 0.61731 * h) controlPoint1:CGPointMake(minX + 0.71453 * w, minY + 0.57445 * h) controlPoint2:CGPointMake(minX + 0.71303 * w, minY + 0.5964 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.70721 * w, minY + 0.79925 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.71209 * w, minY + 0.83626 * h) controlPoint1:CGPointMake(minX + 0.70721 * w, minY + 0.81598 * h) controlPoint2:CGPointMake(minX + 0.70883 * w, minY + 0.82831 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.7241 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.71534 * w, minY + 0.84421 * h) controlPoint2:CGPointMake(minX + 0.71934 * w, minY + 0.84818 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.72072 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.64283 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.64621 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.66366 * w, minY + 0.79172 * h) controlPoint1:CGPointMake(minX + 0.65684 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.66266 * w, minY + 0.82936 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.67061 * w, minY + 0.51694 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.65634 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.67061 * w, minY + 0.48515 * h) controlPoint2:CGPointMake(minX + 0.66585 * w, minY + 0.46926 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.65972 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.71922 * w, minY + 0.34003 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.88514 * w, minY + 0.81807 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.88485 * w, minY + 0.82873 * h) controlPoint1:CGPointMake(minX + 0.88501 * w, minY + 0.82225 * h) controlPoint2:CGPointMake(minX + 0.88492 * w, minY + 0.82581 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.88476 * w, minY + 0.83814 * h) controlPoint1:CGPointMake(minX + 0.88479 * w, minY + 0.83166 * h) controlPoint2:CGPointMake(minX + 0.88476 * w, minY + 0.8348 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.88926 * w, minY + 0.86826 * h) controlPoint1:CGPointMake(minX + 0.88476 * w, minY + 0.85822 * h) controlPoint2:CGPointMake(minX + 0.88626 * w, minY + 0.86826 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.89358 * w, minY + 0.85383 * h) controlPoint1:CGPointMake(minX + 0.89102 * w, minY + 0.86826 * h) controlPoint2:CGPointMake(minX + 0.89245 * w, minY + 0.86345 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.89583 * w, minY + 0.81807 * h) controlPoint1:CGPointMake(minX + 0.89471 * w, minY + 0.84421 * h) controlPoint2:CGPointMake(minX + 0.89546 * w, minY + 0.83229 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.89733 * w, minY + 0.76412 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.91047 * w, minY + 0.76412 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.90972 * w, minY + 0.78795 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.90428 * w, minY + 0.89084 * h) controlPoint1:CGPointMake(minX + 0.9086 * w, minY + 0.83062 * h) controlPoint2:CGPointMake(minX + 0.90678 * w, minY + 0.86491 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.89565 * w, minY + 0.95107 * h) controlPoint1:CGPointMake(minX + 0.90178 * w, minY + 0.91677 * h) controlPoint2:CGPointMake(minX + 0.8989 * w, minY + 0.93685 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.88514 * w, minY + 0.97992 * h) controlPoint1:CGPointMake(minX + 0.89239 * w, minY + 0.96529 * h) controlPoint2:CGPointMake(minX + 0.88889 * w, minY + 0.97491 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.87387 * w, minY + 0.98745 * h) controlPoint1:CGPointMake(minX + 0.88138 * w, minY + 0.98494 * h) controlPoint2:CGPointMake(minX + 0.87763 * w, minY + 0.98745 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.86177 * w, minY + 0.97867 * h) controlPoint1:CGPointMake(minX + 0.86912 * w, minY + 0.98745 * h) controlPoint2:CGPointMake(minX + 0.86508 * w, minY + 0.98453 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.8536 * w, minY + 0.95358 * h) controlPoint1:CGPointMake(minX + 0.85845 * w, minY + 0.97281 * h) controlPoint2:CGPointMake(minX + 0.85573 * w, minY + 0.96445 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84872 * w, minY + 0.91343 * h) controlPoint1:CGPointMake(minX + 0.85148 * w, minY + 0.9427 * h) controlPoint2:CGPointMake(minX + 0.84985 * w, minY + 0.92932 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84647 * w, minY + 0.86073 * h) controlPoint1:CGPointMake(minX + 0.8476 * w, minY + 0.89753 * h) controlPoint2:CGPointMake(minX + 0.84685 * w, minY + 0.87997 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84075 * w, minY + 0.91217 * h) controlPoint1:CGPointMake(minX + 0.84497 * w, minY + 0.87829 * h) controlPoint2:CGPointMake(minX + 0.84306 * w, minY + 0.89544 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.83239 * w, minY + 0.95671 * h) controlPoint1:CGPointMake(minX + 0.83843 * w, minY + 0.9289 * h) controlPoint2:CGPointMake(minX + 0.83565 * w, minY + 0.94375 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82113 * w, minY + 0.98808 * h) controlPoint1:CGPointMake(minX + 0.82914 * w, minY + 0.96968 * h) controlPoint2:CGPointMake(minX + 0.82539 * w, minY + 0.98013 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.80668 * w, minY + h) controlPoint1:CGPointMake(minX + 0.81688 * w, minY + 0.99603 * h) controlPoint2:CGPointMake(minX + 0.81206 * w, minY + h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.78397 * w, minY + 0.95859 * h) controlPoint1:CGPointMake(minX + 0.79617 * w, minY + h) controlPoint2:CGPointMake(minX + 0.7886 * w, minY + 0.9862 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.77703 * w, minY + 0.83689 * h) controlPoint1:CGPointMake(minX + 0.77934 * w, minY + 0.93099 * h) controlPoint2:CGPointMake(minX + 0.77703 * w, minY + 0.89042 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.79429 * w, minY + 0.67503 * h) controlPoint1:CGPointMake(minX + 0.77703 * w, minY + 0.76579 * h) controlPoint2:CGPointMake(minX + 0.78278 * w, minY + 0.71184 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.80509 * w, minY + 0.65056 * h) controlPoint1:CGPointMake(minX + 0.79742 * w, minY + 0.66499 * h) controlPoint2:CGPointMake(minX + 0.80102 * w, minY + 0.65684 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.81832 * w, minY + 0.633 * h) controlPoint1:CGPointMake(minX + 0.80915 * w, minY + 0.64429 * h) controlPoint2:CGPointMake(minX + 0.81356 * w, minY + 0.63844 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.83361 * w, minY + 0.61355 * h) controlPoint1:CGPointMake(minX + 0.82307 * w, minY + 0.62756 * h) controlPoint2:CGPointMake(minX + 0.82817 * w, minY + 0.62108 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.8506 * w, minY + 0.58344 * h) controlPoint1:CGPointMake(minX + 0.83906 * w, minY + 0.60602 * h) controlPoint2:CGPointMake(minX + 0.84472 * w, minY + 0.59599 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.85116 * w, minY + 0.56587 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.85173 * w, minY + 0.53827 * h) controlPoint1:CGPointMake(minX + 0.85141 * w, minY + 0.55667 * h) controlPoint2:CGPointMake(minX + 0.8516 * w, minY + 0.54747 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.85191 * w, minY + 0.51317 * h) controlPoint1:CGPointMake(minX + 0.85185 * w, minY + 0.52907 * h) controlPoint2:CGPointMake(minX + 0.85191 * w, minY + 0.5207 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84844 * w, minY + 0.44166 * h) controlPoint1:CGPointMake(minX + 0.85191 * w, minY + 0.48222 * h) controlPoint2:CGPointMake(minX + 0.85076 * w, minY + 0.45839 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.83596 * w, minY + 0.41656 * h) controlPoint1:CGPointMake(minX + 0.84613 * w, minY + 0.42493 * h) controlPoint2:CGPointMake(minX + 0.84197 * w, minY + 0.41656 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82554 * w, minY + 0.42221 * h) controlPoint1:CGPointMake(minX + 0.83196 * w, minY + 0.41656 * h) controlPoint2:CGPointMake(minX + 0.82848 * w, minY + 0.41844 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.81625 * w, minY + 0.44542 * h) controlPoint1:CGPointMake(minX + 0.8226 * w, minY + 0.42597 * h) controlPoint2:CGPointMake(minX + 0.81951 * w, minY + 0.43371 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82367 * w, minY + 0.46048 * h) controlPoint1:CGPointMake(minX + 0.81913 * w, minY + 0.44709 * h) controlPoint2:CGPointMake(minX + 0.8216 * w, minY + 0.45211 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82676 * w, minY + 0.50941 * h) controlPoint1:CGPointMake(minX + 0.82573 * w, minY + 0.46884 * h) controlPoint2:CGPointMake(minX + 0.82676 * w, minY + 0.48515 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82151 * w, minY + 0.57779 * h) controlPoint1:CGPointMake(minX + 0.82676 * w, minY + 0.53618 * h) controlPoint2:CGPointMake(minX + 0.82501 * w, minY + 0.55897 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.80762 * w, minY + 0.60602 * h) controlPoint1:CGPointMake(minX + 0.81801 * w, minY + 0.59661 * h) controlPoint2:CGPointMake(minX + 0.81338 * w, minY + 0.60602 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.79542 * w, minY + 0.58657 * h) controlPoint1:CGPointMake(minX + 0.80199 * w, minY + 0.60602 * h) controlPoint2:CGPointMake(minX + 0.79792 * w, minY + 0.59954 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.79167 * w, minY + 0.5207 * h) controlPoint1:CGPointMake(minX + 0.79292 * w, minY + 0.57361 * h) controlPoint2:CGPointMake(minX + 0.79167 * w, minY + 0.55165 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.79533 * w, minY + 0.44228 * h) controlPoint1:CGPointMake(minX + 0.79167 * w, minY + 0.4931 * h) controlPoint2:CGPointMake(minX + 0.79289 * w, minY + 0.46696 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.80593 * w, minY + 0.37704 * h) controlPoint1:CGPointMake(minX + 0.79777 * w, minY + 0.41761 * h) controlPoint2:CGPointMake(minX + 0.8013 * w, minY + 0.39586 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.8231 * w, minY + 0.33187 * h) controlPoint1:CGPointMake(minX + 0.81056 * w, minY + 0.35822 * h) controlPoint2:CGPointMake(minX + 0.81629 * w, minY + 0.34316 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84628 * w, minY + 0.31493 * h) controlPoint1:CGPointMake(minX + 0.82992 * w, minY + 0.32058 * h) controlPoint2:CGPointMake(minX + 0.83765 * w, minY + 0.31493 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.86167 * w, minY + 0.32434 * h) controlPoint1:CGPointMake(minX + 0.85116 * w, minY + 0.31493 * h) controlPoint2:CGPointMake(minX + 0.85629 * w, minY + 0.31807 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.8765 * w, minY + 0.35822 * h) controlPoint1:CGPointMake(minX + 0.86705 * w, minY + 0.33061 * h) controlPoint2:CGPointMake(minX + 0.872 * w, minY + 0.34191 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.88767 * w, minY + 0.42409 * h) controlPoint1:CGPointMake(minX + 0.88101 * w, minY + 0.37453 * h) controlPoint2:CGPointMake(minX + 0.88473 * w, minY + 0.39649 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.89208 * w, minY + 0.52949 * h) controlPoint1:CGPointMake(minX + 0.89061 * w, minY + 0.45169 * h) controlPoint2:CGPointMake(minX + 0.89208 * w, minY + 0.48683 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.89152 * w, minY + 0.57716 * h) controlPoint1:CGPointMake(minX + 0.89208 * w, minY + 0.54538 * h) controlPoint2:CGPointMake(minX + 0.89189 * w, minY + 0.56127 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.84929 * w, minY + 0.63864 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.83671 * w, minY + 0.68256 * h) controlPoint1:CGPointMake(minX + 0.84478 * w, minY + 0.65705 * h) controlPoint2:CGPointMake(minX + 0.84059 * w, minY + 0.67169 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82658 * w, minY + 0.71393 * h) controlPoint1:CGPointMake(minX + 0.83283 * w, minY + 0.69343 * h) controlPoint2:CGPointMake(minX + 0.82945 * w, minY + 0.70389 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.81982 * w, minY + 0.74906 * h) controlPoint1:CGPointMake(minX + 0.8237 * w, minY + 0.72396 * h) controlPoint2:CGPointMake(minX + 0.82145 * w, minY + 0.73568 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.81738 * w, minY + 0.80552 * h) controlPoint1:CGPointMake(minX + 0.81819 * w, minY + 0.76244 * h) controlPoint2:CGPointMake(minX + 0.81738 * w, minY + 0.78126 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.81916 * w, minY + 0.83563 * h) controlPoint1:CGPointMake(minX + 0.81738 * w, minY + 0.81723 * h) controlPoint2:CGPointMake(minX + 0.81797 * w, minY + 0.82727 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.82545 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.82035 * w, minY + 0.844 * h) controlPoint2:CGPointMake(minX + 0.82245 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.83681 * w, minY + 0.82434 * h) controlPoint1:CGPointMake(minX + 0.82933 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.83311 * w, minY + 0.84023 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.84628 * w, minY + 0.75659 * h) controlPoint1:CGPointMake(minX + 0.8405 * w, minY + 0.80845 * h) controlPoint2:CGPointMake(minX + 0.84366 * w, minY + 0.78586 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + 0.98236 * w, minY + 0.80176 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.99718 * w, minY + 0.84818 * h) controlPoint1:CGPointMake(minX + 0.98236 * w, minY + 0.83271 * h) controlPoint2:CGPointMake(minX + 0.9873 * w, minY + 0.84818 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.99381 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.91798 * w, minY + 0.97867 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.92136 * w, minY + 0.84818 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.93881 * w, minY + 0.79172 * h) controlPoint1:CGPointMake(minX + 0.93199 * w, minY + 0.84818 * h) controlPoint2:CGPointMake(minX + 0.93781 * w, minY + 0.82936 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.94576 * w, minY + 0.51819 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.93131 * w, minY + 0.46926 * h) controlPoint1:CGPointMake(minX + 0.94576 * w, minY + 0.48557 * h) controlPoint2:CGPointMake(minX + 0.94094 * w, minY + 0.46926 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.93468 * w, minY + 0.34003 * h)];
	[textPath addLineToPoint:CGPointMake(minX + 0.99437 * w, minY + 0.34003 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + w, minY + 0.14555 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.99831 * w, minY + 0.20201 * h) controlPoint1:CGPointMake(minX + w, minY + 0.16562 * h) controlPoint2:CGPointMake(minX + 0.99944 * w, minY + 0.18444 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.99362 * w, minY + 0.24843 * h) controlPoint1:CGPointMake(minX + 0.99718 * w, minY + 0.21957 * h) controlPoint2:CGPointMake(minX + 0.99562 * w, minY + 0.23505 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.98667 * w, minY + 0.2798 * h) controlPoint1:CGPointMake(minX + 0.99162 * w, minY + 0.26182 * h) controlPoint2:CGPointMake(minX + 0.9893 * w, minY + 0.27227 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.97823 * w, minY + 0.29109 * h) controlPoint1:CGPointMake(minX + 0.98405 * w, minY + 0.28733 * h) controlPoint2:CGPointMake(minX + 0.98123 * w, minY + 0.29109 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.96978 * w, minY + 0.2798 * h) controlPoint1:CGPointMake(minX + 0.97523 * w, minY + 0.29109 * h) controlPoint2:CGPointMake(minX + 0.97241 * w, minY + 0.28733 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.96284 * w, minY + 0.24843 * h) controlPoint1:CGPointMake(minX + 0.96715 * w, minY + 0.27227 * h) controlPoint2:CGPointMake(minX + 0.96484 * w, minY + 0.26182 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.95815 * w, minY + 0.20201 * h) controlPoint1:CGPointMake(minX + 0.96084 * w, minY + 0.23505 * h) controlPoint2:CGPointMake(minX + 0.95927 * w, minY + 0.21957 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.95646 * w, minY + 0.14555 * h) controlPoint1:CGPointMake(minX + 0.95702 * w, minY + 0.18444 * h) controlPoint2:CGPointMake(minX + 0.95646 * w, minY + 0.16562 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.95815 * w, minY + 0.08908 * h) controlPoint1:CGPointMake(minX + 0.95646 * w, minY + 0.12547 * h) controlPoint2:CGPointMake(minX + 0.95702 * w, minY + 0.10665 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.96284 * w, minY + 0.04266 * h) controlPoint1:CGPointMake(minX + 0.95927 * w, minY + 0.07152 * h) controlPoint2:CGPointMake(minX + 0.96084 * w, minY + 0.05604 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.96978 * w, minY + 0.01129 * h) controlPoint1:CGPointMake(minX + 0.96484 * w, minY + 0.02928 * h) controlPoint2:CGPointMake(minX + 0.96715 * w, minY + 0.01882 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.97823 * w, minY) controlPoint1:CGPointMake(minX + 0.97241 * w, minY + 0.00376 * h) controlPoint2:CGPointMake(minX + 0.97523 * w, minY)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.98667 * w, minY + 0.01129 * h) controlPoint1:CGPointMake(minX + 0.98123 * w, minY) controlPoint2:CGPointMake(minX + 0.98405 * w, minY + 0.00376 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.99362 * w, minY + 0.04266 * h) controlPoint1:CGPointMake(minX + 0.9893 * w, minY + 0.01882 * h) controlPoint2:CGPointMake(minX + 0.99162 * w, minY + 0.02928 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + 0.99831 * w, minY + 0.08908 * h) controlPoint1:CGPointMake(minX + 0.99562 * w, minY + 0.05604 * h) controlPoint2:CGPointMake(minX + 0.99718 * w, minY + 0.07152 * h)];
	[textPath addCurveToPoint:CGPointMake(minX + w, minY + 0.14555 * h) controlPoint1:CGPointMake(minX + 0.99944 * w, minY + 0.10665 * h) controlPoint2:CGPointMake(minX + w, minY + 0.12547 * h)];
	[textPath closePath];
	[textPath moveToPoint:CGPointMake(minX + w, minY + 0.14555 * h)];
	
	return textPath;
}

@end