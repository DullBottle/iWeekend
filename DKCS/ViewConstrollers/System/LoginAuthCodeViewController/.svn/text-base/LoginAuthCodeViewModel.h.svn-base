//
//  LoginAuthCodeViewModel.h
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoginAuthCodeViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) RACSubject *getAuthCode;
@property (nonatomic, strong) RACSubject *login;

//
// Output.
//
@property (nonatomic, copy) NSString *mobile;
@property (nonatomic, strong) RACSignal *didReceiveAuthCode;
@property (nonatomic, strong) RACSignal *didLogin;

@end
