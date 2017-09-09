//
//  LoanRatesCell.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanRatesCell.h"

@interface LoanRatesCell ()

@property (nonatomic, strong) UIView *rightLine;
@property (nonatomic, strong) UIView *bottomLine;

@end

@implementation LoanRatesCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // textLabel.
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.textLabel.numberOfLines = 1;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.textLabel];
        
        // rightLine.
        self.rightLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.rightLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self.contentView addSubview:self.rightLine];
        
        // bottomLine.
        self.bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.bottomLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self.contentView addSubview:self.bottomLine];
     
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // textLabel.
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView.mas_centerX);
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
    }];
    
    // rightLine.
    [self.rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.width.mas_equalTo(0.5);
    }];
    
    // bottomLine.
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

@end























