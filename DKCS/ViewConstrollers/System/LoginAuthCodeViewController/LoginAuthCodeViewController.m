//
//  LoginAuthCodeViewController.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoginAuthCodeViewController.h"
#import "AuthCodeLabel.h"
#import "UITextField+TextFieldDidDeleteBackwardNotification.h"

@interface LoginAuthCodeViewController () <UITextFieldDelegate>

@property (nonatomic, strong) LoginAuthCodeViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *countDownLabel;
@property (nonatomic, strong) UIButton *resendButton;
@property (nonatomic, copy) NSArray *authCodeLabels;            // 存储4个验证码Label的array.
@property (nonatomic, assign) NSUInteger currentIndex;          // 记录当前index.
@property (nonatomic, assign, getter=isResend) BOOL resend;     // 记录是否重发. default is `NO`.

@property (nonatomic, strong) NSTimer *timer;                   // 定时器
@property (nonatomic, strong) NSDate *fireDatetime;             // 记录定时器开始时间

@end

@implementation LoginAuthCodeViewController

- (void)dealloc
{
    
}

- (instancetype)initWithViewModel:(LoginAuthCodeViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.currentIndex = 0;
        self.resend = NO;
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // textField.
        self.textField = [[UITextField alloc] initWithFrame:CGRectZero];
        self.textField.delegate = self;
        
        self.textField.keyboardType = UIKeyboardTypeNumberPad;
        
        // informationLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.hidden = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"验证码已发送至您的手机";
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        
        // countDownLabel.
        self.countDownLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.countDownLabel.hidden = YES;
        self.countDownLabel.textAlignment = NSTextAlignmentCenter;
        self.countDownLabel.text = @"90秒后重新获取";
        self.countDownLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.countDownLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        
        // resendButton.
        self.resendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.resendButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        [self.resendButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        [self.resendButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        self.resendButton.backgroundColor = [UIColor colorWithHexString:@"#FFEC16"];
        self.resendButton.layer.cornerRadius = 20.f;
        self.resendButton.clipsToBounds = YES;
        self.resendButton.hidden = YES;
        
        // AuthCodeLabels.
        NSMutableArray *arr = [NSMutableArray array];
        for (NSUInteger i = 0; i < 4; i++) {
            @weakify(self);
            AuthCodeLabel *label = [[AuthCodeLabel alloc] initWithFrame:CGRectZero];
            label.tap = ^(UILabel *sender) {
                @strongify(self);
                if (!self.textField.isFirstResponder) {
                    [self.textField becomeFirstResponder];
                }
            };
            [arr addObject:label];
            label = nil;
        }
        self.authCodeLabels = arr;
        arr = nil;
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.countDownLabel];
    [self.view addSubview:self.resendButton];
    for (AuthCodeLabel *label in self.authCodeLabels) {
        [self.view addSubview:label];
    }
    
    @weakify(self);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @strongify(self);
        [self.textField becomeFirstResponder];
    });
}

- (void)configure:(LoginAuthCodeViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        [viewModel.getAuthCode sendNext:viewModel.mobile];
    }];
    
    //
    // Output.
    //
    [viewModel.didReceiveAuthCode subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }
        
        self.titleLabel.hidden = NO;
        self.countDownLabel.hidden = NO;
    }];
    
    [viewModel.didLogin subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }
        
        // Keep the user mobile to `NSUserDefaults`.
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:viewModel.mobile forKey:kUserMobile];
        [defaults setObject:@YES forKey:kUserIsLogin];
        [defaults synchronize];
        
        // Reload `rootViewController`.
        [self showMessage:@"登录成功"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.45f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[AppDelegate shared] reloadRootViewController];
        });
    }];
}

- (void)setupConstraints
{
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(64);
    }];
    
    // countDownLabel.
    [self.countDownLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
    }];
    
    // resendButton.
    [self.resendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(68);
        make.width.mas_equalTo(140);
        make.height.mas_equalTo(40);
    }];
    
    // AuthCodeLabels.
    CGFloat size = ([UIScreen mainScreen].bounds.size.width - 76.f * 2 - 28.f * 3 ) / 4.f;
    [self.authCodeLabels mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:28.f leadSpacing:76.f tailSpacing:76.f];
    [self.authCodeLabels mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(135.5);
        make.width.height.mas_equalTo(size);
    }];
}

#pragma mark - UITextField delegate methods

- (void)textFieldDidDeleteBackward:(NSNotification *)notification
{
    // Get the label from the index.
    AuthCodeLabel *label = [self.authCodeLabels objectAtIndex:self.currentIndex];
    label.text = @"";
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (range.location >= 4) {
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
    
//    if (changedString.length == 0) {
//        return NO;
//    }
    
    // Get the index.
    self.currentIndex = changedString.length;
    
    // Get the character.
    if (changedString.length != 0) {
        NSString *str = [changedString substringWithRange:NSMakeRange(self.currentIndex - 1, 1)];
            
        // Get the label from the index.
        AuthCodeLabel *label = [self.authCodeLabels objectAtIndex:self.currentIndex - 1];
        label.text = str;
    }
    
    // Do `Login` when the index is 4, maybe delay foo seconds;
    if (self.currentIndex == 4) {
        NSLog(@"Do login.");
        @weakify(self);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            @strongify(self);
            [self showLoading:@"正在登录.."];
            [self.viewModel.login sendNext:RACTuplePack(self.viewModel.mobile, changedString)];
        });
    }
    
    return YES;
}

@end









