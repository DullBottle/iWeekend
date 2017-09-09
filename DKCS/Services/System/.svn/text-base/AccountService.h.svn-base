//
//  AccountService.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseService.h"

//
// 账户相关操作
//
@interface AccountService : BaseService

// 获取手机验证码
- (RACSignal *)cellPhoneAuthCode:(NSString *)mobile;

// 登录
- (RACSignal *)loginWithMobile:(NSString *)mobile authCode:(NSString *)authCode;

@end
