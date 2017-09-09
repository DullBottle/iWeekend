//
//  CombinationInputView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "CombinationInputView.h"
#import "ShadowRootView.h"

@interface CombinationInputView ()

@property (nonatomic, strong) ShadowRootView *loanPeriodRootView;
@property (nonatomic, strong) ShadowRootView *businessRootView;
@property (nonatomic, strong) ShadowRootView *providentFundRootView;

@property (nonatomic, strong) UIView *businessSeparator;
@property (nonatomic, strong) UIView *providentFundSeparator;

@end

@implementation CombinationInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // loanPeriodRootView.
        self.loanPeriodRootView = [[ShadowRootView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.loanPeriodRootView];
        
        self.loanPeriodInputView = [[InputPickerView alloc] initWithFrame:CGRectZero];
        self.loanPeriodInputView.text = @"贷款期限";
        self.loanPeriodInputView.placeholder = @"请选择贷款年限";
        [self.loanPeriodRootView addSubview:self.loanPeriodInputView];
        
        // businessRootView.
        self.businessRootView = [[ShadowRootView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.businessRootView];
        
        self.businessLoanInputView = [[InputView alloc] initWithFrame:CGRectZero];
        self.businessLoanInputView.unit = YES;
        self.businessLoanInputView.text = @"商业贷款";
        self.businessLoanInputView.unitText = @"万元";
        self.businessLoanInputView.placeholder = @"请输入商业贷款";
        [self.businessRootView addSubview:self.businessLoanInputView];
        
        self.businessAnnualRatesInputView = [[InputPickerView alloc] initWithFrame:CGRectZero];
        self.businessAnnualRatesInputView.text = @"贷款年利率";
        self.businessAnnualRatesInputView.placeholder = @"请选择贷款年利率";
        [self.businessRootView addSubview:self.businessAnnualRatesInputView];
        
        // providentFundRootView.
        self.providentFundRootView = [[ShadowRootView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.providentFundRootView];
        
        self.providentFundLoanInputView = [[InputView alloc] initWithFrame:CGRectZero];
        self.providentFundLoanInputView.unit = YES;
        self.providentFundLoanInputView.text = @"公积金贷款";
        self.providentFundLoanInputView.unitText = @"万元";
        self.providentFundLoanInputView.placeholder = @"请输入公积金贷款";
        [self.providentFundRootView addSubview:self.providentFundLoanInputView];
        
        self.providentFundAnnualRatesInputView = [[InputPickerView alloc] initWithFrame:CGRectZero];
        self.providentFundAnnualRatesInputView.text = @"贷款年利率";
        self.providentFundAnnualRatesInputView.placeholder = @"请选择贷款年利率";
        [self.providentFundRootView addSubview:self.providentFundAnnualRatesInputView];
        
        // businessSeparator.
        self.businessSeparator = [[UIView alloc] initWithFrame:CGRectZero];
        self.businessSeparator.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
        [self.businessRootView addSubview:self.businessSeparator];
        
        // providentFundSeparator.
        self.providentFundSeparator = [[UIView alloc] initWithFrame:CGRectZero];
        self.providentFundSeparator.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
        [self.providentFundRootView addSubview:self.providentFundSeparator];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // loanPeriodRootView.
    [self.loanPeriodRootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(16);
        make.height.mas_equalTo(50);
    }];
    
    [self.loanPeriodInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // businessRootView.
    [self.businessRootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.loanPeriodRootView.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    [self.businessLoanInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.businessSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(50);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.businessAnnualRatesInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.businessSeparator.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];
    
    // providentFundRootView.
    [self.providentFundRootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.businessRootView.mas_bottom).offset(10);
        make.height.mas_equalTo(100);
    }];
    
    [self.providentFundLoanInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    [self.providentFundSeparator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(50);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.providentFundAnnualRatesInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.providentFundSeparator.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];
}

@end









