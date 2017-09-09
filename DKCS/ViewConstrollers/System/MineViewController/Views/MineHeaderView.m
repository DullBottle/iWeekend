//
//  MineHeaderView.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()

@property (nonatomic, strong) UIImageView *backgroundView;
@property (nonatomic, strong) UIImageView *avatarView;

@end

@implementation MineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // backgroundView.
        self.backgroundView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.backgroundView.userInteractionEnabled = YES;
        self.backgroundView.contentMode = UIViewContentModeScaleAspectFill;
        self.backgroundView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin);
        self.backgroundView.image = [UIImage imageNamed:@"我的头部"];
        [self addSubview:self.backgroundView];
    
        // avatarView.
        self.avatarView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.avatarView.contentMode = UIViewContentModeScaleAspectFill;
        self.avatarView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin);
        self.avatarView.image = [UIImage imageNamed:@"默认头像-男"];
        [self.backgroundView addSubview:self.avatarView];
        
        // accountButton.
        self.accountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.accountButton.jk_touchAreaInsets = UIEdgeInsetsMake(8, 8, 8, 8);
        self.accountButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self.accountButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.backgroundView addSubview:self.accountButton];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // backgroundView.
    [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // avatarView.
    [self.avatarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.backgroundView.mas_centerX);
        make.centerY.mas_equalTo(self.backgroundView.mas_centerY).offset(-1);
        make.width.height.mas_equalTo(60);
    }];
    
    // accountButton.
    [self.accountButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.avatarView.mas_centerX);
        make.top.mas_equalTo(self.avatarView.mas_bottom).offset(14);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end





