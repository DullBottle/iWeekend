//
//  MortgageInputView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MortgageInputView.h"

@interface MortgageInputView ()

@property (nonatomic, strong) UIView *lineOne;
@property (nonatomic, strong) UIView *lineTwo;

@end

@implementation MortgageInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // loanSumInputView.
        self.loanSumInputView = [[InputView alloc] initWithFrame:CGRectZero];
        self.loanSumInputView.unit = YES;
        self.loanSumInputView.text = @"贷款总额";
        self.loanSumInputView.placeholder = @"请输入贷款总额";
        self.loanSumInputView.unitText = @"万元";
        [self addSubview:self.loanSumInputView];
        
        // lineOne.
        self.lineOne = [[UIView alloc] initWithFrame:CGRectZero];
        self.lineOne.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self addSubview:self.lineOne];
    
        // loanPeriodInputView.
        self.loanPeriodInputView = [[InputPickerView alloc] initWithFrame:CGRectZero];
        self.loanPeriodInputView.text = @"贷款期限";
        self.loanPeriodInputView.placeholder = @"请选择贷款年限";
        [self addSubview:self.loanPeriodInputView];
        
        // lineTwo.
        self.lineTwo = [[UIView alloc] initWithFrame:CGRectZero];
        self.lineTwo.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self addSubview:self.lineTwo];
        
        // loanAnnualRateInputView.
        self.loanAnnualRateInputView = [[InputView alloc] initWithFrame:CGRectZero];
        self.loanAnnualRateInputView.unit = NO;
        self.loanAnnualRateInputView.text = @"贷款年利率";
        self.loanAnnualRateInputView.placeholder = @"请输入贷款年利率";
        [self addSubview:self.loanAnnualRateInputView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // loanSumInputView.
    [self.loanSumInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    // lineOne.
    [self.lineOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.loanSumInputView.mas_bottom).offset(0);
        make.height.mas_equalTo(0.7);
    }];
    
    // loanPeriodInputView.
    [self.loanPeriodInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.lineOne.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];
    
    // lineTwo.
    [self.lineTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.loanPeriodInputView.mas_bottom).offset(0);
        make.height.mas_equalTo(0.7);
    }];
    
    // loanAnnualRateInputView.
    [self.loanAnnualRateInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.lineTwo.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];

}

@end


















