//
//  LoanService.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanService.h"
#import "NetWorkManager+Loan.h"
#import "Banner.h"
#import "LoanAmountItem.h"
#import "LoanItem.h"
#import "LoanSearchItem.h"
#import "LoanTypeItem.h"
#import "Question.h"
#import "MarqueeItem.h"

@implementation LoanService

- (RACSignal *)homepageData:(NSNumber *)page
{
    RACSignal *signal = [self.provider.networkManager getHomepageDataWithPage:page];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        [[signal catchLocalServerError] subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:x];
                [subscriber sendCompleted];
                return;
            }
            
            // JSON --> Model.
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *bannerList = [NSArray yy_modelArrayWithClass:[Banner class] json:JSON[@"data"][@"bannerList"]];
            NSDictionary *dic = [JSON[@"data"][@"itemVoList"] objectAtIndex:0];
            NSArray *loanAmountList = [NSArray yy_modelArrayWithClass:[LoanAmountItem class] json:dic[@"doubleItemInfo"][@"itemBos"]];
            dic = [JSON[@"data"][@"itemVoList"] objectAtIndex:1];
            NSArray *loanList = [NSArray yy_modelArrayWithClass:[LoanItem class] json:dic[@"doubleItemInfo"][@"itemBos"]];
            
            [subscriber sendNext:RACTuplePack(bannerList, loanAmountList, loanList)];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)marqueeData
{
    RACSignal *signal = [self.provider.networkManager getHomepageMarqueeData];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [[signal catchLocalServerError] subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:x];
                [subscriber sendCompleted];
                return;
            }
            
            // JSON --> Model.
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *marquees = [NSArray yy_modelArrayWithClass:[MarqueeItem class] json:JSON[@"data"][@"alertList"]];
            
            [subscriber sendNext:marquees];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)loanTypeItems:(NSUInteger)type
{
    RACSignal *signal = [self.provider.networkManager getLoanItemsWithType:type];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [[signal catchLocalServerError] subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:x];
                [subscriber sendCompleted];
                return;
            }
            
            // JSON --> Model.
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *items = [NSArray yy_modelArrayWithClass:[LoanTypeItem class] json:JSON[@"data"][@"itemVoList"]];
            
            [subscriber sendNext:items];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)searchLoans:(NSNumber *)type amount:(NSNumber *)amount limit:(NSNumber *)limit
{
    RACSignal *signal = [self.provider.networkManager searchLoanItemsWithType:type amount:amount limit:limit];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [[signal catchLocalServerError] subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:x];
                [subscriber sendCompleted];
                return;
            }
            
            // JSON --> Model.
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *items = [NSArray yy_modelArrayWithClass:[LoanSearchItem class] json:JSON[@"data"][@"itemVoList"]];
            
            [subscriber sendNext:items];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)hotQuestions:(NSNumber *)page
{
    RACSignal *signal = [self.provider.networkManager getHotQuestionsWithPage:page];
    
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [[signal catchLocalServerError] subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:x];
                [subscriber sendCompleted];
                return;
            }
            
            // JSON --> Model.
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *questions = [NSArray yy_modelArrayWithClass:[Question class] json:JSON[@"data"][@"qaVoList"]];
            
            [subscriber sendNext:questions];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

@end




