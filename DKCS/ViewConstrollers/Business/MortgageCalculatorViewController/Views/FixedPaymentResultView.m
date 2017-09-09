//
//  FixedPaymentResultView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "FixedPaymentResultView.h"

@interface FixedPaymentResultView ()

@end

@implementation FixedPaymentResultView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
    
        // monthlyRepaymentView.
        self.monthlyRepaymentView = [[InputView alloc] initWithFrame:CGRectZero];
        self.monthlyRepaymentView.unit = NO;
        self.monthlyRepaymentView.text = @"月还款额（元）";
        self.monthlyRepaymentView.result = @"0";
        [self addSubview:self.monthlyRepaymentView];
        
        // payInterestSumView.
        self.payInterestSumView = [[InputView alloc] initWithFrame:CGRectZero];
        self.payInterestSumView.unit = NO;
        self.payInterestSumView.text = @"支付利息总额（元）";
        self.payInterestSumView.result = @"0";
        [self addSubview:self.payInterestSumView];
        
        // totalDueAmountView.
        self.totalDueAmountView = [[InputView alloc] initWithFrame:CGRectZero];
        self.totalDueAmountView.unit = NO;
        self.totalDueAmountView.text = @"还款总额（元）";
        self.totalDueAmountView.result = @"0";
        [self addSubview:self.totalDueAmountView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // monthlyRepaymentView.
    [self.monthlyRepaymentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    // payInterestSumView.
    [self.payInterestSumView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.monthlyRepaymentView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    // totalDueAmountView.
    [self.totalDueAmountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.payInterestSumView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
}

@end
