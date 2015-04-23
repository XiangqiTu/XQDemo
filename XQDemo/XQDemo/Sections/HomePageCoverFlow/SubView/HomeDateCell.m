//
//  HomeDateCell.m
//  XQDemo
//
//  Created by XiangqiTu on 15-4-14.
//
//

#import "HomeDateCell.h"

@interface HomeDateCell ()

@property (nonatomic, strong) NSCalendar    *calendar;

@end

@implementation HomeDateCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    [self becomeNormalState];
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    if (_isSelected) {
        [self becomeSelectedState];
    } else {
        [self becomeNormalState];
    }
    
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    NSString *str = [NSString stringWithFormat:@"%lf",timestamp];
    [self.weekdayLabel setText:[self weekdayFromTimestamp:str]];
}

- (void)becomeNormalState
{
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.lineImageView setHidden:YES];
    [self.weekLabel setHidden:YES];
}

- (void)becomeSelectedState
{
    [self setBackgroundColor:[UIColor redColor]];
    [self.lineImageView setHidden:NO];
    [self.weekLabel setHidden:NO];
}

#pragma mark - Date Caculate

- (NSString *)weekdayFromTimestamp:(NSString *)timestamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timestamp doubleValue]];
    NSDateComponents *comps = [self.calendar components:NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit | NSWeekdayCalendarUnit fromDate:date];
    
    switch (comps.weekday) {
        case 1:
        {
            if (self.isSelected) {
                return @"周一";
            } else {
                return @"一" ;
            }
        }
        case 2:
        {
            if (self.isSelected) {
                return @"周二";
            } else {
                return @"二" ;
            }
        }
        case 3:
        {
            if (self.isSelected) {
                return @"周三";
            } else {
                return @"三" ;
            }
        }
        case 4:
        {
            if (self.isSelected) {
                return @"周四";
            } else {
                return @"四";
            }
        }
        case 5:
        {
            if (self.isSelected) {
                return @"周五";
            } else {
                return @"五";
            }
        }
        case 6:
        {
            if (self.isSelected) {
                return @"周六";
            } else {
                return @"六";
            }
        }
        case 7:
        {
            if (self.isSelected) {
                return @"周日";
            } else {
                return @"日";
            }
        }
        default:
            break;
    }
    
    return @"未知";
}
@end
