//
//  ConsultingWorkingHoursView.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ConsultingWorkingHoursView.h"

@interface ConsultingWorkingHoursView ()

@property (nonatomic, strong) UIImageView *datetimeIcon;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ConsultingWorkingHoursView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        // datetimeIcon.
        self.datetimeIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.datetimeIcon.image = [UIImage imageNamed:@"工作时间"];
        [self addSubview:self.datetimeIcon];

        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.text = @"工作时间：";
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self addSubview:self.titleLabel];
        
        // label.
        self.label = [[UILabel alloc] initWithFrame:CGRectZero];
        self.label.numberOfLines = 1;
        self.label.textColor = [UIColor colorWithHexString:@"#333333"];
        self.label.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self addSubview:self.label];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // datetimeIcon.
    [self.datetimeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(23);
        make.width.height.mas_equalTo(20);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.datetimeIcon.mas_right).offset(14);
        make.centerY.mas_equalTo(self.datetimeIcon.mas_centerY);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(20);
    }];
    
    // label.
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.datetimeIcon.mas_right).offset(14);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(10);
        make.width.mas_equalTo(250);
        make.height.mas_equalTo(20);
    }];
}

@end













