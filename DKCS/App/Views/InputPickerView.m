//
//  InputPickerView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "InputPickerView.h"

@interface InputPickerView ()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) TapTap *tapTapView;

@end

@implementation InputPickerView

- (void)setText:(NSString *)text
{
    self.textLabel.text = text;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    self.tapTapView.resultLabel.textColor = [UIColor colorWithHexString:@"#CCCCCC"];
    self.tapTapView.resultLabel.text = placeholder;
}

- (void)setResult:(NSString *)result
{
    self.tapTapView.resultLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    self.tapTapView.resultLabel.text = result;
}

- (NSString *)result
{
    return self.tapTapView.resultLabel.text;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // textLabel.
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        [self addSubview:self.textLabel];
        
        // tapTapView.
        self.tapTapView = [[TapTap alloc] initWithFrame:CGRectZero];
        [self addSubview:self.tapTapView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    
    [self.tapTapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(-20);
        make.width.mas_equalTo(150);
    }];
}

@end











