//
//  ChatTextCell.m
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#import "ChatTextCell.h"
#import "NSDate+TransformTool.h"
#import "ChatMessageCoreDataStorage.h"

#define kBubbleDefaultHeight       30
#define kBubbleMaxWidth            210

#define kLabelFontSize              14
#define kLabelDefaultWidth          20
#define kLabelDefaultHeight         20

#define kFlagGapX                   8

@interface ChatTextCell ()

@property (nonatomic, weak) IBOutlet    UIImageView     *shetterImageView;

@property (nonatomic, strong) IBOutlet UIActivityIndicatorView   *activityView;
@property (nonatomic, strong) IBOutlet UIButton                  *resendButton;

@property (nonatomic) CGFloat   protraitImageViewX;
@property (nonatomic) CGFloat   shetterImageViewX;
@property (nonatomic) CGFloat   timestampLabelX;
@property (nonatomic) CGFloat   bodyLabelX;
@property (nonatomic) CGFloat   bubbleImageViewX;

@end

@implementation ChatTextCell

- (void)awakeFromNib
{
    // Initialization code
    [super awakeFromNib];
    
    CGRect r = self.frame;
    r.size.width = SCREEN_WIDTH;
    self.frame = r;
    
    [self initResource];
}

- (void)initResource
{
    [self.resendButton addTarget:self action:@selector(responseToResendButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.protraitImageViewX = self.protraitImageView.frame.origin.x;
    self.shetterImageViewX = self.shetterImageView.frame.origin.x;
    self.timestampLabelX = self.timeStampLabel.frame.origin.x;
    
    self.bodyLabelX = self.bodyLabel.frame.origin.x;
    self.bubbleImageViewX = self.bubbleImageView.frame.origin.x;
    
    [self.timeStampLabel setTextColor:[UIColor chatTimeStampLabelColor]];
    [self.timeStampLabel setFont:[UIFont systemFontOfSize:10]];
    [self.bodyLabel setFont:[UIFont systemFontOfSize:kLabelFontSize]];
}

- (void)setCellData:(ChatContentMessageEntity *)entity
{
    self.chatMessageEntity = entity;
    
    NSDate *newDate=[NSDate dateWithTimeIntervalSince1970:[entity.creatTimestamp doubleValue]];
    
    [self.timeStampLabel setText:[newDate compareCurrentTime]];
    [self.bodyLabel setText:entity.body];
    
    switch ([entity.msgStatus intValue]) {
        case E_ChatContentMessageStatus_Sending:
        {
            [self.activityView setHidden:NO];
            [self.activityView startAnimating];
            [self.resendButton setHidden:YES];
            break;
        }
            case E_ChatContentMessageStatus_Sended:
        {
            [self.activityView setHidden:YES];
            [self.resendButton setHidden:YES];
            break;
        }
            case E_ChatContentMessageStatus_Failture:
        {
            [self.activityView setHidden:YES];
            [self.resendButton setHidden:NO];
            break;
        }
        default:
            break;
    }
    
    [self layoutFixedControl];
    [self layoutBodyLabel];
}

- (void)layoutFixedControl
{
    BOOL isComing = ![self.chatMessageEntity.isSendOut boolValue];
    if (!isComing) {
        CGRect r = self.protraitImageView.frame;
        r.origin.x = self.frame.size.width - self.protraitImageViewX - r.size.width;
        self.protraitImageView.frame = r;
        
        r = self.shetterImageView.frame;
        r.origin.x = self.frame.size.width - self.shetterImageViewX - r.size.width;
        self.shetterImageView.frame = r;
        
        r = self.timeStampLabel.frame;
        r.origin.x = self.frame.size.width - self.timestampLabelX - r.size.width;
        self.timeStampLabel.frame = r;
        [self.timeStampLabel setTextAlignment:NSTextAlignmentRight];
    } else {
        CGRect r = self.protraitImageView.frame;
        r.origin.x = self.protraitImageViewX;
        self.protraitImageView.frame = r;
        
        r = self.shetterImageView.frame;
        r.origin.x = self.shetterImageViewX;
        self.shetterImageView.frame = r;
        
        r = self.timeStampLabel.frame;
        r.origin.x = self.timestampLabelX;
        self.timeStampLabel.frame = r;
        [self.timeStampLabel setTextAlignment:NSTextAlignmentLeft];
    }
}

- (void)layoutBodyLabel
{
    BOOL isComing = ![self.chatMessageEntity.isSendOut boolValue];
    CGSize labelSize = [ChatTextCell getBodyMaxHeightWithBodyContent:self.chatMessageEntity.body];
    CGRect r = self.bodyLabel.frame;
    r.size.width = labelSize.width;
    r.size.height = labelSize.height;
    
    CGRect s = self.bubbleImageView.frame;
    s.size.width = labelSize.width + 20;
    s.size.height = labelSize.height + 10;
    
    if (!isComing) {
        r.origin.x = self.frame.size.width - self.bodyLabelX - r.size.width;
        self.bodyLabel.frame = r;
        
        s.origin.x = self.frame.size.width - self.bubbleImageViewX - s.size.width;
        self.bubbleImageView.frame = s;
        UIImage *bubbleOutImage = [[UIImage imageNamed:@"chat_bubble_out"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 18, 14, 18)];
        [self.bubbleImageView setImage:bubbleOutImage];
        
        CGRect flagFrame = self.activityView.frame;
        flagFrame.origin.x = self.bubbleImageView.frame.origin.x - kFlagGapX - flagFrame.size.width;
        flagFrame.origin.y = self.bubbleImageView.frame.origin.y + self.bubbleImageView.frame.size.height - flagFrame.size.height;
        [self.activityView setFrame:flagFrame];
        
        CGRect resendButtonFrame = self.resendButton.frame;
        resendButtonFrame.origin.x = self.bubbleImageView.frame.origin.x - kFlagGapX - resendButtonFrame.size.width;
        resendButtonFrame.origin.y = self.bubbleImageView.frame.origin.y + self.bubbleImageView.frame.size.height - resendButtonFrame.size.height;
        [self.resendButton setFrame:flagFrame];
        
    } else {
        r.origin.x = self.bodyLabelX;
        self.bodyLabel.frame = r;
        
        s.origin.x = self.bubbleImageViewX;
        self.bubbleImageView.frame = s;
        UIImage *bubbleComeImage = [[UIImage imageNamed:@"chat_bubble_come"] resizableImageWithCapInsets:UIEdgeInsetsMake(14, 18, 14, 18)];
        [self.bubbleImageView setImage:bubbleComeImage];
        
        CGRect flagFrame = self.activityView.frame;
        flagFrame.origin.x = self.frame.size.width - self.bubbleImageView.frame.origin.x + kFlagGapX - self.bubbleImageView.frame.size.width;
        flagFrame.origin.y = self.bubbleImageView.frame.origin.y + self.bubbleImageView.frame.size.height - flagFrame.size.height;
        [self.activityView setFrame:flagFrame];
        
        CGRect resendButtonFrame = self.resendButton.frame;
        resendButtonFrame.origin.x = self.frame.size.width - self.bubbleImageView.frame.origin.x + kFlagGapX - self.bubbleImageView.frame.size.width;
        resendButtonFrame.origin.y = self.bubbleImageView.frame.origin.y + self.bubbleImageView.frame.size.height - resendButtonFrame.size.height;
        [self.resendButton setFrame:flagFrame];
    }
}

+ (CGSize)getBodyMaxHeightWithBodyContent:(NSString *)bodyContent
{
    //Body Content
    CGSize bodySize = [ChatTextCell getBodyLabelSizeWithWidth:kBubbleMaxWidth-20
                                                      bodyContent:bodyContent
                                                             font:[UIFont systemFontOfSize:kLabelFontSize]];
    CGFloat width = 0;
    CGFloat height = 0;
    
    if (bodySize.height <= kLabelDefaultHeight) {
        height = kLabelDefaultHeight;
    } else {
        height = bodySize.height;
    }
    
    if (bodySize.width <= kLabelDefaultWidth) {
        width = kLabelDefaultWidth;
    } else {
        width = bodySize.width;
    }
    
    return CGSizeMake(bodySize.width, height);
}

+ (CGSize)getBodyLabelSizeWithWidth:(CGFloat)width bodyContent:(NSString *)bodyContent font:(UIFont *)font
{
    NSString *text = bodyContent;
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:text
                                                                         attributes:@{NSFontAttributeName: font}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGFloat height = ceilf(rect.size.height);
    width = ceilf(rect.size.width);
    return CGSizeMake(width, height);
}


+ (CGFloat)chatTextCellHeightWithData:(ChatContentMessageEntity *)entity
{
    CGSize labelSize = [ChatTextCell getBodyMaxHeightWithBodyContent:entity.body];
    CGFloat diff = labelSize.height - kLabelDefaultHeight;
    return 60+diff;
}

#pragma mark - UIControl
- (void)responseToResendButton:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(ChatTextCell:didTouchResendButton:)]) {
        [self.delegate ChatTextCell:self didTouchResendButton:button];
    }
}

@end
