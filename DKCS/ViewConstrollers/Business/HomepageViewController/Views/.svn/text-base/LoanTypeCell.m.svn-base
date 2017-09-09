//
//  LoanTypeCell.m
//  DKCS
//
//  Created by __End on 2017/9/1.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanTypeCell.h"

@implementation LoanTypeCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // iconView.
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.iconView];
        
        // textLabel.
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont fontWithName:kCommonFont size:10.f];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.textLabel.numberOfLines = 1;
        [self.contentView addSubview:self.textLabel];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // iconView.
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.centerY.mas_equalTo(self.contentView.mas_centerY).offset(-10);
        make.width.height.mas_equalTo(38);
    }];
    
    // textLabel.
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.top.mas_equalTo(self.iconView.mas_bottom).offset(6);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.textLabel sizeToFit];
}

@end
