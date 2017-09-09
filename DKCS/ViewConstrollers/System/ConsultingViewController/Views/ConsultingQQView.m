//
//  ConsultingQQView.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ConsultingQQView.h"

@interface ConsultingQQView ()

@property (nonatomic, strong) UIImageView *qqIcon;

@end

@implementation ConsultingQQView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        // QQ Icon.
        self.qqIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.qqIcon.image = [UIImage imageNamed:@"QQ"];
        [self addSubview:self.qqIcon];
        
        // label.
        self.label = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        self.label.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.label.textColor = [UIColor colorWithHexString:@"#0A97ED"];
        self.label.numberOfLines = 1;
        [self addSubview:self.label];
        
        // cpyButton.
        self.cpyButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [self.cpyButton setTitle:@"复制" forState:UIControlStateNormal];
        [self.cpyButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        self.cpyButton.layer.borderWidth = 1.f;
        self.cpyButton.layer.borderColor = [UIColor colorWithHexString:@"#999999"].CGColor;
        self.cpyButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:13.f];
        [self addSubview:self.cpyButton];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // QQ Icon.
    [self.qqIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(20);
        make.width.height.mas_equalTo(20);
    }];
    
    // label.
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.qqIcon.mas_right).offset(14);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(20);
    }];
    
    // cpyButton.
    [self.cpyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(24);
    }];
}

@end















