//
//  SettingViewModel.m
//  DKCS
//
//  Created by __End on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SettingViewModel.h"

@implementation SettingViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didPresentDetailScreen = [self.presentDetailScreen map:^id _Nullable(id  _Nullable value) {
            return nil;
        }];
        
        //
        // Output.
        //
        self.data = @[ @"当前版本", @"关于我们" ];
        
    }
    return self;
}

#pragma mark - setter & getter.

- (RACSubject *)presentDetailScreen
{
    if (!_presentDetailScreen) {
        _presentDetailScreen = [RACSubject subject];
    }
    return _presentDetailScreen;
}

@end
