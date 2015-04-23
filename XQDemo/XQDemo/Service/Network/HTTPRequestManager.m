//
//  HTTPRequestManager.m
//  test
//
//  Created by XiangqiTu on 14-9-11.
//
//

#import "HTTPRequestManager.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "CommonFunc.h"
#import "JSONSerializeManager.h"

#define base64Key @"1234567890"

@interface HTTPRequestManager ()

@property (nonatomic, strong) NSDictionary  *errorCodeDic;

@end

@implementation HTTPRequestManager


#if 0
-99999;//未知异常
-1; //通用错误
9000001;  //数据库错误
9000000;//成功
9000002;//客户端错误
9000003; //被封用户
9000004;//参数错误
9000005;//关注失败
9000006;//取消关注失败
9000007;//已经存在赞了
9000008;//赞 错误
9000009;//发私信错误

#endif
- (id)init
{
    if (self = [super init]) {
        self.errorCodeDic = @{@"-102": @"网络不可用或服务器异常",
                              @"-99999": @"未知异常",
                              @"-1": @"通用错误",
                              @"9000001": @"数据库错误",
                              @"9000000": @"成功",
                              @"9000002": @"客户端错误",
                              @"9000003": @"被封用户",
                              @"9000004": @"参数错误",
                              @"9000005": @"关注失败",
                              @"9000006": @"取消关注失败",
                              @"9000007": @"已经存在赞了",
                              @"9000008": @"赞 错误",
                              @"9000009": @"发私信错误"};
    }
    
    return self;
}

- (NSString *)getErrorCodeMeaningWithCodeNum:(NSString *)codeNum
{
    return [self.errorCodeDic objectForKey:codeNum];
}


-(void)requestWithParameters:(NSDictionary *)parameterDic
            handleIdentifier:(NSString *)handleIdentifier
                     success:(void (^)(NSDictionary *result))successBlock
                    failture:(void (^)(NSString *code))failtureBlock
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *urlStr = [kNetworkDomain stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *sid = __BASE64(handleIdentifier, base64Key);
    
    NSString *parameterJson = [JSONSerializeManager writeWithObject:parameterDic];
    NSString *data = __BASE64(parameterJson, base64Key);
    
    NSDictionary *postParameter = @{@"sid": sid, @"data": data};
    
    NSMutableURLRequest *request = [manager.requestSerializer requestWithMethod:@"POST"
                                                                      URLString:urlStr
                                                                     parameters:postParameter
                                                                          error:nil];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    operation.responseSerializer = manager.responseSerializer;
    operation.shouldUseCredentialStorage = manager.shouldUseCredentialStorage;
    operation.credential = manager.credential;
    operation.securityPolicy = manager.securityPolicy;
    
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            NSString *code = [[responseObject objectForKey:@"code"] description];
            if ([code isEqualToString:@"9000000"]) {
                successBlock(responseObject);
            } else {
                if (code && [code length]) {
                    failtureBlock(code);
                } else {
                    failtureBlock(@"-99999");
                }
            }
        } else {
            failtureBlock(@"-99999");
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failtureBlock(@"-102");
    }];
    
    [manager.operationQueue addOperation:operation];
}


@end
