//
//  DKDefaults.m
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "DKDefaults.h"

NSString * const kCommonFont = @"PingFangSC-Regular";
NSString * const kCommonBoldFont = @"PingFangSC-Semibold";

NSString * const kApplicationUUID = @"kApplication_UUID_KEY";
NSString * const kUserIsLogin = @"kUser_isLogin_KEY";
NSString * const kUserMobile = @"kUser_Mobile_KEY";

@implementation DKDefaults

+ (void)setup
{
    
    NSUserDefaults *userManager = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *defaults = @{ kUserIsLogin: @NO };
    [userManager registerDefaults:defaults];
    
    NSString *UUID = [[NSUserDefaults standardUserDefaults] objectForKey:kApplicationUUID];
    if (!UUID) {
        
        // ⚠️ 以下针对 iOS 5 或更早的版本，你得使用 Core Foundation 的 CFUUIDRef.
        // CFUUIDRef uuid = CFUUIDCreate(NULL);
        // UUID = (__bridge_transfer NSString *)CFUUIDCreateString(NULL, uuid);
        // CFRelease(uuid);
        NSString *UUID = [[NSUUID UUID] UUIDString];
        
        [userManager setObject:UUID forKey:kApplicationUUID];
        [userManager synchronize];
    }
}

@end


















