//
//  ReplicatorLayerViewController.h
//  XQDemo
//
//  Created by XiangqiTu on 15-3-19.
//
//

#import <UIKit/UIKit.h>

#define IN
#define OUT
#define CAN_ACCESS
#define CANNOT_ACCESS

//Define
@interface ReplicatorLayerViewController : UIViewController

@property (nonatomic,readonly) int      count;

@end

//Extension
/*
 Extensions (also called class extensions) are a special type of category that requires their methods to be defined in the main implementation block for the associated class, as opposed to an implementation defined in a category. This can be used to override publicly declared property attributes. 
 */

@interface ReplicatorLayerViewController ()

@property (nonatomic, readwrite) int     count; //若extension 又重定义了Count 为readWrite 则又能更改count了

@end

@interface ReplicatorLayerViewController ()

@property (nonatomic, strong) CAReplicatorLayer     *musicLayer;
@property (nonatomic, strong) CAReplicatorLayer     *activityLayer;

@end
