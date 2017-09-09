//
//  LoginViewController.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginAuthCodeViewModel.h"
#import "LoginAuthCodeViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) LoginView *loginView;

@end

@implementation LoginViewController

- (instancetype)initWithViewModel:(LoginViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // LoginView.
        self.loginView = [[LoginView alloc] initWithFrame:CGRectZero];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.loginView];
}

- (void)configure:(LoginViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self.loginView.nextButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        if (self.loginView.textField.isFirstResponder) {
            [self.loginView.textField resignFirstResponder];
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [viewModel.presentLoginAuthCodeScreen sendNext:nil];
        });
    }];
    
    //
    // Output.
    //
    [viewModel.didPresentLoginAuthCodeScreen subscribeNext:^(id viewModel) {
        @strongify(self);
        LoginAuthCodeViewModel *vm = (LoginAuthCodeViewModel *)viewModel;
        vm.mobile = self.loginView.textField.text;
        LoginAuthCodeViewController *viewController = [[LoginAuthCodeViewController alloc] initWithViewModel:vm];
        viewController.title = @"登录";
        viewController.view.backgroundColor = [UIColor whiteColor];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }];
}

- (void)setupConstraints
{
    [super setupConstraints];
    
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(65);
        make.height.mas_equalTo(320);
    }];
}

@end

























