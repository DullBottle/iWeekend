//
//  FeedbackViewModel.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "FeedbackViewModel.h"
#import "SystemService.h"

@implementation FeedbackViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didSubmit = [self.submit flattenMap:^__kindof RACSignal * _Nullable(NSString *content) {
            return [provider.systemService feedback:content];
        }];
        
        //
        // Output.
        //
        
    }
    return self;
}

#pragma mark - setter & getter.

- (RACSubject *)submit
{
    if (!_submit) {
        _submit = [RACSubject subject];
    }
    return _submit;
}

@end
