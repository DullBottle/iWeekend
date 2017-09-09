//
//  TabIndicatorView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "TabIndicatorView.h"

@interface TabIndicatorView ()

@property (nonatomic, strong) UIView *indicator;                    // 指示器视图
@property (nonatomic, copy) NSArray *buttons;

@end

@implementation TabIndicatorView {
    BOOL didSetupConstraints;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        didSetupConstraints = NO;
        
    }
    return self;
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (!didSetupConstraints) {
        CGRect bounds = self.bounds;
        NSArray *titles = self.delegate.tabIndicatorTitles;
        
        // buttons.
        NSMutableArray *arr = [NSMutableArray array];
        for (NSString *title in titles) {
            NSUInteger index = [titles indexOfObject:title];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            [button setTitle:title forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
            [button setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(didSelectedButton:) forControlEvents:UIControlEventTouchUpInside];
            if (index == 0) {
                [button setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
                button.titleLabel.font = [UIFont fontWithName:kCommonBoldFont size:14.f];
            }
            [self addSubview:button];
            [arr addObject:button];
            button = nil;
        }
        self.buttons = arr;
        
        [self.buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
        [self.buttons mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
        }];
        
        // indicator.
        CGFloat width = [self.delegate respondsToSelector:@selector(widthForTabIndicator)] ? self.delegate.widthForTabIndicator : bounds.size.width / titles.count;
        UIButton *button = self.buttons.firstObject;
        self.indicator = [[UIView alloc] initWithFrame:CGRectZero];
        self.indicator.backgroundColor = [UIColor colorWithHexString:@"#FFEC16"];
        [self addSubview:self.indicator];
        [self.indicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(button.mas_centerX);
            make.bottom.mas_equalTo(0);
            make.width.mas_equalTo(width);
            make.height.mas_equalTo(4);
        }];
        
        didSetupConstraints = YES;
    }
}

- (void)setIndicatorOffsetWithIndex:(NSUInteger)index
{
    UIButton *sender = [self.buttons objectAtIndex:index];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.indicator.frame = CGRectMake(CGRectGetMinX(sender.frame) + (CGRectGetWidth(sender.frame) - CGRectGetWidth(self.indicator.frame)) / 2,
                                          CGRectGetMinY(self.indicator.frame),
                                          CGRectGetWidth(self.indicator.frame),
                                          CGRectGetHeight(self.indicator.frame));
    }];
    
    // selectedTextColor.
    [self.buttons enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *btn = (UIButton *)obj;
        if ([btn isEqual:sender]) {
            [btn setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:kCommonBoldFont size:14.f];
        } else {
            [btn setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        }
    }];
}

#pragma mark - Action

- (void)didSelectedButton:(UIButton *)sender
{
    NSUInteger index = [self.buttons indexOfObject:sender];
    
    // indicator animation.
    [self setIndicatorOffsetWithIndex:index];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(tabIndicatorView:didSelectedAtIndex:)]) {
        [self.delegate tabIndicatorView:self didSelectedAtIndex:index];
    }
}

@end

