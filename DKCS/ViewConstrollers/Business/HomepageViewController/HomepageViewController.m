//
//  HomepageViewController.m
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HomepageViewController.h"
#import "RedPacketBanner.h"
#import "HomepageHeaderView.h"
#import "LoanCell.h"
#import "LoanItem.h"

@interface HomepageViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) HomepageViewModel *viewModel;

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) HomepageHeaderView *headerView;

@end

@implementation HomepageViewController

- (instancetype)initWithViewModel:(HomepageViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // headerView.
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        self.headerView = [[HomepageHeaderView alloc] initWithFrame:CGRectMake(0, 0, w, 420)];
        
        // tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        self.tableView.rowHeight = 80.f;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[LoanCell class] forCellReuseIdentifier:NSStringFromClass([LoanCell class])];
        
        self.tableView.tableHeaderView = self.headerView;
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    // statusBarView.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    statusBarView.backgroundColor = [UIColor colorWithHexString:@"#333333"];
    [self.view addSubview:statusBarView];
    
    RedPacketBanner *banner = [[RedPacketBanner alloc] initWithFrame:CGRectMake(0, 0, width, 50)];
    [self.navigationController.navigationBar addSubview:banner];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor clearColor]];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}

- (void)configure:(HomepageViewModel *)viewModel
{
    [self.headerView configure:viewModel];
    
    @weakify(self);
    //
    // Input.
    //
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        [viewModel.refresh sendNext:nil];
        [viewModel.refreshMarquee sendNext:nil];
    }];
    
    //
    // Output.
    //
    [viewModel.didRefresh subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }
        
        RACTuple *tuple = (RACTuple *)x;
        
        // bannerList.
        viewModel.bannerList = tuple.first;
        self.headerView.iCarousel.imageURLStringsGroup = [viewModel.bannerList valueForKeyPath:@"@unionOfObjects.mediaUrl"];
        [self.headerView.iCarousel reloadInputViews];
        
        // loanList.
        viewModel.loanList = tuple.third;
        [self.tableView reloadData];
    }];
    
    [viewModel.didRefreshMarquee subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }

        viewModel.maruqees = (NSArray *)x;
        [self.headerView.iMarquee running:[viewModel.maruqees valueForKeyPath:@"@unionOfObjects.message"]];
    }];
}

- (void)setupConstraints
{
    // tableView.
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(-64);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - UITableView methods.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.loanList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoanCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LoanCell class])];
    
    if (cell == nil) {
        cell = [[LoanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LoanCell class])];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    LoanItem *item = [self.viewModel.loanList objectAtIndex:indexPath.row];
    
    cell.titleLabel.text = item.title;
    cell.nameLabel.text = item.name;
    [cell.loanLimitLabel setText:item.limit afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
        NSRange range = [[mutableAttributedString string] rangeOfString:@"额度：" options:NSCaseInsensitiveSearch];
        [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:[UIColor colorWithHexString:@"#333333"] range:range];
        return mutableAttributedString;
    }];
    [cell setLoanType:item.feature];
    [cell.thumbnailView sd_setImageWithURL:[NSURL URLWithString:item.mediaUrl]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end



















