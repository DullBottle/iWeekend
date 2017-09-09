//
//  SearchViewModel.m
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SearchViewModel.h"
#import "LoanService.h"

@implementation SearchViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
     
        @weakify(self);
        //
        // Input.
        //
        self.typeId = nil;
        self.amountId = nil;
        self.limitId = nil;
        
        self.didQueryTypes = [self.queryLoanTypes flattenMap:^__kindof RACSignal * _Nullable(NSNumber *value) {
            return [provider.loanService loanTypeItems:1];
        }];
        
        self.didQueryAmounts = [self.queryLoanAmounts flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return [provider.loanService loanTypeItems:2];
        }];
        
        self.didQueryLimits = [self.queryLoanLimits flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return [provider.loanService loanTypeItems:3];
        }];
        
        self.didRefresh = [self.refresh flattenMap:^__kindof RACSignal * _Nullable(id _Nullable x) {
            @strongify(self);
            return [provider.loanService searchLoans:self.typeId amount:self.amountId limit:self.limitId];
        }];
        
        self.didPresentDetailScreen = [self.presentDetailScreen map:^__kindof RACSignal * _Nullable(id  _Nullable value) {
            return value;
        }];
        
        //
        // Output.
        //
        _types = @[];
        _amounts = @[];
        _limits = @[];
        
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

- (RACSubject *)presentDetailScreen
{
    if (!_presentDetailScreen) {
        _presentDetailScreen = [RACSubject subject];
    }
    return _presentDetailScreen;
}

- (RACSubject *)queryLoanTypes
{
    if (!_queryLoanTypes) {
        _queryLoanTypes = [RACSubject subject];
    }
    return _queryLoanTypes;
}

- (RACSubject *)queryLoanAmounts
{
    if (!_queryLoanAmounts) {
        _queryLoanAmounts = [RACSubject subject];
    }
    return _queryLoanAmounts;
}

- (RACSubject *)queryLoanLimits
{
    if (!_queryLoanLimits) {
        _queryLoanLimits = [RACSubject subject];
    }
    return _queryLoanLimits;
}

@end











