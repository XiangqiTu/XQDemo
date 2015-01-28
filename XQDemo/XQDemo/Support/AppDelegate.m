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
    MenuTableViewController *vc = [[MenuTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self.window setRootViewController:nav];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[ChatMessageCoreDataStorage sharedInstance] saveContext];
}

@end
