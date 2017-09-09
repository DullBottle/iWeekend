//
//  MineViewController.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MineViewController.h"

// viewModel & viewController.
#import "ConsultingViewModel.h"
#import "ConsultingViewController.h"
#import "FeedbackViewModel.h"
#import "FeedbackViewController.h"
#import "SettingViewModel.h"
#import "SettingViewController.h"
#import "LoginViewModel.h"
#import "LoginViewController.h"

// views.
#import "MineHeaderView.h"

@interface MineViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) MineViewModel *viewModel;

@property (nonatomic, strong) MineHeaderView *mineHeaderView;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MineViewController

- (instancetype)initWithViewModel:(MineViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // mineHeaderView.
        self.mineHeaderView = [[MineHeaderView alloc] initWithFrame:CGRectZero];
        
        // tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.scrollEnabled = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        self.tableView.rowHeight = 50.f;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UserManager *userManager = [UserManager standardManager];
    
    if (userManager.isLogin) {
        NSString *mobile = [userManager.mobile stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
        [self.mineHeaderView.accountButton setTitle:mobile forState:UIControlStateNormal];
        self.mineHeaderView.accountButton.enabled = NO;
    } else {
        [self.mineHeaderView.accountButton setTitle:@"立即登陆" forState:UIControlStateNormal];
    }
    
    [self.view addSubview:self.mineHeaderView];
    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
}

- (void)configure:(MineViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self.mineHeaderView.accountButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [viewModel.presentLoginScreen sendNext:nil];
    }];
    
    //
    // Output.
    //
    [viewModel.didPresentDetailScreen subscribeNext:^(id viewModel) {
        
        @strongify(self);
        UIViewController *viewController = nil;
        
        if ([viewModel isKindOfClass:[ConsultingViewModel class]]) {
            
            viewController = [[ConsultingViewController alloc] initWithViewModel:viewModel];
            viewController.title = @"贷款咨询";
            
        } else if ([viewModel isKindOfClass:[FeedbackViewModel class]]) {
            
            viewController = [[FeedbackViewController alloc] initWithViewModel:viewModel];
            viewController.title = @"意见反馈";
            
        } else if ([viewModel isKindOfClass:[SettingViewModel class]]) {
            
            viewController = [[SettingViewController alloc] initWithViewModel:viewModel];
            viewController.title = @"设置";
        }
        
        if (viewController) {
            viewController.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
            viewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:viewController animated:YES];
        }
    }];
    
    [viewModel.didPresentLoginScreen subscribeNext:^(id viewModel) {
        @strongify(self);
        LoginViewController *viewController = [[LoginViewController alloc] initWithViewModel:viewModel];
        viewController.title = @"登录";
        viewController.view.backgroundColor = [UIColor whiteColor];
        viewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:viewController animated:YES];
    }];
    
}

- (void)setupConstraints
{
    // mineHeaderView.
    [self.mineHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(179);
    }];
    
    // tableView.
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.mineHeaderView.mas_bottom).offset(20);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView methods.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.informations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDictionary *information = [self.viewModel.informations objectAtIndex:indexPath.row];
    
    // bottom line.
    UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
    bottomLine.backgroundColor = [UIColor colorWithHexString:@"#E0E0E0"];
    [cell addSubview:bottomLine];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(0.5);
    }];
    
    NSString *text = information[@"title"];
    NSString *icon = information[@"icon"];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
    cell.textLabel.text = text;
    cell.imageView.image = [UIImage imageNamed:icon];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [self.viewModel.presentDetailScreen sendNext:cell.textLabel.text];
}

@end










