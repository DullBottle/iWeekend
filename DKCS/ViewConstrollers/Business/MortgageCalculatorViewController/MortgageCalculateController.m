//
//  MortgageCalculateController.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MortgageCalculateController.h"
#import "MortgageInputView.h"
#import "MortgageOutputView.h"

@interface MortgageCalculateController ()

@property (nonatomic, strong) MortgageCalculateViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) MortgageInputView *inputView;
@property (nonatomic, strong) MortgageOutputView *outputView;

@end

@implementation MortgageCalculateController

- (instancetype)initWithViewModel:(MortgageCalculateViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // contentView.
        self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        // inputView.
        self.inputView = [[MortgageInputView alloc] initWithFrame:CGRectZero];
        
        // outputView.
        self.outputView = [[MortgageOutputView alloc] initWithFrame:CGRectZero];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)configure:(MortgageCalculateViewModel *)viewModel
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.inputView];
    [self.contentView addSubview:self.outputView];
}

- (void)setupConstraints
{
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    // contentView.
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
    }];
    
    // inputView.
    [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20.5);
        make.height.mas_equalTo(150);
    }];
    
    // outputView.
    [self.outputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.inputView.mas_bottom).offset(20);
        make.bottom.mas_equalTo(-28);
    }];    
}

@end





