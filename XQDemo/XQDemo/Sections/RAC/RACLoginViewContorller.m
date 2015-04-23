//
//  RACLoginViewContorller.m
//  XQDemo
//
//  Created by XiangqiTu on 15-3-20.
//
//

#import "RACLoginViewContorller.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACLoginViewContorller ()

@property (nonatomic, weak) IBOutlet UITextField    *accountTextField;
@property (nonatomic, weak) IBOutlet UITextField    *passwordTextField;
@property (nonatomic, weak) IBOutlet UIButton       *loginButton;

@end

@implementation RACLoginViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"RAC Login";
    
    RACSignal *accountInputSignal = [self.accountTextField.rac_textSignal map:^id(id value) {
        return @([self isInputAccountRightWithText:(NSString *)value]);
    }];
    
    RACSignal *passwordInputSignal = [self.passwordTextField.rac_textSignal map:^id(id value) {
        return @([self isInputPasswordRightWithText:(NSString *)value]);
    }];
    
    RAC(self.accountTextField, backgroundColor) =
    [accountInputSignal
     map:^id(NSNumber *isAccountValid) {
         return [isAccountValid boolValue] ? [UIColor clearColor] : [UIColor redColor];
     }];
    
    RAC(self.passwordTextField, backgroundColor) =
    [passwordInputSignal
     map:^id(NSNumber *isPasswordValid) {
         return [isPasswordValid boolValue] ? [UIColor clearColor] : [UIColor redColor];
     }];
    
    RACSignal *signUpActiveSignal =
    [RACSignal combineLatest:@[accountInputSignal, passwordInputSignal]
                      reduce:^id(NSNumber *isAccountValid, NSNumber *isPasswordValid) {
                          return @([isAccountValid boolValue] && [isPasswordValid boolValue]);
                      }];
    
    [signUpActiveSignal subscribeNext:^(NSNumber *signupActive) {
        self.loginButton.enabled = [signupActive boolValue];
    }];
    
    [[[[self.loginButton
        rac_signalForControlEvents:UIControlEventTouchUpInside]
       doNext:^(id x) {
           self.loginButton.enabled = NO;
       }]
      flattenMap:^id(id x) {
          return [self signInSignal];
      }]
     subscribeNext:^(NSNumber *signedIn) {
         self.loginButton.enabled = YES;
         BOOL success = [signedIn boolValue];
         if (success) {
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"success" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
             [alert show];
         }
     }];
}

- (BOOL)isInputAccountRightWithText:(NSString *)text
{
    return [text length] > 3;
}

- (BOOL)isInputPasswordRightWithText:(NSString *)text
{
    return [text length] > 3;
}

- (RACSignal *)signInSignal
{
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@YES];
            [subscriber sendCompleted];
        });
        
        return nil;
    }];
}
@end
