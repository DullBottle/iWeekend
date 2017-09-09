//
//  TapTap.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "TapTap.h"

@implementation TapTap

- (void)setPlaceholder:(NSString *)placeholder
{
    self.resultLabel.textColor = [UIColor colorWithHexString:@"#CCCCCC"];
    self.resultLabel.text = placeholder;
}

- (void)setResult:(NSString *)result
{
    self.resultLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.resultLabel.text = result;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // resultLabel.
        self.resultLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.resultLabel.userInteractionEnabled = YES;
        self.resultLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self addSubview:self.resultLabel];
        
        // imageView.
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.userInteractionEnabled = YES;
        self.imageView.image = [UIImage imageNamed:@"sanjiao"];
        [self addSubview:self.imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        
        [self setupConstraints];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)sender
{
    NSLog(@"taptap");
    if (self.tap) {
        self.tap();
    }
}

- (void)setupConstraints
{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(0);
        make.width.mas_equalTo(9);
        make.height.mas_equalTo(7);
    }];
    
    [self.resultLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.right.mas_equalTo(self.imageView.mas_left).offset(-6);
    }];
}

@end
