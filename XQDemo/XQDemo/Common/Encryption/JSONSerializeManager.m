//
//  JSONSerializeManager.m
//  LabaAssignment
//
//  Created by John on 4/4/14.
//  Copyright (c) 2014 com.yiyu.co.Ltd. All rights reserved.
//

#import "JSONSerializeManager.h"

@implementation JSONSerializeManager

+ (NSString *)writeWithObject:(id)obj {
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:obj
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error != nil) {
//        NSLog(@"NSDictionary JSONString error: %@", [error localizedDescription]);
        return nil;
    } else {
        return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
}

+ (id)parserWithJsonString:(NSString *)jsonString {
    NSError* error = nil;
    id object = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding]
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
//    if (error != nil) {
//        NSLog(@"NSString JSONObject error: %@", [error localizedDescription]);
//    }
    return object;
}

@end
