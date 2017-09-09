//
//  AccountService.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "AccountService.h"
#import "NetWorkManager+Account.h"

@implementation AccountService

- (RACSignal *)cellPhoneAuthCode:(NSString *)mobile
{
    RACSignal *signal = [self.provider.networkManager getCellPhoneAuthCode:mobile];
    
    return [signal catchLocalServerError];
}

- (RACSignal *)loginWithMobile:(NSString *)mobile authCode:(NSString *)authCode
{
    RACSignal *signal = [self.provider.networkManager loginWithMobile:mobile authCode:authCode];
    
    return [signal catchLocalServerError];
}

@end
