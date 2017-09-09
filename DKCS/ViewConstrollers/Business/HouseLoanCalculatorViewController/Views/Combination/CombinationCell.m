//
//  CombinationCell.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "CombinationCell.h"

@implementation CombinationInputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.inputView = [[CombinationInputView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.inputView];
        
        [self.inputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        }];
    }
    return self;
}

+ (CGSize)size:(CGFloat)width
{
    return CGSizeMake(width, 296);
}

@end

@implementation CombinationOutputCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.outputView = [[CombinationOutputView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:self.outputView];
        
        [self.outputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsMake(10, 20, 20, 20));
        }];
        
    }
    return self;
}

+ (CGSize)size:(CGFloat)width
{
    return CGSizeMake(width, 335);
}

@end

