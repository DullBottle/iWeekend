//
//  HouseLoanCalculateController.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HouseLoanCalculateController.h"
#import "TabIndicatorView.h"
#import "BusinessCalculateView.h"
#import "ProvidentFundCalculateView.h"
#import "CombinationCalculateView.h"

@interface HouseLoanCalculateController () <TabIndicatorViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) HouseLoanCalculateViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) TabIndicatorView *tabIndicator;
@property (nonatomic, strong) UIView *tabIndicatorLine;
@property (nonatomic, strong) UIScrollView *rootScrollView;
@property (nonatomic, strong) BusinessCalculateView *businessView;
@property (nonatomic, strong) ProvidentFundCalculateView *providentFundView;
@property (nonatomic, strong) CombinationCalculateView *combinationView;

@end

@implementation HouseLoanCalculateController

- (instancetype)initWithViewModel:(HouseLoanCalculateViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // tabIndicator.
        self.tabIndicator = [[TabIndicatorView alloc] initWithFrame:CGRectZero];
        self.tabIndicator.delegate = self;
        self.tabIndicator.backgroundColor = [UIColor whiteColor];

        // TabIndicatorLine.
        self.tabIndicatorLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.tabIndicatorLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // rootScrollView.
        CGSize size = [UIScreen mainScreen].bounds.size;
        CGFloat height = size.height - 64 - 50;
        self.rootScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.rootScrollView.backgroundColor = [UIColor whiteColor];
        self.rootScrollView.delegate = self;
        [self.rootScrollView setContentSize:CGSizeMake(size.width * 3, 0)];
        self.rootScrollView.pagingEnabled = YES;
        self.rootScrollView.showsHorizontalScrollIndicator = NO;
        
        // businessView.
        self.businessView = [[BusinessCalculateView alloc] initWithFrame:CGRectMake(0, 0, size.width, height)];
        
        // providentFundView.
        self.providentFundView = [[ProvidentFundCalculateView alloc] initWithFrame:CGRectMake(size.width, 0, size.width, height)];
        
        // combinationView.
        self.combinationView = [[CombinationCalculateView alloc] initWithFrame:CGRectMake(size.width * 2, 0, size.width, height)];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.tabIndicator];
    [self.view addSubview:self.tabIndicatorLine];
    [self.view addSubview:self.rootScrollView];
    [self.rootScrollView addSubview:self.businessView];
    [self.rootScrollView addSubview:self.providentFundView];
    [self.rootScrollView addSubview:self.combinationView];
}

- (void)configure:(HouseLoanCalculateViewModel *)viewModel
{
    
}

- (void)setupConstraints
{
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    // TabIndicatorView.
    [self.tabIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(0);
        make.height.mas_equalTo(50);
    }];
    
    // TabIndicatorLine.
    [self.tabIndicatorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tabIndicator.mas_bottom).offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    // rootScrollView.
    [self.rootScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tabIndicatorLine.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - TabIndicatorViewDelegate methods

- (NSArray<NSString *> *)tabIndicatorTitles
{
    return @[ @"商业", @"公积金", @"组合" ];
}

- (void)tabIndicatorView:(TabIndicatorView *)tabIndicatorView didSelectedAtIndex:(NSUInteger)index
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat offset = index * width;
    [self.rootScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

#pragma mark - ScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    NSUInteger index = scrollView.contentOffset.x / width;
    [self.tabIndicator setIndicatorOffsetWithIndex:index];
}

@end


