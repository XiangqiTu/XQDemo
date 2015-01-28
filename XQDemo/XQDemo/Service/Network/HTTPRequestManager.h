//
//  HTTPRequestManager.h
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import <Foundation/Foundation.h>

@interface HTTPRequestManager : NSObject

- (NSString *)getErrorCodeMeaningWithCodeNum:(NSString *)codeNum;

-(void)requestWithParameters:(NSDictionary *)parameterDic
            handleIdentifier:(NSString *)handleIdentifier
                     success:(void (^)(NSDictionary *result))successBlock
                    failture:(void (^)(NSString *code))failtureBlock;

@end
