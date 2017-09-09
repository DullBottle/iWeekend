//
//  BusinessCell.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BusinessCell.h"

@implementation BusinessInputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.inputView = [[BusinessInputView alloc] initWithFrame:CGRectZero];
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

@implementation BusinessOutputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.outputView = [[BusinessOutputView alloc] initWithFrame:CGRectZero];
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
