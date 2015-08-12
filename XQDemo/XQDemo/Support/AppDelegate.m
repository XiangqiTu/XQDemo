//
//  AppDelegate.m
//  XQDemo
//
//  Created by XiangqiTu on 15-1-25.
//
//

#import "AppDelegate.h"
#import "MenuTableViewController.h"
#import "ChatMessageCoreDataStorage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:SCREEN_RECT];
    MenuTableViewController *vc = [[MenuTableViewController alloc] initWithStyle:UITableViewStylePlain];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    
    [self templeCode];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[ChatMessageCoreDataStorage sharedInstance] saveContext];
}

- (void)templeCode
{
    NSMutableString *ms = [NSMutableString stringWithFormat:@"好好学习 天天向上"];
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformHiraganaKatakana, NO)) {
        NSLog(@"pinyin: %@", ms);
    }
    if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformToLatin, NO)) {
        NSLog(@"pinyin: %@", ms);
    }
    
    [self method:@"a",@"b",@"c",@"d",@"123",nil];
    
}

- (void)method:(NSString *)value,...
{
    
    //指向变参的指针
    va_list list;
    //使用第一个参数来初使化list指针
    va_start(list, value);
    while (YES)
    {
        //返回可变参数，va_arg第二个参数为可变参数类型，如果有多个可变参数，依次调用可获取各个参数
        NSString *string = va_arg(list, NSString*);
        if (!string) {
            break;
        }
        NSLog(@"%@",string);
    }
    //结束可变参数的获取
    va_end(list);
}

@end
