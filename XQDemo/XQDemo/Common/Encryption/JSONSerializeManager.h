//
//  JSONSerializeManager.h
//  LabaAssignment
//
//  Created by John on 4/4/14.
//  Copyright (c) 2014 com.yiyu.co.Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONSerializeManager : NSObject
/**
 *  序列化对象为Json string
 *
 *  @param obj NSArray or NSDictionary
 *
 *  @return Json string
 */
+ (NSString *)writeWithObject:(id)obj;
/**
 *  解析Json string
 *
 *  @param jsonString 待解析的Json string
 *
 *  @return NSArray or NSDictionary
 */
+ (id)parserWithJsonString:(NSString *)jsonString;

@end
