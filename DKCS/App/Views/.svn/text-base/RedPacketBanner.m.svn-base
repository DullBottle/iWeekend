//
//  RedPacketBanner.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "RedPacketBanner.h"

@interface RedPacketBanner ()

@property (nonatomic, strong) UIView *blurEffectView;

@end

@implementation RedPacketBanner

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        // blurEffectView.
        self.blurEffectView = [[UIView alloc] initWithFrame:CGRectZero];
        self.blurEffectView.backgroundColor = [UIColor blackColor];
        self.blurEffectView.alpha = 0.4f;
        [self addSubview:self.blurEffectView];
        
        // imageView.
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.userInteractionEnabled = YES;
        [self addSubview:self.imageView];
        
        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.userInteractionEnabled = YES;
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.text = @"小花钱包放大招";
        [self addSubview:self.titleLabel];
        
        // detailTitleLabel.
        self.detailTitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.detailTitleLabel.userInteractionEnabled = YES;
        self.detailTitleLabel.font = [UIFont fontWithName:kCommonFont size:10.f];
        self.detailTitleLabel.textColor = [UIColor colorWithHexString:@"#FFEC16"];
        self.detailTitleLabel.text = @"点击领取红包";
        [self addSubview:self.detailTitleLabel];
        
        // cancelButton.
        self.cancelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.cancelButton setJk_touchAreaInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
        [self.cancelButton setImage:[UIImage imageNamed:@"取消"] forState:UIControlStateNormal];
        [self addSubview:self.cancelButton];
        
        [[self.cancelButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            [UIView animateWithDuration:0.1 delay:0.05 options:UIViewAnimationOptionCurveEaseIn animations:^{
                
                CGFloat width = [UIScreen mainScreen].bounds.size.width;
                self.frame = CGRectMake(0, -60, width, 50);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
            
        }];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // blurEffectView.
    [self.blurEffectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // imageView.
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(32);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(12);
        make.top.mas_equalTo(12);
    }];
    
    // detailTitleLabel.
    [self.detailTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.imageView.mas_right).offset(12);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(1);
    }];
    
    // cancelButton.
    [self.cancelButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-15);
        make.centerY.mas_equalTo(self.mas_centerY);
        make.width.height.mas_equalTo(16);
    }];
}

@end






















