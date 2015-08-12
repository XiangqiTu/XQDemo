//
//  UIImage+LimitSize.h
//  iPhone iBaby Client
//
//  Created by XiangqiTu on 14-12-18.
//  Copyright (c) 2014年 baiCare. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kLimitUploadImageSize     CGSizeMake(540,960)
#define kLimitUploadImageBytes    (1024*100) //100KB

@interface UIImage (LimitSize)

//size 为分辨率大小，不是单位frame
- (UIImage*)getLimitImage:(CGSize) size;

- (NSData *)uploadData;



/**
 *  获取imageView Frame
 *
 *  @param imageSize 图片实际大小
 *
 *  @return imageView frame大小
 */
+ (CGSize)getImagePubsubSigleSize:(CGSize)imageSize;

//此方法为 getImagePubsubSigleSize 升级版
+ (CGSize)getImageViewContainerSizeWithContainerMaxLimitSize:(CGSize)containerMaxLimitSize
                                                   imageSize:(CGSize)imageSize;
@end
