//
//  UIImage+LimitSize.m
//  iPhone iBaby Client
//
//  Created by XiangqiTu on 14-12-18.
//  Copyright (c) 2014年 baiCare. All rights reserved.
//

#import "UIImage+LimitSize.h"

@implementation UIImage(LimitSize)

- (UIImage*)getLimitImage:(CGSize) size;
{
    CGFloat limitX = size.width;
    CGFloat limitY = size.height;
    
    CGFloat width = 0;
    CGFloat height = 0;
    if(size.width==0||size.height==0)
        return self;
    
    if (self.size.width <= limitX || self.size.height <= limitY)
    {
        width =  self.size.width;
        height = self.size.height;
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
        [self drawInRect:CGRectMake(0,
                                    0,
                                    width,
                                    height)];
        UIImage * image= UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    }
    
    float imageScale = self.size.width / self.size.height;
    
    if (imageScale > 1) {
        width = limitX;
        height = width / imageScale;
    } else {
        height = limitY;
        width = height * imageScale;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(width, height));
    [self drawInRect:CGRectMake(0, 0, width, height)];
    UIImage * image= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (NSData *)uploadData
{
    NSData *finalData = UIImageJPEGRepresentation(self, 1);
    if (finalData.length < kLimitUploadImageBytes) {
        return finalData;
    }
    
    finalData = UIImageJPEGRepresentation(self, 0.6);
    if (finalData.length < kLimitUploadImageBytes) {
        return finalData;
    }
    
    finalData = UIImageJPEGRepresentation(self, 0.3);
    if (finalData.length < kLimitUploadImageBytes) {
        return finalData;
    }
    
    
    return UIImageJPEGRepresentation(self, 0.1);
}


+ (CGSize)getImagePubsubSigleSize:(CGSize)imageSize
{
    float scale = 2;//[[UIScreen mainScreen] scale]; 默认以@2x图为单位像素集合
    
    //定义视图最大容器size
    CGFloat maxWidth = 280.0;
    CGFloat maxHeight = 280.0;
    //    UIImage *newImage = [self getLimitImage:CGSizeMake(maxWidth, maxHeight)];
    CGSize s = [UIImage getPresentSizeForContainerLimitSize:CGSizeMake(maxWidth, maxHeight) imageSize:imageSize];
    CGFloat imageFrameWith = s.width / scale;
    CGFloat imageFrameHeight = s.height / scale;
    return CGSizeMake(imageFrameWith, imageFrameHeight);
}

+ (CGSize)getImageViewContainerSizeWithContainerMaxLimitSize:(CGSize)containerMaxLimitSize
                                                   imageSize:(CGSize)imageSize
{
    float scale = 2;//[[UIScreen mainScreen] scale]; 默认以@2x图为单位像素集合
    
    //定义视图最大容器size
    CGFloat maxWidth = containerMaxLimitSize.width;
    CGFloat maxHeight = containerMaxLimitSize.height;
    //    UIImage *newImage = [self getLimitImage:CGSizeMake(maxWidth, maxHeight)];
    CGSize s = [UIImage getPresentSizeForContainerLimitSize:CGSizeMake(maxWidth, maxHeight) imageSize:imageSize];
    CGFloat imageFrameWith = s.width / scale;
    CGFloat imageFrameHeight = s.height / scale;
    return CGSizeMake(imageFrameWith, imageFrameHeight);
}
/**
 *  根据容器size、图片size来获取图片适当缩放后，图片的新size
 *
 *  @param size      容器size大小
 *  @param imageSize 图片size大小
 *
 *  @return 新的图片size大小
 */
+ (CGSize)getPresentSizeForContainerLimitSize:(CGSize)size imageSize:(CGSize)imageSize;
{
    float deviceScale = 2;//[[UIScreen mainScreen] scale]; 默认以@2x图为单位像素集合
    CGFloat limitX = size.width * deviceScale; //设备size * 像素单位集合scale
    CGFloat limitY = size.height * deviceScale;
    
    CGFloat width = 0;
    CGFloat height = 0;
    
    if(size.width==0||size.height==0) //无最大限制
        return CGSizeMake(imageSize.width, imageSize.height);
    
    if (imageSize.width <= limitX || imageSize.height <= limitY)
    {
        width =  imageSize.width;
        height = imageSize.height;
        return CGSizeMake(imageSize.width, imageSize.height);
    }
    
    float imageScale = imageSize.width / imageSize.height;
    
    //宽图
    if (imageScale > 1) {
        width = limitX;
        height = width / imageScale;
    } else {
        height = limitY;
        width = height * imageScale;
    }
    
    return CGSizeMake(width ,height);
}
@end
