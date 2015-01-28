//
//  BaseFlowInputToolView.m
//  test
//
//  Created by XiangqiTu on 14-11-26.
//
//

#import "BaseFlowInputToolView.h"
#import "UIView+Frame.h"

#define kButtonWidth    40
#define kWidthGap       10
#define kHeightGap      2

@interface BaseFlowInputToolView ()


@end

@implementation BaseFlowInputToolView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    
    return self;
}

- (void)initSubViews
{
    self.textButton = [[UIButton alloc] initWithFrame:CGRectMake(kWidthGap, kHeightGap, kButtonWidth, kButtonWidth)];
    [self.textButton setBackgroundColor:[UIColor redColor]];
    [self.textButton setTitle:@"T" forState:UIControlStateNormal];
    [self addSubview:self.textButton];
    
    CGRect r = [[UIScreen mainScreen] bounds];
    self.tagsBUtton = [[UIButton alloc] initWithFrame:CGRectMake(r.size.width-kWidthGap-kButtonWidth, kHeightGap, kButtonWidth, kButtonWidth)];
    [self.tagsBUtton setBackgroundColor:[UIColor redColor]];
    [self.tagsBUtton setTitle:@"Tags" forState:UIControlStateNormal];
    [self addSubview:self.tagsBUtton];
    
    self.textView = [[HPGrowingTextView alloc] initWithFrame:CGRectMake(2*kWidthGap+kButtonWidth, kHeightGap, self.tagsBUtton.left - 3*kWidthGap-kButtonWidth, kButtonWidth)];
    [self.textView setIsScrollable:YES];
    self.textView.contentInset = UIEdgeInsetsMake(0, 5, 0, 5);
    
    self.textView.minHeight = kButtonWidth;
    self.textView.maxNumberOfLines = 3;
    // you can also set the maximum height in points with maxHeight
    // textView.maxHeight = 200.0f;
    self.textView.returnKeyType = UIReturnKeyGo; //just as an example
    self.textView.font = [UIFont systemFontOfSize:14.0f];
    self.textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(5, 0, 5, 0);
    self.textView.backgroundColor = [UIColor greenColor];
    self.textView.placeholder = @"Type to see the textView grow!";
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    [self addSubview:self.textView];
}

@end
