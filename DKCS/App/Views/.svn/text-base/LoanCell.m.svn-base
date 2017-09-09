//
//  LoanCell.m
//  DKCS
//
//  Created by __End on 2017/9/1.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanCell.h"

@interface LoanCell ()

@property (nonatomic, strong) UIButton *loanTypeButton;
@property (nonatomic, strong) UIView *bottomLine;
@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation LoanCell

#pragma mark - setter & getter

- (void)setLoanType:(LoanType)loanType
{
    switch (loanType) {
        case LoanTypeLendingFast: {
            
            [self.loanTypeButton setTitle:@"放款快" forState:UIControlStateNormal];
            [self.loanTypeButton setTitleColor:[UIColor colorWithHexString:@"#FEC500"] forState:UIControlStateNormal];
            [self.loanTypeButton setBackgroundImage:[UIImage imageNamed:@"放款快"] forState:UIControlStateNormal];
            
        } break;
        case LoanTypeQuotaHigh: {
            
            [self.loanTypeButton setTitle:@"额度高" forState:UIControlStateNormal];
            [self.loanTypeButton setTitleColor:[UIColor colorWithHexString:@"#3EB6FF"] forState:UIControlStateNormal];
            [self.loanTypeButton setBackgroundImage:[UIImage imageNamed:@"额度高"] forState:UIControlStateNormal];
            
        } break;
        case LoanTypeHighPassRate: {
            
            [self.loanTypeButton setTitle:@"通过高" forState:UIControlStateNormal];
            [self.loanTypeButton setTitleColor:[UIColor colorWithHexString:@"#4DC896"] forState:UIControlStateNormal];
            [self.loanTypeButton setBackgroundImage:[UIImage imageNamed:@"通过高"] forState:UIControlStateNormal];
            
        } break;
        default:
            break;
    }
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // thumbnailView.
        self.thumbnailView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.thumbnailView.contentMode = UIViewContentModeScaleAspectFill;
        self.thumbnailView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        self.thumbnailView.clipsToBounds = YES;
        [self.contentView addSubview:self.thumbnailView];
        
        // nameLabel.
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.nameLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.nameLabel.textColor = [UIColor colorWithHexString:@"#333333"];
//        self.nameLabel.numberOfLines = 1;
//        self.nameLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        [self.contentView addSubview:self.nameLabel];
        
        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.numberOfLines = 1;
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self.contentView addSubview:self.titleLabel];
        
        // loanLimitLabel.
        self.loanLimitLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        self.loanLimitLabel.numberOfLines = 1;
        self.loanLimitLabel.textColor = [UIColor colorWithHexString:@"#FF4E33"];
        self.loanLimitLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        [self.contentView addSubview:self.loanLimitLabel];
        
        // loanTypeButton.
        self.loanTypeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loanTypeButton.enabled = NO;
        self.loanTypeButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:9.f];
        [self.contentView addSubview:self.loanTypeButton];
        
        // submitButton.
        self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.submitButton.enabled = NO;
        [self.submitButton setTitle:@"马上申请" forState:UIControlStateNormal];
        self.submitButton.backgroundColor = [UIColor colorWithHexString:@"#FF4E33"];
        self.submitButton.layer.cornerRadius = 10.f;
        self.submitButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:9.f];
        [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.contentView addSubview:self.submitButton];
        
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
    // thumbnailView.
    [self.thumbnailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(7);
        make.width.height.mas_equalTo(40);
    }];
    
    // nameLabel.
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(self.thumbnailView.mas_bottom).offset(8);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.thumbnailView.mas_right).offset(14);
        make.right.mas_equalTo(-14);
        make.top.mas_equalTo(4);
    }];
    
    // loanLimitLabel.
    [self.loanLimitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.thumbnailView.mas_right).offset(14);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(6);
    }];
    
    // loanTypeButton.
    [self.loanTypeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.nameLabel.mas_right).offset(11);
        make.centerY.mas_equalTo(self.nameLabel.mas_centerY);
        make.width.mas_equalTo(46.8);
        make.height.mas_equalTo(16);
    }];
    
    // submitButton.
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView.mas_centerY);
        make.right.mas_equalTo(-18);
        make.width.mas_equalTo(44);
        make.height.mas_equalTo(20);
    }];
    
    // bottomLine.
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    [self.loanLimitLabel sizeToFit];
}

@end


