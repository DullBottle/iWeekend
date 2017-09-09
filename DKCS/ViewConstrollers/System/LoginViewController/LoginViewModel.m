//
//  LoginViewModel.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoginViewModel.h"
#import "LoginAuthCodeViewModel.h"

@implementation LoginViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didPresentLoginAuthCodeScreen = [self.presentLoginAuthCodeScreen map:^id _Nullable(id  _Nullable value) {
            return [[LoginAuthCodeViewModel alloc] initWithProvider:provider];
        }];
        
        //
        // Output.
        //
        
    }
    return self;
}

#pragma mark - setter & getter

- (RACSubject *)presentLoginAuthCodeScreen
{
    if (!_presentLoginAuthCodeScreen) {
        _presentLoginAuthCodeScreen = [RACSubject subject];
    }
    return _presentLoginAuthCodeScreen;
}

@end
