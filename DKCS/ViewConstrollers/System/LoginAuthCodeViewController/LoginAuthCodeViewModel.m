//
//  LoginAuthCodeViewModel.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoginAuthCodeViewModel.h"
#import "AccountService.h"

@implementation LoginAuthCodeViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didReceiveAuthCode = [self.getAuthCode flattenMap:^__kindof RACSignal * _Nullable(NSString *mobile) {
            return [provider.accountService cellPhoneAuthCode:mobile];
        }];
        
        self.didLogin = [self.login flattenMap:^__kindof RACSignal * _Nullable(RACTuple *tuple) {
           return [provider.accountService loginWithMobile:tuple.first authCode:tuple.second];
        }];
        
        //
        // Output.
        //
        
    }
    return self;
}

#pragma mark - setter & getter.

- (RACSubject *)login
{
    if (!_login) {
        _login = [RACSubject subject];
    }
    return _login;
}

- (RACSubject *)getAuthCode
{
    if (!_getAuthCode) {
        _getAuthCode = [RACSubject subject];
    }
    return _getAuthCode;
}

@end















