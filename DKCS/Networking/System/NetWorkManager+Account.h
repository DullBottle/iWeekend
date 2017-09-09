//
//  NetWorkManager+Account.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "NetWorkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager (Account)

// 获取手机短信验证码
- (RACSignal *)getCellPhoneAuthCode:(NSString *)mobile;

// 登陆
- (RACSignal *)loginWithMobile:(NSString *)mobile authCode:(NSString *)authCode;

@end

NS_ASSUME_NONNULL_END
