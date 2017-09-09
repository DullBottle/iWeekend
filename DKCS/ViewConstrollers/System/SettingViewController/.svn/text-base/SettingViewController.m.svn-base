//
//  SettingViewController.m
//  DKCS
//
//  Created by __End on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SettingViewController.h"
#import <FCAlertView/FCAlertView.h>
#import "AboutUsViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SettingViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *logoutButton;

@property (nonatomic, strong) UILabel *versionLabel;
@property (nonatomic, strong) UIButton *updateButton;

@end

@implementation SettingViewController

#pragma mark - setter & getter 

- (UILabel *)versionLabel
{
    if (!_versionLabel) {
        _versionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _versionLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
        NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
        NSString *version = [infoDic objectForKey:@"CFBundleShortVersionString"];
        _versionLabel.text = [NSString stringWithFormat:@"V%@", version];
        _versionLabel.textColor = [UIColor colorWithHexString:@"#666666"];
    }
    return _versionLabel;
}

- (UIButton *)updateButton
{
    if (!_updateButton) {
        _updateButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [_updateButton setTitle:@"升级" forState:UIControlStateNormal];
        [_updateButton setTitleColor:[UIColor colorWithHexString:@"#999999"] forState:UIControlStateNormal];
        _updateButton.layer.borderWidth = 1.f;
        _updateButton.layer.borderColor = [UIColor colorWithHexString:@"#999999"].CGColor;
        _updateButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:13.f];
    }
    return _updateButton;
}

- (instancetype)initWithViewModel:(SettingViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.scrollEnabled = NO;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        self.tableView.rowHeight = 50.f;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
        
        UserManager *user = [UserManager standardManager];
        if (user.isLogin) {
            CGFloat w = [UIScreen mainScreen].bounds.size.width;
            UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 70)];
            footerView.backgroundColor = [UIColor clearColor];
            
            // logoutButton.
            self.logoutButton = [UIButton buttonWithType:UIButtonTypeSystem];
            self.logoutButton.backgroundColor = [UIColor whiteColor];
            self.logoutButton.frame = CGRectMake(0, 10, w, 50);
            self.logoutButton.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
            [self.logoutButton setTitle:@"退出登录" forState:UIControlStateNormal];
            [self.logoutButton setTitleColor:[UIColor colorWithHexString:@"#FF4E33"] forState:UIControlStateNormal];
            
            [footerView addSubview:self.logoutButton];
            
            self.tableView.tableFooterView = footerView;
        }
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.tableView];
}

- (void)configure:(SettingViewModel *)viewModel
{
    //
    // Input.
    //
    
    //
    // Output.
    //
    UserManager *user = [UserManager standardManager];
    if (user.isLogin) {
        @weakify(self);
        [[self.logoutButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
            
            @strongify(self);
            FCAlertView *alert = [[FCAlertView alloc] init];
            alert.cornerRadius = 6.f;
            alert.dismissOnOutsideTouch = YES;
            alert.titleFont = [UIFont fontWithName:@"PingFangSC-Semibold" size:16.f];
            alert.titleColor = [UIColor colorWithHexString:@"#333333"];
            alert.subtitleFont = [UIFont fontWithName:kCommonFont size:14.f];
            alert.subTitleColor = [UIColor colorWithHexString:@"#333333"];
            [alert addButton:@"取消" withActionBlock:^{
                
            }];
            alert.doneBlock = ^{
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:nil forKey:kUserMobile];
                [defaults setObject:@NO forKey:kUserIsLogin];
                [defaults synchronize];
                
                [UserManager standardManager].login = nil;
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[AppDelegate shared] reloadRootViewController];
                });
            };
            alert.firstButtonCustomFont = [UIFont fontWithName:kCommonFont size:16.f];
            alert.firstButtonTitleColor = [UIColor colorWithHexString:@"#333333"];
            alert.doneButtonCustomFont = [UIFont fontWithName:kCommonFont size:16.f];
            alert.doneButtonTitleColor = [UIColor colorWithHexString:@"#FF4E33"];
            [alert showAlertInView:self withTitle:@"温馨提示" withSubtitle:@"是否退出当前账号?" withCustomImage:nil withDoneButtonTitle:@"退出" andButtons:nil];
        }];
    }
    
    [viewModel.didPresentDetailScreen subscribeNext:^(id  _Nullable x) {
        AboutUsViewController *viewController = [[AboutUsViewController alloc] init];
        viewController.title = @"关于我们";
        [self.navigationController pushViewController:viewController animated:YES];
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
    
    // tableView.
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(74);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView methods.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([UITableViewCell class])];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSString *text = self.viewModel.data[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
    cell.textLabel.text = text;
    
    
    if (indexPath.row == 0) {
        // bottom line.
        UIView *bottomLine = [[UIView alloc] initWithFrame:CGRectZero];
        bottomLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        [cell addSubview:bottomLine];
        
        [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.bottom.mas_equalTo(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [cell addSubview:self.versionLabel];
        
//        [self.updateButton mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.mas_equalTo(cell.mas_centerY);
//            make.right.mas_equalTo(-20);
//            make.width.mas_equalTo(50);
//            make.height.mas_equalTo(24);
//        }];
        
        [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(cell.mas_centerY);
            make.right.mas_equalTo(-20);
            make.width.mas_equalTo(40);
            make.height.mas_equalTo(20);
        }];
    }
    
    if (indexPath.row == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if ([cell.textLabel.text isEqualToString:@"关于我们"]) {
        [self.viewModel.presentDetailScreen sendNext:nil];
    }
}

@end














