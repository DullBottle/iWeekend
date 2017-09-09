//
//  SearchFilterCell.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SearchFilterCell.h"

@implementation SearchFilterCell

- (void)setSelected:(BOOL)selected
{
    if (selected) {
        self.textLabel.backgroundColor = [UIColor colorWithHexString:@"#FF4E33"];
        self.textLabel.textColor = [UIColor whiteColor];
    } else {
        self.textLabel.backgroundColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
    }
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // textLabel.
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.userInteractionEnabled = YES;
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        self.textLabel.backgroundColor = [UIColor whiteColor];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.textLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.textLabel.layer.cornerRadius = 2.f;
        self.textLabel.clipsToBounds = YES;
        [self.contentView addSubview:self.textLabel];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // textLabel.
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(16, 16, 16, 16));
    }];
}

@end












