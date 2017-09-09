//
//  ProvidentFundCell.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ProvidentFundCell.h"

@implementation ProvidentFundInputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.inputView = [[ProvidentFundInputView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.inputView];
        
        [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(16, 20, 10, 20));
        }];
    }
    return self;
}

+ (CGSize)size:(CGFloat)width
{
    return CGSizeMake(width, 276);
}

@end

@implementation ProvidentFundOutputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.outputView = [[ProvidentFundOutputView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.outputView];
        
        [self.outputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 20, 20, 20));
        }];
        
    }
    return self;
}

+ (CGSize)size:(CGFloat)width
{
    return CGSizeMake(width, 280);
}

@end


