//
//  FixedBasisResultView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "FixedBasisResultView.h"

@interface FixedBasisResultView ()

@end

@implementation FixedBasisResultView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // firstMonthRepaymentView.
        self.firstMonthRepaymentView = [[InputView alloc] initWithFrame:CGRectZero];
        self.firstMonthRepaymentView.unit = NO;
        self.firstMonthRepaymentView.text = @"首月还款额（元）";
        self.firstMonthRepaymentView.result = @"0";
        [self addSubview:self.firstMonthRepaymentView];
        
        // monthDeclineView.
        self.monthDeclineView = [[InputView alloc] initWithFrame:CGRectZero];
        self.monthDeclineView.unit = NO;
        self.monthDeclineView.text = @"逐月递减（元）";
        self.monthDeclineView.result = @"0";
        [self addSubview:self.monthDeclineView];
        
        // totalInterestPaidView.
        self.totalInterestPaidView = [[InputView alloc] initWithFrame:CGRectZero];
        self.totalInterestPaidView.unit = NO;
        self.totalInterestPaidView.text = @"支付利息总额（元）";
        self.totalInterestPaidView.result = @"0";
        [self addSubview:self.totalInterestPaidView];
        
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
    // firstMonthRepaymentView.
    [self.firstMonthRepaymentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    // monthDeclineView.
    [self.monthDeclineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.firstMonthRepaymentView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];

    // totalInterestPaidView.
    [self.totalInterestPaidView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.monthDeclineView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
    // totalDueAmountView.
    [self.totalDueAmountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.totalInterestPaidView.mas_bottom).offset(0);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(40);
    }];
    
}

@end
