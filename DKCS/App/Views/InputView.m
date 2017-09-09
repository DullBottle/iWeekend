//
//  InputView.m
//
//  Created by __End on 2017/4/28.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "InputView.h"

@interface InputView ()

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *unitLabel;

@end

@implementation InputView

- (void)setText:(NSString *)text
{
    self.textLabel.text = text;
}

- (void)setUnit:(BOOL)unit
{
    if (unit) {
        
        // text label.
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];

        // unitLabel.
        [self.unitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.textLabel.mas_centerY).offset(-1.3);
            make.right.mas_equalTo(-20);
        }];
        
        // input textField.
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.textLabel.mas_centerY);
            make.right.mas_equalTo(self.unitLabel.mas_left).offset(-3);
//            make.width.mas_equalTo(100);
            make.height.mas_equalTo(25);
        }];

    } else {
        
        // text label.
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.mas_equalTo(self.mas_centerY);
        }];
        
        // input textField.
        [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.textLabel.mas_centerY);
            make.right.mas_equalTo(-20);
            
            make.height.mas_equalTo(25);
        }];
    }
}

- (void)setUnitText:(NSString *)unitText
{
    self.unitLabel.text = unitText;
}

- (void)setPlaceholder:(NSString *)placeholder
{
    NSMutableParagraphStyle *style = [self.textField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
    style.minimumLineHeight = self.textField.font.lineHeight - (self.textField.font.lineHeight - [UIFont fontWithName:kCommonFont size:14.f].lineHeight) / 2.0;
    self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:placeholder
                   attributes:@{ (id)kCTForegroundColorAttributeName: (id)[UIColor colorWithHexString:@"#CCCCCC"].CGColor,
                                 NSFontAttributeName: [UIFont fontWithName:kCommonFont size:14.f],
                                 NSParagraphStyleAttributeName : style }];
}

- (void)setKeyboardType:(UIKeyboardType)keyboardType
{
    self.textField.keyboardType = keyboardType;
}

- (void)setResult:(NSString *)result
{
    self.textField.enabled = NO;
    self.textField.text = result;
}

- (NSString *)result
{
    return self.textField.text;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // text label.
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.textLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        self.textLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.textLabel];
        
        // textField.
        self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.textField.textAlignment = NSTextAlignmentRight;
        self.textField.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.textField.textColor = [UIColor colorWithHexString:@"#333333"];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:self.textField];
        
        // unit label.
        self.unitLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.unitLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.unitLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.unitLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.unitLabel];

//        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.textLabel sizeToFit];
    [self.unitLabel sizeToFit];
}

@end












