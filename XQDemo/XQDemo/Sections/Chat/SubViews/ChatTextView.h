//
//  ChatTextView.h
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"

@protocol ChatTextViewDelegate;

@interface ChatTextView : HPGrowingTextView

@property (nonatomic, weak) id <ChatTextViewDelegate> keyboardDelegate;
@property (nonatomic, strong) UIPanGestureRecognizer *dismissivePanGestureRecognizer;

@end

@protocol ChatTextViewDelegate <NSObject>

@optional
- (void)keyboardDidShow;
- (void)keyboardDidScrollToPoint:(CGPoint)pt;
- (void)keyboardWillBeDismissed;
- (void)keyboardWillSnapBackToPoint:(CGPoint)pt;

@end