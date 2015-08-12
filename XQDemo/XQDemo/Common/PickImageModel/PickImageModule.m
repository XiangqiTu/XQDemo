//
//  PickImageModule.m
//  XQDemo
//
//  Created by XiangqiTu on 15-6-2.
//
//

#import "PickImageModule.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

#import "ELCImagePickerController.h"
#import "UIImage+LimitSize.h"

#define kSDImageCacheStoreImageFormat       @"%@Photo%d"
#define kMaxLimitMultiSelectPhotos          9

#define kImageActionSheetTag    92081

#define Alert(title,msg)  [[[UIAlertView alloc] initWithTitle:title message:msg delegate:self cancelButtonTitle:NSLocalizedString(@"OK", nil) otherButtonTitles:nil, nil] show];

@interface PickImageModule ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,ELCImagePickerControllerDelegate>

@property (nonatomic) BOOL isMultiSelectPhotoes;
@property (nonatomic) BOOL canEditeImage;
@property (nonatomic, strong) NSMutableArray        *deleteTempImageCacheArray;

@end

@implementation PickImageModule

- (id)init
{
    if (self = [super init]) {
        self.loadingViewManager = [[LoadingViewManager alloc] init];
        self.maxAllowSelectedPhotos = kMaxLimitMultiSelectPhotos;
        self.deleteTempImageCacheArray = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark - 选择图片
- (void)selectPhotoActionSheetWithTitle:(NSString *)title
                   isMultiSelectPhotoes:(BOOL)isMultiSelectPhotoes
                          canEditeImage:(BOOL)canEditeImage
{
    self.isMultiSelectPhotoes = isMultiSelectPhotoes;
    self.canEditeImage = canEditeImage;
    
    UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:title
                                                       delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"取消", @"取消")
                                         destructiveButtonTitle:nil
                                              otherButtonTitles:NSLocalizedString(@"拍照", @"拍照"), NSLocalizedString(@"从手机相册选择", @"从手机相册选择"), nil];
    
    sheet.tag = kImageActionSheetTag;
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [sheet showInView:window];
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (actionSheet.tag != kImageActionSheetTag) {
        return;
    }
    
    switch (buttonIndex) {
        case 0:
        {
            [self clickTakePicButton];
            break;
        }
        case 1:
        {
            if (self.isMultiSelectPhotoes) {
                [self clickSelectManyAlumButton];//ELC相册选择
            } else {
                [self clickSelectOnePhotoFromAlum];//默认相册选择
            }
            
            break;
        }
        default:
            break;
    }
}

- (void)clickTakePicButton
{
    
    if ([self validateCamera]) {
        if ([self isCameraAuthorization]) {
            UIImagePickerController* picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = UIImagePickerControllerSourceTypeCamera;
            picker.showsCameraControls = YES;
            picker.allowsEditing = self.canEditeImage;
            [self.registPresentViewController presentViewController:picker animated:YES completion:nil];
        } else {
            Alert(nil, @"该应用相机授权受限，请到设置->隐私->相机中开启");
        }
    } else {
        Alert(nil, @"照相机不可用");
    }
}

// 判断相机是否受限
- (BOOL)isCameraAuthorization{
    NSString *mediaType = AVMediaTypeVideo;
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
    if(authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied){
        return NO;
    } else if (authStatus == AVAuthorizationStatusNotDetermined) {  // 不确定,没什么影响
        [AVCaptureDevice requestAccessForMediaType:mediaType
                                 completionHandler:^(BOOL granted) {
                                     
                                 }];
        return YES;
    }
    else{
        return YES;
    }
}

// 判断硬件是否支持
- (BOOL)validateCamera {
    
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] &&
    [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (void)clickSelectManyAlumButton
{
    ELCImagePickerController *elcPicker = [[ELCImagePickerController alloc] initImagePicker];
    elcPicker.maximumImagesCount = self.maxAllowSelectedPhotos;
    elcPicker.returnsOriginalImage = NO; //Only return the fullScreenImage, not the fullResolutionImage
    elcPicker.imagePickerDelegate = self;
    [self.registPresentViewController presentViewController:elcPicker animated:YES completion:nil];
}

- (void)clickSelectOnePhotoFromAlum
{
    UIImagePickerController* picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.allowsEditing = self.canEditeImage;
    [self.registPresentViewController presentViewController:picker animated:YES completion:nil];
}

#pragma mark - UIImagePicker delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *resourceType = [info objectForKey:UIImagePickerControllerMediaType];
    if (![resourceType isEqualToString:(NSString *)kUTTypeImage]) {
        [picker dismissViewControllerAnimated:YES completion:nil];
        return;
    }
    
    UIImage *editedImage = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!editedImage) {
        editedImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [self.loadingViewManager showHUDWithText:NSLocalizedString(@"请稍后", @"请稍后") inView:window];
    
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        __weak __typeof(self) weakSelf = self;
        [picker dismissViewControllerAnimated:NO completion:^{
            ALAssetsLibrary *assetsLibrary = [[ALAssetsLibrary alloc] init];
            [assetsLibrary writeImageToSavedPhotosAlbum:[editedImage CGImage]
                                            orientation:(ALAssetOrientation)editedImage.imageOrientation
                                        completionBlock:^(NSURL *assetURL, NSError *error) {
                                            if (error != nil) {
                                                [self.loadingViewManager hideHUDAfterDelay:0];
                                                return ;
                                            }
                                            
                                            [assetsLibrary assetForURL:assetURL
                                                           resultBlock:^(ALAsset *asset) {
                                                               ALAssetRepresentation *representation = [asset defaultRepresentation];
                                                               CGImageRef imgRef = [representation fullScreenImage];
                                                               UIImage *image = [UIImage imageWithCGImage:imgRef
                                                                                                    scale:representation.scale
                                                                                              orientation:UIImageOrientationUp];
                                                               image = [image getLimitImage:kLimitUploadImageSize];
                                                               NSData *data = [image uploadData];
                                                               
                                                               //这里去除HUD,也可以在后面
                                                               [self.loadingViewManager hideHUDAfterDelay:0];
                                                               
                                                               PickImageModule *strongSelf = weakSelf;
                                                               if (strongSelf != nil) {
                                                                   if (strongSelf.delegate && [strongSelf.delegate respondsToSelector:@selector(pickImageModule:didFinishSelectPhoto:imageData:imageCacheKey:)]) {
                                                                       
                                                                       NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
                                                                        ;
                                                                       NSString *imageCacheKey = [NSString stringWithFormat:@"%lf",timestamp];
                                                                       [strongSelf imagePickerStoreImages:[NSArray arrayWithObject:image] key:imageCacheKey];
                                                                       [strongSelf.delegate pickImageModule:strongSelf
                                                                                               didFinishSelectPhoto:image
                                                                                                          imageData:data
                                                                                                      imageCacheKey:imageCacheKey];
                                                                   }
                                                               }
                                                               
                                                           }
                                                          failureBlock:^(NSError *error) {
                                                              [self.loadingViewManager hideHUDAfterDelay:0];
                                                          }];
                                            
                                        }];
        }];
    } else {
        [picker dismissViewControllerAnimated:YES completion:^{
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                CGSize s = [[UIScreen mainScreen] bounds].size;
                UIImage *img = [editedImage getLimitImage:s];
                NSData *data = UIImageJPEGRepresentation(img, 0.2);
                dispatch_async(dispatch_get_main_queue(), ^{
                    //这里去除HUD,也可以在后面
                    [self.loadingViewManager hideHUDAfterDelay:0];
                    
                    if (self.delegate && [self.delegate respondsToSelector:@selector(pickImageModule:didFinishSelectPhoto:imageData:imageCacheKey:)]) {
                        NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
                        ;
                        NSString *imageCacheKey = [NSString stringWithFormat:@"%lf",timestamp];
                        [self imagePickerStoreImages:[NSArray arrayWithObject:img] key:imageCacheKey];
                        [self.delegate pickImageModule:self
                                          didFinishSelectPhoto:img
                                                     imageData:data
                                                 imageCacheKey:imageCacheKey];
                    }
                });
            });
        }];
    }
}

/**
 *  将选取好的图片保存起来
 *
 *  @param images 需要保存起来的图片
 *  @param key    保存关键字
 */
- (void)imagePickerStoreImages:(NSArray *)images key:(NSString *)key
{
    /*
    //将图片保存到本地
    SDImageCache *cacheManager = [SDImageCache sharedImageCache];
    NSString *imageCacheKey ;
    if ([images count]>1) { //多图需二次加密存储
        for (int i = 0; i < [images count]; i++) {
            imageCacheKey = [NSString stringWithFormat:kSDImageCacheStoreImageFormat,key,i];
            [cacheManager storeImage:[images objectAtIndex:i] forKey:imageCacheKey toDisk:YES];
            [self.deleteTempImageCacheArray addObject:imageCacheKey];
        }
    } else {
        [cacheManager storeImage:[images lastObject] forKey:key toDisk:YES];
        [self.deleteTempImageCacheArray addObject:key];
    }
    */
}

#pragma mark - ELCImagePickerController delegate
- (NSArray *)getImagesPickerCacheKeys:(NSString *)key Count:(NSInteger)count
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:count];
    if (count > 1) {
        for (int i = 0; i< count; i++) {
            NSString * imageCacheKey = [NSString stringWithFormat:kSDImageCacheStoreImageFormat,key,i];
            [array addObject:imageCacheKey];
        }
    } else {
        NSString *imageCacheKey = key;
        [array addObject:imageCacheKey];
    }
    
    return array;
}

- (void)elcImagePickerController:(ELCImagePickerController *)picker didFinishPickingMediaWithInfo:(NSArray *)info
{
    [self.registPresentViewController dismissViewControllerAnimated:YES completion:nil];
    
    NSMutableArray *imagesArray = [NSMutableArray arrayWithCapacity:[info count]];
    for (NSDictionary *dict in info) {
        UIImage *image = [dict objectForKey:UIImagePickerControllerOriginalImage];//fullScreenImage
        image = [image getLimitImage:kLimitUploadImageSize];
        [imagesArray addObject:image];
    }
    
    //若没有选择图片，退出
    if (![imagesArray count]) {
        return;
    }
    
    NSTimeInterval timestamp = [[NSDate date] timeIntervalSince1970];
    ;
    NSString *imageCacheKey = [NSString stringWithFormat:@"%lf",timestamp];
    [self imagePickerStoreImages:imagesArray key:imageCacheKey];
    if (self.delegate && [self.delegate respondsToSelector:@selector(pickImageModule:didFinishSelectPhotos:imageCacheDecodeKey:)]) {
        [self.delegate pickImageModule:self didFinishSelectPhotos:imagesArray imageCacheDecodeKey:imageCacheKey];
    }
}

- (void)elcImagePickerControllerDidCancel:(ELCImagePickerController *)picker
{
    [self.registPresentViewController dismissViewControllerAnimated:NO completion:nil];
}


@end
