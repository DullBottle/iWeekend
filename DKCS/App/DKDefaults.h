//
//  DKDefaults.h
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kCommonFont;
extern NSString * const kCommonBoldFont;

extern NSString * const kApplicationUUID;               // UUID.
extern NSString * const kUserIsLogin;                   // 记录用户是否登录.
extern NSString * const kUserMobile;                    // 记录用户手机号码.

@interface DKDefaults : NSObject

+ (void)setup;

@end
