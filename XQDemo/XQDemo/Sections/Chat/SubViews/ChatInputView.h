//
//  ChatInputView.h
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import <UIKit/UIKit.h>
#import "ChatTextView.h"

@interface ChatInputView : UIImageView

@property (nonatomic, strong) ChatTextView  *textView;
@property (nonatomic, strong) UIButton       *emojiButton;

@property (nonatomic) CGFloat   diff;

#pragma mark - Initialization
- (id)initWithFrame:(CGRect)frame
           delegate:(NSObject<HPGrowingTextViewDelegate> *) delegate;

#pragma mark - Message input view
+ (CGFloat)textViewLineHeight;
+ (CGFloat)maxLines;

#pragma mark - show
- (void)showTextView;

@end
