//
//  AppMacro.h
//  test
//
//  Created by XiangqiTu on 14-9-10.
//
//

#ifndef test_AppMacro_h
#define test_AppMacro_h

#define _Owner_IOS_VERSION         [[[UIDevice currentDevice] systemVersion] floatValue]

#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f \
alpha:(a)]

// device size
#define SCREEN_RECT    [UIScreen mainScreen].bounds
#define SCREEN_WIDTH   [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT  [[UIScreen mainScreen] bounds].size.height

#endif
