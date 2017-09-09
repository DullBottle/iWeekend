//
//  LoanLimitCell.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanLimitCell.h"

@implementation LoanLimitCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.backgroundColor = [UIColor whiteColor];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.titleLabel.layer.borderColor = [UIColor colorWithHexString:@"#333333"].CGColor;
        self.titleLabel.layer.borderWidth = 0.5f;
        [self.contentView addSubview:self.titleLabel];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(3, 3, 3, 3));
    }];
}

@end
