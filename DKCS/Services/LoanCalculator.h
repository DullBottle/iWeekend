//
//  MathCalculator.h
//
//  Created by 銀色魔頭號 on 2017/9/10.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <Foundation/Foundation.h>

//
// 等额本息、等额本金等计算公式
//
@interface LoanCalculator : NSObject

@property (nonatomic, assign) CGFloat monthlyPayments;                  // 月还款
@property (nonatomic, assign) CGFloat fixedPaymentGrossInterest;        // 利息总额
@property (nonatomic, assign) CGFloat fixedPaymentTotalAmount;          // 还款总额

@property (nonatomic, assign) CGFloat firstMonthAmount;                 // 首月还款额
@property (nonatomic, assign) CGFloat monthDeclineAmount;               // 逐月递减
@property (nonatomic, assign) CGFloat fixedBasisGrossInterest;          // 利息总额
@property (nonatomic, assign) CGFloat fixedBasisTotalAmount;            // 还款总额

+ (instancetype)shardCalculator;

- (LoanCalculator *)loanTotal:(CGFloat)value;

- (LoanCalculator *)period:(NSUInteger)value;

- (LoanCalculator *)annualRates:(CGFloat)value;

- (void)calculateFixedPaymentMortgage;                      // 计算等额本息

- (void)calculateFixedBasisMortgage;                        // 计算等额本金

@end



