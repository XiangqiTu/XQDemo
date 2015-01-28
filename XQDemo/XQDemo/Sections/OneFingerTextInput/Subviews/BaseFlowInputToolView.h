//
//  BaseFlowInputToolView.h
//  test
//
//  Created by XiangqiTu on 14-11-26.
//
//

#import <UIKit/UIKit.h>
#import "HPGrowingTextView.h"

@interface BaseFlowInputToolView : UIView

@property (nonatomic, strong) UIButton      *textButton;
@property (nonatomic, strong) UIButton      *tagsBUtton;

@property (nonatomic, strong) HPGrowingTextView *textView;

@end
