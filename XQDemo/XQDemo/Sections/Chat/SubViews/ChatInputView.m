//
//  ChatInputView.m
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import "ChatInputView.h"
#define  ChatTextViewFont       12


@implementation ChatInputView

- (id)initWithFrame:(CGRect)frame
           delegate:(NSObject<HPGrowingTextViewDelegate> *) delegate
{
    self = [super initWithFrame:frame];
    if(self) {
        [self setup];
        self.textView.delegate = delegate;
    }
    return self;
}

- (BOOL)resignFirstResponder
{
    [self.textView resignFirstResponder];
    return [super resignFirstResponder];
}

#pragma mark - Setup
- (void)setup
{
    self.backgroundColor = [UIColor chatInputViewBackgroundColor];
    self.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin);
    self.opaque = YES;
    self.userInteractionEnabled = YES;
    [self setupTextView];
}

- (void)setupTextView
{
    UIImageView *inputFieldBack = [[UIImageView alloc] initWithFrame:CGRectMake(40, 7.0f, 234, 29)];
    inputFieldBack.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    inputFieldBack.backgroundColor = [UIColor clearColor];
    UIImage *inputBgImage = [[UIImage imageNamed:@"chat_input_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 20, 14, 20)];
    [inputFieldBack setImage:inputBgImage];
    [self addSubview:inputFieldBack];
    [self sendSubviewToBack:inputFieldBack];
    
    self.textView = [[ChatTextView alloc] initWithFrame:CGRectMake(40, 8.0f, 234, 28)];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    [self.textView setContentInset:UIEdgeInsetsMake(-1, 0, 0, 0.0f)];
    self.textView.backgroundColor = [UIColor clearColor];
    self.textView.internalTextView.scrollIndicatorInsets = UIEdgeInsetsMake(8.0f, 0.0f, 6.0f, 4.0f);
    self.textView.internalTextView.scrollEnabled = YES;
    self.textView.internalTextView.scrollsToTop = NO;
    self.textView.userInteractionEnabled = YES;
    self.textView.font = [UIFont systemFontOfSize:ChatTextViewFont];
    self.textView.textColor = [UIColor blackColor];
    self.textView.internalTextView.keyboardAppearance = UIKeyboardAppearanceDefault;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    self.textView.returnKeyType = UIReturnKeyDefault;
    self.textView.internalTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    self.textView.enablesReturnKeyAutomatically = YES;
    self.textView.placeholder = @"说点什么吧...";
    [self addSubview:self.textView];
    
    self.emojiButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 4, 35, 35)];
    [self.emojiButton setBackgroundImage:[UIImage imageNamed:@"chat_emoji"] forState:UIControlStateNormal];
    [self.emojiButton setBackgroundImage:[UIImage imageNamed:@"chat_emojiX"] forState:UIControlStateHighlighted];
    [self addSubview:self.emojiButton];
}

#pragma mark - Show Control
- (void)showTextView
{
    CGRect r = self.frame;
    r.origin.y = r.origin.y - self.diff;
    r.size.height = r.size.height + self.diff;
    self.frame = r;
    
    [self.textView setHidden:NO];
    [self.textView becomeFirstResponder];
}

#pragma mark - Message input view

+ (CGFloat)textViewLineHeight
{
    return 2.0*ChatTextViewFont; // for fontSize 16.0f
}

+ (CGFloat)maxLines
{
    return 3;
}

@end
