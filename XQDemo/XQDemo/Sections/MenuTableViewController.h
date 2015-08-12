//
//  MenuTableViewController.h
//  XQDemo
//
//  Created by XiangqiTu on 15-1-25.
//
//

#import <UIKit/UIKit.h>

typedef void (*function1)(NSString * str);
typedef void (^block1)(NSString * str);

@interface MenuTableViewController : UITableViewController

@property (nonatomic, weak) id templeSavedObject;

@property (nonatomic, copy) block1  blockTemple;
@property (nonatomic, assign) function1 functionTemple;

@end
