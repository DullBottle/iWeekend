//
//  LoanSearchItem.m
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanSearchItem.h"

@interface LoanSearchItem ()

@property (nonatomic, assign) NSUInteger loanLimitMoneyBegin;
@property (nonatomic, assign) NSUInteger loanLimitMoneyEnd;
@property (nonatomic, copy) NSString *goodsFeatures;

@end

@implementation LoanSearchItem

- (LoanType)feature
{
    //    if ([self.goodsFeatures isEqualToString:@"放款快"]) {
    //        return LoanTypeLendingFast;
    //    } else if ([self.goodsFeatures isEqualToString:@"通过高"]) {
    //        return LoanTypeHighPassRate;
    //    } else if ([self.goodsFeatures isEqualToString:@"额度高"]) {
    //        return LoanTypeQuotaHigh;
    //    }
    return LoanTypeQuotaHigh;
}

- (NSString *)limit
{
    return [NSString stringWithFormat:@"额度：%li元-%li元", self.loanLimitMoneyBegin, self.loanLimitMoneyEnd];
}

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic
{
    NSDictionary *goodsInfo = dic[@"goods"];
    if (!goodsInfo) { return NO; }
    
    NSArray *mediaPools = goodsInfo[@"mediaPools"];
    NSDictionary *mediaPool = mediaPools.firstObject;
    _mediaUrl = mediaPool[@"mediaUrl"];
    
    return YES;
}

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"itemId" : @"goods.id",
              @"name" : @"goods.txtName",
              @"title" : @"goods.txtTitle",
              @"loanLimitMoneyBegin": @"goods.loanLimitMoneyBegin",
              @"loanLimitMoneyEnd": @"goods.loanLimitMoneyEnd",
              @"goodsFeatures": @"goods.goodsFeatures",
              @"vistorUrl": @"goods.vistorUrl" };
}

@end

