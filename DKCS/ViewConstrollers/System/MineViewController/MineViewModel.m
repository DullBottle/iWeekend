//
//  MineViewModel.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MineViewModel.h"
#import "LoginViewModel.h"
#import "ConsultingViewModel.h"
#import "FeedbackViewModel.h"
#import "SettingViewModel.h"

@implementation MineViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didPresentDetailScreen = [self.presentDetailScreen map:^id _Nullable(NSString *title) {
            
            if ([title isEqualToString:@"贷款咨询"]) {
                return [[ConsultingViewModel alloc] initWithProvider:provider];
            } else if ([title isEqualToString:@"意见反馈"]) {
                return [[FeedbackViewModel alloc] initWithProvider:provider];
            }
            return [[SettingViewModel alloc] initWithProvider:provider];
        }];
        
        self.didPresentLoginScreen = [self.presentLoginScreen map:^id _Nullable(id  _Nullable value) {
            return [[LoginViewModel alloc] initWithProvider:provider];
        }];
        
        //
        // Output.
        //
        self.informations = @[ @{ @"title": @"贷款咨询", @"icon": @"咨询" },
                               @{ @"title": @"意见反馈", @"icon": @"意见反馈" },
                               @{ @"title": @"设置", @"icon": @"设置" } ];
        
    }
    return self;
}

#pragma makr - setter & getter

- (RACSubject *)presentDetailScreen
{
    if (!_presentDetailScreen) {
        _presentDetailScreen = [RACSubject subject];
    }
    return _presentDetailScreen;
}

- (RACSubject *)presentLoginScreen
{
    if (!_presentLoginScreen) {
        _presentLoginScreen = [RACSubject subject];
    }
    return _presentLoginScreen;
}

@end


















