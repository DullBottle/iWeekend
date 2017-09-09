//
//  NetWorkManager+Account.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "NetWorkManager+Account.h"

@implementation NetWorkManager (Account)

- (RACSignal *)getCellPhoneAuthCode:(NSString *)mobile
{
    NSString *path = [self combineURL:AccountCellPhoneAuthCodeURL];
    
    NSDictionary *params = @{ @"mobile": mobile };
    
    return [self.sessionManager rac_GET:path parameters:params];
}

- (RACSignal *)loginWithMobile:(NSString *)mobile authCode:(NSString *)authCode
{
    NSString *path = [self combineURL:LoginURL];
    
    NSString *UUID = [[NSUserDefaults standardUserDefaults] objectForKey:kApplicationUUID];
    
    NSDictionary *params = @{ @"mobile": mobile,
                              @"uuid": UUID,
                              @"veriCode": authCode };
    
    return [self.sessionManager rac_GET:path parameters:params];
}

@end









