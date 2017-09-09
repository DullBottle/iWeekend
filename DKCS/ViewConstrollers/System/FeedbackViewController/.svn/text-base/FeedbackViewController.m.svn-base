//
//  FeedbackViewController.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "FeedbackViewController.h"
#import "UIViewController+SVP.h"
#import "UITextView+Placeholder.h"

@interface FeedbackViewController () <UITextViewDelegate>

@property (nonatomic, strong) FeedbackViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *submitButton;

@end

@implementation FeedbackViewController

- (instancetype)initWithViewModel:(FeedbackViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];

        // contentView.
        self.contentView = [[UIView alloc] initWithFrame:CGRectZero];
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        // titleLabel.
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.titleLabel.text = @"感谢您的反馈：";
        self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        
        // textView.
        self.textView = [[UITextView alloc] initWithFrame:CGRectZero];
        self.textView.delegate = self;
        self.textView.returnKeyType = UIReturnKeyDone;
        self.textView.placeholder = @"请在这里输入您的宝贵意见...";
        self.textView.placeholderLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        self.textView.placeholderColor = [UIColor colorWithHexString:@"#CCCCCC"];
        self.textView.typingAttributes = @{ NSFontAttributeName: [UIFont fontWithName:kCommonFont size:14.f],
                                            NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#333333"] };
        
        // submitButton.
        self.submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.submitButton.enabled = NO;
        self.submitButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:18.f];
        [self.submitButton setTitle:@"提交" forState:UIControlStateNormal];
        [self.submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
        [self.submitButton setTitleColor:[UIColor colorWithHexString:@"#333333"] forState:UIControlStateNormal];
        [self.submitButton jk_setBackgroundColor:[UIColor colorWithHexString:@"#DFDFDF"] forState:UIControlStateDisabled];
        [self.submitButton jk_setBackgroundColor:[UIColor colorWithHexString:@"#FFEC16"] forState:UIControlStateNormal];
        
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.textView];
    [self.view addSubview:self.submitButton];
}

- (void)configure:(FeedbackViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self.submitButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        
        if ([IQKeyboardManager sharedManager].isKeyboardShowing) {
            [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, 30)];
        } else {
            [SVProgressHUD setOffsetFromCenter:UIOffsetMake(0, -75)];
        }
        
        [viewModel.submit sendNext:self.textView.text];
    }];
    
    //
    // Output.
    //
    [viewModel.didSubmit subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }
        
        [self showMessage:@"感谢您的宝贵意见"];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.45 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.navigationController popViewControllerAnimated:YES];
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
    
    // contentView.
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(74);
        make.height.mas_equalTo(216);
    }];
    
    // titleLabel.
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView).offset(16);
        make.top.mas_equalTo(self.contentView).offset(14);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(20);
    }];

    // textView.
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(11);
        make.right.mas_equalTo(-11);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(5);
        make.bottom.mas_equalTo(0);
    }];

    // submitButton.
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(21);
        make.right.mas_equalTo(-21);
        make.top.mas_equalTo(self.contentView.mas_bottom).offset(20);
        make.height.mas_equalTo(50);
    }];
}

#pragma mark - UITextView Delegate methods

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (range.location >= 100) {
        return NO;
    }
    
    if ([text isEqualToString:@"\n"]) {
        if (textView.isFirstResponder) {
            [textView resignFirstResponder];
        }
        return NO;
    }
    
    NSMutableString *changedString = [[NSMutableString alloc] initWithString:textView.text];
    [changedString replaceCharactersInRange:range withString:text];
    
    if (changedString.length != 0) {
        if (!self.submitButton.isEnabled) {
            self.submitButton.enabled = YES;
        }
    } else {
        if (self.submitButton.isEnabled) {
            self.submitButton.enabled = NO;
        }
    }
    
    return YES;
}

@end


