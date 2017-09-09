//
//  UserManager.m
//  DKCS
//
//  Created by __End on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "UserManager.h"

@interface UserManager ()

@property (nonatomic, copy) NSString *mobile;

@end

@implementation UserManager

+ (instancetype)standardManager
{
    static UserManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [UserManager new];
    });
    return instance;
}

- (void)setup
{
    
}

#pragma mark - setter & getter

- (BOOL)isLogin
{
    if (!_login) {
        _login = [[[NSUserDefaults standardUserDefaults] objectForKey:kUserIsLogin] boolValue];
    }
    return _login;
}

- (NSString *)mobile
{
    if (!_mobile) {
        _mobile = [[NSUserDefaults standardUserDefaults] objectForKey:kUserMobile];
    }
    return _mobile;
}

@end














