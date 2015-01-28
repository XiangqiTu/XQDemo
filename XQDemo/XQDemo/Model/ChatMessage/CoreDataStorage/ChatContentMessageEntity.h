//
//  ChatContentMessageEntity.h
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ChatContentMessageEntity : NSManagedObject

@property (nonatomic, retain) NSString * creatTimestamp;
@property (nonatomic, retain) NSString * body;
@property (nonatomic, retain) NSString * msgId;
@property (nonatomic, retain) NSString * from;
@property (nonatomic, retain) NSString * to;
@property (nonatomic, retain) NSString * clientId;
@property (nonatomic, retain) NSNumber * isRead;
@property (nonatomic, retain) NSNumber * msgStatus;
@property (nonatomic, retain) NSNumber * msgType;
@property (nonatomic, retain) NSNumber * isSendOut;
@property (nonatomic, retain) NSString * friendId;

@end
