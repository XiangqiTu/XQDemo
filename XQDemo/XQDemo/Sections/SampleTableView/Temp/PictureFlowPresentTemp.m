//
//  PictureFlowPresentTemp.m
//  test
//
//  Created by XiangqiTu on 14-10-23.
//
//

#import "PictureFlowPresentTemp.h"

@implementation PictureFlowPresentTemp

+ (PictureFlowPresentTemp *)presentTempWithTitle:(NSString *)title fee:(NSNumber *)fee
{
    PictureFlowPresentTemp *temp = [[PictureFlowPresentTemp alloc] init];
    temp.title = title;
    temp.fee = fee;
    
    return temp;
}

@end
