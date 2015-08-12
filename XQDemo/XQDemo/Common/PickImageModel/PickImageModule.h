//
//  PickImageModule.h
//  XQDemo
//
//  Created by XiangqiTu on 15-6-2.
//
//

#import <Foundation/Foundation.h>
#import "LoadingViewManager.h"

@protocol PickImageModuleDelegate;

@interface PickImageModule : NSObject

@property (nonatomic, strong) LoadingViewManager    *loadingViewManager;

@property (nonatomic, weak) id <PickImageModuleDelegate>delegate;
@property (nonatomic, weak) UIViewController    *registPresentViewController;

#pragma mark - 选择图片
@property (nonatomic) NSInteger     maxAllowSelectedPhotos;

- (void)selectPhotoActionSheetWithTitle:(NSString *)title
                   isMultiSelectPhotoes:(BOOL)isMultiSelectPhotoes
                          canEditeImage:(BOOL)canEditeImage;

//获取某一时间段临时选择的图片对象对应的 imageCacheKey 数组
- (NSArray *)getImagesPickerCacheKeys:(NSString *)key //某一时间段的记录key（timestamp）
                                Count:(NSInteger)count; //取多少个缓存image个数

@end

@protocol PickImageModuleDelegate <NSObject>

@optional
/**
 *  选取照相图片
 *
 *  @param PickImageModule
 *  @param image          选取Image
 *  @param imageCacheKey  对应的SDImageCacheKey
 */
- (void)pickImageModule:(PickImageModule *)module
           didFinishSelectPhoto:(UIImage *)image
                      imageData:(NSData *)imageData
                  imageCacheKey:(NSString *)imageCacheKey; //对应的SDImageCacheKey

/**
 *  选取相册图片，若想获取对应的缓存key，需getImagesPickerCacheKeys:Count:
 *
 *  @param viewController 父类
 *  @param imagesArray    选取images (UIImage Class)
 *  @param imageCacheKey  images对应的缓存keys (timestamp)
 */
- (void)pickImageModule:(PickImageModule *)module
  didFinishSelectPhotos:(NSArray *)imagesArray
    imageCacheDecodeKey:(NSString *)imageCacheDecodeKey;//解密后对应SDImageCacheKey

@end
