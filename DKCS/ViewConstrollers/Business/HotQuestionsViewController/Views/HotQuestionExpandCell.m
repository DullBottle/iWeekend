//
//  HotQuestionExpandCell.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HotQuestionExpandCell.h"

@interface HotQuestionExpandCell ()

@property (nonatomic, strong) UIView *separator;

@end

@implementation HotQuestionExpandCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        // questionLabel.
        self.questionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.questionLabel.numberOfLines = 0;
        self.questionLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.questionLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        [self.contentView addSubview:self.questionLabel];
        
        // arrow.
        self.arrow = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.arrow.image = [UIImage imageNamed:@"翻页箭头"];
        [self.contentView addSubview:self.arrow];
        
        // answerLabel.
        self.answerLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.answerLabel.numberOfLines = 0;
        self.answerLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.answerLabel.textColor = [UIColor colorWithHexString:@"#999999"];
        [self.contentView addSubview:self.answerLabel];
        
        // separator.
        self.separator = [[UIView alloc] initWithFrame:CGRectZero];
        self.separator.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
        [self.contentView addSubview:self.separator];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // questionLabel.
    [self.questionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(15);
        make.right.mas_equalTo(35);
    }];
    
    // arrow.
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(19);
        make.right.mas_equalTo(-25);
        make.width.height.mas_equalTo(10);
    }];
    
    // answerLabel.
    [self.answerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.top.mas_equalTo(self.questionLabel.mas_bottom).offset(5);
        make.right.mas_equalTo(-19);
//        make.bottom.mas_equalTo(-5);
    }];

    // separator.
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(19);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

@end
