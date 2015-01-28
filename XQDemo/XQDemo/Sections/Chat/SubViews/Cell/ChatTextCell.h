//
//  ChatTextCell.h
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import <UIKit/UIKit.h>
#import "ChatContentMessageEntity.h"

@protocol ChatTextCellDelegate;

@interface ChatTextCell : UITableViewCell

@property (nonatomic, weak) IBOutlet    UIImageView *protraitImageView;
@property (nonatomic, weak) IBOutlet    UILabel *timeStampLabel;
@property (nonatomic, weak) IBOutlet    UIImageView *bubbleImageView;
@property (nonatomic, weak) IBOutlet    UILabel     *bodyLabel;

@property (nonatomic, weak) id<ChatTextCellDelegate>delegate;
@property (nonatomic, strong) ChatContentMessageEntity  *chatMessageEntity;

- (void)setCellData:(ChatContentMessageEntity *)entity;

+ (CGFloat)chatTextCellHeightWithData:(ChatContentMessageEntity *)entity;

@end

@protocol ChatTextCellDelegate <NSObject>

- (void)ChatTextCell:(ChatTextCell *)cell didTouchResendButton:(UIButton *)resendButton;

@end