//
//  HomepageViewModel.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HomepageViewModel.h"
#import "LoanService.h"

@implementation HomepageViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super init]) {
        
        //
        // Input.
        //
        self.didRefresh = [self.refresh flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return [provider.loanService homepageData:nil];
        }];
        
        self.didRefreshMarquee = [self.refreshMarquee flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return [provider.loanService marqueeData];
        }];
        
        //
        // Output.
        //
        self.typeIcons = @[ @"工薪贷", @"信用卡贷款", @"手机号贷款", @"芝麻分贷款", @"无工作贷款", @"全部贷款" ];
        self.types = @[ @"工薪贷", @"信用卡贷款", @"手机号贷款", @"芝麻分贷款", @"无工作贷款", @"全部贷款" ];
        
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

- (RACSubject *)refreshMarquee
{
    if (!_refreshMarquee) {
        _refreshMarquee = [RACSubject subject];
    }
    return _refreshMarquee;
}

@end














