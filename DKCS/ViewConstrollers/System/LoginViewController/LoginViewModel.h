//
//  LoginViewModel.h
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoginViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) RACSubject *presentLoginAuthCodeScreen;

//
// Output.
//
@property (nonatomic, strong) RACSignal *didPresentLoginAuthCodeScreen;

@end
