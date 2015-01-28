//
//  BaseFlowTextInputView.m
//  test
//
//  Created by XiangqiTu on 14-11-20.
//
//

#import "BaseFlowTextBubbleView.h"
#import "CLTextLabel.h"
#import "CLCircleView.h"
#import "UIView+Frame.h"

const CGFloat MAX_FONT_SIZE = 50.0;
const CGFloat MIN_FONT_SIZE = 11.0;

const CGFloat kControlSide = 30;

const NSString *defaultTextString = @"双击进行编辑";

static NSString* const CLTextViewActiveViewDidChangeNotification = @"CLTextViewActiveViewDidChangeNotificationString";
static NSString* const CLTextViewActiveViewDidTapNotification = @"CLTextViewActiveViewDidTapNotificationString";

@interface BaseFlowTextBubbleView ()
{
    CLTextLabel *_label;
    UIButton *_deleteButton;
    UIButton *_editeButton;
    CLCircleView *_circleView;
    
    CGFloat _scale;
    CGFloat _arg;
    
    CGPoint _initialPoint;
    CGFloat _initialArg;
    CGFloat _initialScale;
}

@property (nonatomic, strong) UIImageView   *bubbleBgImageView;

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, strong) UIColor *borderColor;
@property (nonatomic, assign) CGFloat borderWidth;
@property (nonatomic, assign) NSTextAlignment textAlignment;

@property (nonatomic, assign) CGSize  orignSize;
@property (nonatomic, assign) CGSize  controlLimitSize; //setup maxWidth and minHeight

@end

@implementation BaseFlowTextBubbleView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
    }
    
    return self;
}

+ (void)setActiveTextView:(BaseFlowTextBubbleView*)view
{
    static BaseFlowTextBubbleView *activeView = nil;
    if(view != activeView){
        [activeView setAvtive:NO];
        activeView = view;
        [activeView setAvtive:YES];
        
        [activeView.superview bringSubviewToFront:activeView];
        
        NSNotification *n = [NSNotification notificationWithName:CLTextViewActiveViewDidChangeNotification object:view userInfo:nil];
        [[NSNotificationCenter defaultCenter] performSelectorOnMainThread:@selector(postNotification:) withObject:n waitUntilDone:NO];
    }
}

- (id)init
{
    self = [super initWithFrame:CGRectMake(0, 0, 100+kControlSide, 100+kControlSide)];
    if(self){
        self.orignSize = CGSizeZero;
        self.controlLimitSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width, kControlSide+2);
        
        self.bubbleBgImageView = [[UIImageView alloc] initWithFrame:self.frame];
        [self.bubbleBgImageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
        UIImage *bgImage = [[UIImage imageNamed:@"bubble_text_1"] resizableImageWithCapInsets:UIEdgeInsetsMake(32, 14, 14, 8)];
        [self.bubbleBgImageView setImage:bgImage];
        [self addSubview:self.bubbleBgImageView];
        [self sendSubviewToBack:self.bubbleBgImageView];
        
        _label = [[CLTextLabel alloc] init];
        [_label setTextColor:[UIColor blackColor]];
        _label.numberOfLines = 0;
        _label.backgroundColor = [UIColor colorWithRed:0.874 green:0.291 blue:0.291 alpha:0.700];
        _label.layer.borderColor = [[UIColor colorWithRed:0.948 green:0.224 blue:0.816 alpha:1.000] CGColor];
        _label.layer.cornerRadius = 3;
        _label.font = [UIFont systemFontOfSize:MAX_FONT_SIZE];
        _label.minimumScaleFactor = 1/MAX_FONT_SIZE;
        _label.adjustsFontSizeToFitWidth = YES;
        _label.textAlignment = NSTextAlignmentCenter;
        self.text = @"";
        [self addSubview:_label];
        
        CGRect r = [[UIScreen mainScreen] bounds];
        CGSize size = [_label sizeThatFits:CGSizeMake(r.size.width - kControlSide, FLT_MAX)];
        _label.frame = CGRectMake(kControlSide/2, kControlSide/2, size.width, size.height);
        self.orignSize = size;
        self.frame = CGRectMake(0, 0, size.width + kControlSide, size.height + kControlSide);
        
        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteButton setImage:[UIImage imageNamed:@"btn_delete"] forState:UIControlStateNormal];
        _deleteButton.frame = CGRectMake(0, 0, kControlSide, kControlSide);
        _deleteButton.center = _label.frame.origin;
        [_deleteButton addTarget:self action:@selector(pushedDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_deleteButton];
        
        _editeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editeButton setTitle:@"✏️" forState:UIControlStateNormal];
        [_editeButton setFrame:CGRectMake(0, 0, kControlSide, kControlSide)];
        _editeButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
        [_editeButton setCenter:CGPointMake(_label.right, _label.frame.origin.y)];
        [_editeButton addTarget:self action:@selector(responseToEditeButton:) forControlEvents:UIControlEventTouchUpInside];
        [_editeButton.layer setBorderWidth:1];
        [_editeButton.layer setCornerRadius:kControlSide/2];
        [_editeButton.layer setMasksToBounds:YES];
        [_editeButton.layer setBorderColor:[UIColor blackColor].CGColor];
        [self addSubview:_editeButton];
        
        _circleView = [[CLCircleView alloc] initWithFrame:CGRectMake(0, 0, kControlSide, kControlSide)];
        _circleView.center = CGPointMake(_label.width + _label.left, _label.height + _label.top);
        _circleView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        _circleView.radius = 0.7;
        _circleView.color = [UIColor whiteColor];
        _circleView.borderColor = [UIColor blackColor];
        _circleView.borderWidth = 3;
        [self addSubview:_circleView];
        
        _arg = 0;
        [self setScale:1];
        
        [self initGestures];
    }
    
    return self;
}

- (void)initGestures
{
    _label.userInteractionEnabled = YES;
    [_label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidTap:)]];
    [_label addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewDidPan:)]];
    [_circleView addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(circleViewDidPan:)]];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    UIView* view= [super hitTest:point withEvent:event];
    if(view==self){
        return nil;
    }
    return view;
}

#pragma mark- Properties

- (void)setAvtive:(BOOL)active
{
    _deleteButton.hidden = !active;
    _editeButton.hidden = !active;
    _circleView.hidden = !active;
    _label.layer.borderWidth = (active) ? 1/_scale : 0;
}

- (BOOL)active
{
    return !_deleteButton.hidden;
}

- (void)sizeToFitWithMaxWidth:(CGFloat)width lineHeight:(CGFloat)lineHeight
{
    self.transform = CGAffineTransformIdentity;
    _label.transform = CGAffineTransformIdentity;
    
    CGSize size = [_label sizeThatFits:CGSizeMake(width / (MIN_FONT_SIZE/MAX_FONT_SIZE), FLT_MAX)];
    _label.frame = CGRectMake(kControlSide/2, kControlSide/2, size.width, size.height);
    
    CGFloat viewW = (_label.width + kControlSide);
    CGFloat viewH = _label.font.lineHeight;
    
    CGFloat ratio = MIN(width / viewW, lineHeight / viewH);
    
    [self setScale:ratio];
}

- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    
    self.transform = CGAffineTransformIdentity;
    
    _label.transform = CGAffineTransformMakeScale(_scale, _scale);
    
    CGRect rct = self.frame;
    rct.origin.x += (rct.size.width - (_label.width + kControlSide)) / 2;
    rct.origin.y += (rct.size.height - (_label.height + kControlSide)) / 2;
    rct.size.width  = _label.width + kControlSide;
    rct.size.height = _label.height + kControlSide;
    self.frame = rct;
    
    _label.center = CGPointMake(rct.size.width/2, rct.size.height/2);
    
    self.transform = CGAffineTransformMakeRotation(_arg);
    
    _label.layer.borderWidth = 1/_scale;
    _label.layer.cornerRadius = 3/_scale;
}

- (void)setFillColor:(UIColor *)fillColor
{
    _label.textColor = fillColor;
}

- (UIColor*)fillColor
{
    return _label.textColor;
}

- (void)setBorderColor:(UIColor *)borderColor
{
    _label.outlineColor = borderColor;
}

- (UIColor*)borderColor
{
    return _label.outlineColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth
{
    _label.outlineWidth = borderWidth;
}

- (CGFloat)borderWidth
{
    return _label.outlineWidth;
}

- (void)setFont:(UIFont *)font
{
    _label.font = [font fontWithSize:MAX_FONT_SIZE];
}

- (UIFont*)font
{
    return _label.font;
}

- (void)setTextAlignment:(NSTextAlignment)textAlignment
{
    _label.textAlignment = textAlignment;
}

- (NSTextAlignment)textAlignment
{
    return _label.textAlignment;
}

- (void)setText:(NSString *)text
{
    if(![text isEqualToString:_text]){
        _text = text;
        _label.text = (_text.length>0) ? _text : defaultTextString;
    }
}

#pragma mark- gesture events

- (void)pushedDeleteBtn:(id)sender
{
    BaseFlowTextBubbleView *nextTarget = nil;
    
    const NSInteger index = [self.superview.subviews indexOfObject:self];
    
    for(NSInteger i=index+1; i<self.superview.subviews.count; ++i){
        UIView *view = [self.superview.subviews objectAtIndex:i];
        if([view isKindOfClass:[BaseFlowTextBubbleView class]]){
            nextTarget = (BaseFlowTextBubbleView*)view;
            break;
        }
    }
    
    if(nextTarget==nil){
        for(NSInteger i=index-1; i>=0; --i){
            UIView *view = [self.superview.subviews objectAtIndex:i];
            if([view isKindOfClass:[BaseFlowTextBubbleView class]]){
                nextTarget = (BaseFlowTextBubbleView*)view;
                break;
            }
        }
    }
    
    [[self class] setActiveTextView:nextTarget];
    [self removeFromSuperview];
}

- (void)responseToEditeButton:(UIButton *)button
{
    //response edite Button
}

- (void)viewDidTap:(UITapGestureRecognizer*)sender
{
    if(self.active){
        NSNotification *n = [NSNotification notificationWithName:CLTextViewActiveViewDidTapNotification object:self userInfo:nil];
        [[NSNotificationCenter defaultCenter] performSelectorOnMainThread:@selector(postNotification:) withObject:n waitUntilDone:NO];
    }
    [[self class] setActiveTextView:self];
}

- (void)viewDidPan:(UIPanGestureRecognizer*)sender
{
    [[self class] setActiveTextView:self];
    
    CGPoint p = [sender translationInView:self.superview];
    
    if(sender.state == UIGestureRecognizerStateBegan){
        _initialPoint = self.center;
    }
    self.center = CGPointMake(_initialPoint.x + p.x, _initialPoint.y + p.y);
}

- (void)circleViewDidPan:(UIPanGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateCancelled ||
        sender.state == UIGestureRecognizerStateEnded ||
        sender.state == UIGestureRecognizerStateFailed ||
        sender.state == UIGestureRecognizerStatePossible) {
        return;
    }
    
    CGPoint pSuper = [sender translationInView:self.superview];
    
    static CGFloat tmpR = 1;
    static CGFloat tmpA = 0;
    if(sender.state == UIGestureRecognizerStateBegan){
        _initialPoint = [self.superview convertPoint:_circleView.center fromView:_circleView.superview];
        CGPoint p = CGPointMake(_initialPoint.x - self.center.x, _initialPoint.y - self.center.y);
        tmpR = sqrt(p.x*p.x + p.y*p.y);
        tmpA = atan2(p.y, p.x);
        
        _initialArg = _arg;
        _initialScale = _scale;
    }
    
    if (sender.state == UIGestureRecognizerStateChanged) {
        pSuper = CGPointMake(_initialPoint.x + pSuper.x - self.center.x, _initialPoint.y + pSuper.y - self.center.y);
        CGFloat R = sqrt(pSuper.x*pSuper.x + pSuper.y*pSuper.y);
        CGFloat arg = atan2(pSuper.y, pSuper.x);
        
        _arg   = _initialArg + arg - tmpA;
        CGFloat maxLimitScale = MIN(_initialScale * R / tmpR, self.controlLimitSize.width / self.orignSize.width);
        CGFloat minLimitScale = MAX(maxLimitScale, self.controlLimitSize.height / self.orignSize.height);
        [self setScale:minLimitScale];
    }
}

@end
