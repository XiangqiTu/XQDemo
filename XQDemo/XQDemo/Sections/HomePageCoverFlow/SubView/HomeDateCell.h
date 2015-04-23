//
//  HomeDateCell.h
//  XQDemo
//
//  Created by XiangqiTu on 15-4-14.
//
//

#import <UIKit/UIKit.h>

@interface HomeDateCell : UIView

@property (nonatomic, weak) IBOutlet    UIImageView     *bgImageView;
@property (nonatomic, weak) IBOutlet    UILabel         *weekdayLabel;
@property (nonatomic, weak) IBOutlet    UILabel         *dayLabel;

@property (nonatomic, weak) IBOutlet    UIImageView *lineImageView;
@property (nonatomic, weak) IBOutlet    UILabel *weekLabel;


@property (nonatomic) BOOL  isSelected;

@end
