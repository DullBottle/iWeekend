//
//  LoginView.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoginView.h"

@interface LoginView () <UITextFieldDelegate>

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *areaCodeLabel;
@property (nonatomic, strong) UIView *separator;

@end

@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // imageView.
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.image = [UIImage imageNamed:@"Logo"];
        [self addSubview:self.imageView];
        
        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.titleLabel.text = @"输入手机号即可进行贷款";
        [self addSubview:self.titleLabel];
        
        // areaCodeLabel.
        self.areaCodeLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.areaCodeLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.areaCodeLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        self.areaCodeLabel.text = @"+ 86 |";
        [self addSubview:self.areaCodeLabel];
        
        // textField.
        self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.textField.delegate = self;
        self.textField.font = [UIFont fontWithName:kCommonFont size:18.f];
        self.textField.textColor = [UIColor colorWithHexString:@"#333333"];
        NSMutableParagraphStyle *style = [self.textField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
        style.minimumLineHeight = self.textField.font.lineHeight - (self.textField.font.lineHeight - [UIFont fontWithName:kCommonFont size:14.f].lineHeight) / 2.0;
        self.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入你的手机号码"
                       attributes:@{ (id)kCTForegroundColorAttributeName: (id)[UIColor colorWithHexString:@"#CCCCCC"].CGColor,
                                    NSFontAttributeName: [UIFont fontWithName:kCommonFont size:14.f],
                                    NSParagraphStyleAttributeName : style }];
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
        [self addSubview:self.textField];
        
        // nextButton.
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextButton.enabled = NO;
        self.nextButton.layer.cornerRadius = 14.f;
        self.nextButton.clipsToBounds = YES;
        self.nextButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
        [self.nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        [self.nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [self.nextButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self.nextButton jk_setBackgroundColor:[UIColor colorWithHexString:@"#DFDFDF"] forState:UIControlStateDisabled];
        [self.nextButton jk_setBackgroundColor:[UIColor colorWithHexString:@"#FFEC16"] forState:UIControlStateNormal];
        [self addSubview:self.nextButton];
        
        // separator.
        self.separator = [[UIView alloc] initWithFrame:CGRectZero];
        self.separator.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [self addSubview:self.separator];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // imageView.
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(54);
        make.width.height.mas_equalTo(75);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(35);
    }];
    
    // areaCodeLabel.
    [self.areaCodeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.textField.mas_left).offset(-9);
        make.centerY.mas_equalTo(self.textField.mas_centerY);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(25);
    }];
    
    // textField.
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(221);
        make.centerX.mas_equalTo(self.mas_centerX).offset(-20);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(25);
    }];
    
    // nextButton.
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.textField.mas_right).offset(10);
        make.centerY.mas_equalTo(self.textField.mas_centerY);
        make.width.mas_equalTo(80);
        make.height.mas_equalTo(28);
    }];
    
    // separator.
    [self.separator mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.areaCodeLabel.mas_left).offset(-5);
        make.right.mas_equalTo(self.nextButton.mas_right).offset(5);
        make.top.mas_equalTo(self.nextButton.mas_bottom).offset(4);
        make.height.mas_equalTo(0.5);
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
}

#pragma mark - UITextView Delegate methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 11) {
        return NO;
    }
    
    if ([string isEqualToString:@"\n"]) {
        if (textField.isFirstResponder) {
            [textField resignFirstResponder];
        }
        return NO;
    }
    
    NSMutableString *changedString = [[NSMutableString alloc] initWithString:textField.text];
    [changedString replaceCharactersInRange:range withString:string];
    
    if (changedString.length != 0) {
        if (!self.nextButton.isEnabled) {
            self.nextButton.enabled = YES;
        }
    } else {
        if (self.nextButton.isEnabled) {
            self.nextButton.enabled = NO;
        }
    }
    
    return YES;
}

@end



















