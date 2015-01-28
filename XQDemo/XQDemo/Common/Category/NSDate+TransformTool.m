//
//  NSDate+TransformTool.m
//  test
//
//  Created by XiangqiTu on 14-9-12.
//
//

#import "NSDate+TransformTool.h"

@implementation NSDate (TransformTool)

-(NSString *)compareCurrentTime
{
    NSTimeInterval  timeInterval = [self timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    
    if (timeInterval < 60) {
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss aa"];
        result=[dateFormatter stringFromDate:self];
    }
    else if((temp = timeInterval/60) <60){
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss aa"];
        result=[dateFormatter stringFromDate:self];
    }
    
    else if((temp = temp/60) <24){
        
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss aa"];
        result=[dateFormatter stringFromDate:self];
        
    }
    else if((temp = temp/24) <30){
        if (temp==1) {
            result=NSLocalizedString(@"昨天", @"昨天");
        }
        else if(temp<=7)
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEEE"];
            result=[dateFormatter stringFromDate:self];
        }
        else
        {
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"MM-DD"];
            result=[dateFormatter stringFromDate:self];
        }
    }
    else if((temp = temp/30) <12){
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-DD"];
        result=[dateFormatter stringFromDate:self];
    }
    else{
        temp = temp/12;
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM-DD"];
        result=[dateFormatter stringFromDate:self];
    }
    return  result;
}

@end
