//
//  MortgageOutputView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MortgageOutputView.h"

@interface MortgageOutputView () <TabIndicatorViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation MortgageOutputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // tabIndicator.
        self.tabIndicator = [[TabIndicatorView alloc] initWithFrame:CGRectZero];
        self.tabIndicator.delegate = self;
        self.tabIndicator.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.tabIndicator];
        
        // scrollView.
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollView.delegate = self;
        [self.scrollView setContentSize:CGSizeMake((width - 40) * 2, 200)];
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        // FixedPaymentResultView.
        self.fixedPaymentResultView = [[FixedPaymentResultView alloc] initWithFrame:CGRectMake(0, 0, width - 40, 200)];
        [self.scrollView addSubview:self.fixedPaymentResultView];
        
        // fixedBasisResultView.
        self.fixedBasisResultView = [[FixedBasisResultView alloc] initWithFrame:CGRectMake(width - 40, 0, width - 40, 200)];
        [self.scrollView addSubview:self.fixedBasisResultView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // TabIndicatorView.
    [self.tabIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
    
    // scrollView.
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.tabIndicator.mas_bottom).offset(11);
        make.height.mas_equalTo(200);
    }];
    
}

#pragma mark - TabIndicatorViewDelegate methods

- (NSArray<NSString *> *)tabIndicatorTitles
{
    return @[ @"等额本息", @"等额本金" ];
}

- (CGFloat)widthForTabIndicator
{
    return 56.f;
}

- (void)tabIndicatorView:(TabIndicatorView *)tabIndicatorView didSelectedAtIndex:(NSUInteger)index
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    CGFloat offset = index * width;
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

#pragma mark - ScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    NSUInteger index = scrollView.contentOffset.x / width;
    [self.tabIndicator setIndicatorOffsetWithIndex:index];
}

@end







