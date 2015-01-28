//
//  PictureFlowPresentTemp.h
//  test
//
//  Created by XiangqiTu on 14-10-23.
//
//

#import <Foundation/Foundation.h>

@interface PictureFlowPresentTemp : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSNumber *fee;

+ (PictureFlowPresentTemp *)presentTempWithTitle:(NSString *)title fee:(NSNumber *)fee;

@end
