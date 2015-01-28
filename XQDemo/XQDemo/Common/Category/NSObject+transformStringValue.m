//
//  NSObject+transformStringValue.m
//  test
//
//  Created by XiangqiTu on 14-9-12.
//
//

#import "NSObject+transformStringValue.h"

@implementation NSObject (transformStringValue)

- (NSString *)transformStringValue
{
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber *)(self) stringValue];
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    }
    
    return nil;
}

@end
