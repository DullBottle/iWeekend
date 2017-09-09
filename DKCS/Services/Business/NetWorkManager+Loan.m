//
//  NetWorkManager+Loan.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "NetWorkManager+Loan.h"

@implementation NetWorkManager (Loan)

- (RACSignal *)getHomepageDataWithPage:(NSNumber *)page
{
    NSString *path = [self combineURL:HomepageDataURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{ @"menuId": @1 }];
    
    if (page) {
        [params setObject:page forKey:@"pageable"];
    }
    
    return [self.sessionManager rac_GET:path parameters:params];
}

- (RACSignal *)getHomepageMarqueeData
{
    NSString *path = [self combineURL:HomepageMarqueeURL];
    
    return [self.sessionManager rac_GET:path parameters:nil];
}

- (RACSignal *)getLoanItemsWithType:(NSUInteger)type
{
    NSString *path = [self combineURL:LoanTypesURL];
    
    NSDictionary *params = @{ @"classType": @(type) };
    
    return [self.sessionManager rac_GET:path parameters:params];
}

- (RACSignal *)searchLoanItemsWithType:(NSNumber *)type amount:(NSNumber *)amount limit:(NSNumber *)limit
{
    NSString *path = [self combineURL:LoanSearchURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    
    if (type) {
        [params setObject:type forKey:@"loanTypeNeedId"];
    }
    
    if (amount) {
        [params setObject:amount forKey:@"loanTypeMoneyId"];
    }
    
    if (limit) {
        [params setObject:limit forKey:@"loanTypeTermId"];
    }
    
    return [self.sessionManager rac_GET:path parameters:params];
}

- (RACSignal *)getHotQuestionsWithPage:(NSNumber *)page
{
    NSString *path = [self combineURL:LoanHotQuestionsURL];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionaryWithDictionary:@{  }];
    
    if (page) {
        [params setObject:page forKey:@"pageable"];
    }
    
    return [self.sessionManager rac_GET:path parameters:params];
}

@end
