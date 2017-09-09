//
//  ConsultingViewModel.m
//  DKCS
//
//  Created by __End on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ConsultingViewModel.h"
#import "SystemService.h"

@implementation ConsultingViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didRefresh = [self.refresh flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return [provider.systemService systemParams];
        }];
        
        //
        // Output.
        //
    }
    return self;
}

#pragma mark - setter & getter.

- (RACSubject *)refresh
{
    if (!_refresh) {
        _refresh = [RACSubject subject];
    }
    return _refresh;
}

@end


