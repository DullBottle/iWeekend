//
//  MathCalculator.m
//
//  Created by 銀色魔頭號 on 2017/9/10.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanCalculator.h"

@interface LoanCalculator ()

@property (nonatomic, assign) CGFloat loanTotal;                    // 贷款总额
@property (nonatomic, assign) NSUInteger period;                    // 贷款期限
@property (nonatomic, assign) CGFloat annualRates;                  // 贷款年利率
@property (nonatomic, assign) CGFloat monthlyRates;                 // 月利率
@property (nonatomic, assign) CGFloat houseTotal;                   // 房屋总价
@property (nonatomic, assign) CGFloat area;                         // 房屋面积
@property (nonatomic, assign) CGFloat pricePerMeter;                // 房屋每平米价格
@property (nonatomic, assign) CGFloat downPayments;                 // 贷款首付额度

@property (nonatomic, assign) CGFloat businessTotal;                // 商业贷款总额
@property (nonatomic, assign) CGFloat businessAnnualRates;          // 商业贷款年利率
@property (nonatomic, assign) CGFloat providentFundTotal;           // 公积金贷款总额
@property (nonatomic, assign) CGFloat providentFundAnnualRates;     // 公积金贷款年利率

@end

@implementation LoanCalculator

+ (instancetype)shardCalculator
{
    static LoanCalculator *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LoanCalculator new];
    });
    return instance;
}

#pragma mark - Public methods

- (LoanCalculator *)loanTotal:(CGFloat)value
{
    self.loanTotal = value;
    return self;
}

- (LoanCalculator *)period:(NSUInteger)value
{
    self.period = value;
    return self;
}

- (LoanCalculator *)annualRates:(CGFloat)value
{
    self.annualRates = value;
    self.monthlyRates = value / 12.f;
    return self;
}

- (void)calculateFixedPaymentMortgage
{
    self.monthlyPayments = (self.monthlyRates * pow((self.monthlyRates + 1), self.period)) /
                            (pow((self.monthlyRates + 1), self.period) - 1) * self.loanTotal;
    
    self.fixedPaymentGrossInterest = (self.period * (self.monthlyRates * pow((self.monthlyRates + 1), self.period)) /
                                                     (pow((self.monthlyRates + 1), self.period) - 1) * self.loanTotal) - self.loanTotal;
    
    self.fixedPaymentTotalAmount = self.period * (self.monthlyRates * pow((self.monthlyRates + 1), self.period)) /
                                    (pow((self.monthlyRates + 1), self.period) - 1) * self.loanTotal;
}

- (void)calculateFixedBasisMortgage
{
    self.firstMonthAmount = (self.loanTotal / self.period) + (self.loanTotal * self.monthlyRates);
    
    self.monthDeclineAmount = self.loanTotal / self.period * self.monthlyRates;
    
    self.fixedBasisGrossInterest = self.loanTotal * self.monthlyRates * (self.period + 1) / 2;
    
    self.fixedBasisTotalAmount = self.loanTotal + (self.loanTotal * self.monthlyRates * (self.period + 1)) / 2;
}

@end


