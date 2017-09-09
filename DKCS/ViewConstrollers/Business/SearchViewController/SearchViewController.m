//
//  SearchViewController.m
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchFilterDropDownView.h"
#import "LoanCell.h"
#import "LoanSearchItem.h"
#import "LoanTypeItem.h"
#import "AdvertorialViewController.h"

@import YNDropDownMenu;

@interface SearchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) SearchViewModel *viewModel;
@property (nonatomic, copy) NSArray *dropDownViews;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) YNDropDownMenu *dropDownMenu;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation SearchViewController

- (instancetype)initWithViewModel:(SearchViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // DropDownMenu.
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        NSMutableArray *arr = [NSMutableArray array];
        for (NSInteger i = 0; i < 3; i++ ) {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, w, 108)];
            view.backgroundColor = [UIColor whiteColor];
            [arr addObject:view];
            view = nil;
        }
        
        self.dropDownViews = arr;
        
        self.dropDownMenu = [[YNDropDownMenu alloc] initWithFrame:CGRectMake(0, 65, w, 40)
                                                    dropDownViews:self.dropDownViews
                                               dropDownViewTitles:@[ @"所有贷款类型", @"金额不限", @"期限不限" ]];
        [self.dropDownMenu setLabelWithFont:[UIFont fontWithName:kCommonFont size:12.f]];
        UIColor *color = [UIColor colorWithHexString:@"#333333"];
        [self.dropDownMenu setLabelColorWhenNormal:color selected:color disabled:color];
        [self.dropDownMenu setImageWhenNormal:[UIImage imageNamed:@"下拉箭头"] selected:[UIImage imageNamed:@"下拉箭头"] disabled:nil];
        self.dropDownMenu.backgroundBlurEnabled = YES;
        
        UIView *backgroundView = [UIView new];
        backgroundView.backgroundColor = [UIColor blackColor];
        self.dropDownMenu.blurEffectView = backgroundView;
        self.dropDownMenu.blurEffectViewAlpha = 0.7f;
        
//        for (SearchFilterDropDownView *view in self.dropDownViews) {
//            @weakify(self);
//            NSUInteger index = [self.dropDownViews indexOfObject:view];
//            view.didSelectedCellBlock = ^(SearchFilterCell *cell) {
//                @strongify(self);
//                [self.dropDownMenu changeMenuWithTitle:cell.textLabel.text at:index];
//                [self.dropDownMenu hideMenu];
//            };
//        }
        
        // tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        self.tableView.rowHeight = 80.f;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[LoanCell class] forCellReuseIdentifier:NSStringFromClass([LoanCell class])];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.dropDownMenu];
    [self.view addSubview:self.tableView];
    
    [self.view bringSubviewToFront:self.dropDownMenu];
}

- (void)configure:(SearchViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        [viewModel.refresh sendNext:nil];
        [viewModel.queryLoanTypes sendNext:nil];
        [viewModel.queryLoanAmounts sendNext:nil];
        [viewModel.queryLoanLimits sendNext:nil];
    }];
    
    //
    // Output.
    //
    [viewModel.didRefresh subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            return;
        }
        
        viewModel.loans = (NSArray *)x;
        [self.tableView reloadData];
    }];
    
    // queryLoanTypes.
    [viewModel.didQueryTypes subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            return;
        }
        
        LoanTypeItem *item = [LoanTypeItem new];
        item.name = @"类型不限";
        item.itemId = nil;
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray:(NSArray *)x];
        [arr insertObject:item atIndex:0];
        viewModel.types = arr;
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        SearchFilterDropDownView *view = [[SearchFilterDropDownView alloc] init];
        view.data = viewModel.types;
        view.frame = CGRectMake(0, 0, w, view.heightForView);
        view.backgroundColor = [UIColor whiteColor];
        [view.collectionView reloadData];
        view.didSelectedCellBlock = ^(LoanTypeItem *item) {
            [self.dropDownMenu changeMenuWithTitle:item.name at:0];
            [self.dropDownMenu hideMenu];
            viewModel.typeId = item.itemId;
            [viewModel.refresh sendNext:nil];
        };
        [self.dropDownMenu changeViewWithView:view at:0];
    }];
    
    // queryLoanAmounts.
    [viewModel.didQueryAmounts subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            return;
        }
        
        LoanTypeItem *item = [LoanTypeItem new];
        item.name = @"金额不限";
        item.itemId = nil;
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray:(NSArray *)x];
        [arr insertObject:item atIndex:0];
        viewModel.amounts = arr;

        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        SearchFilterDropDownView *view = [[SearchFilterDropDownView alloc] init];
        view.data = viewModel.amounts;
        view.frame = CGRectMake(0, 0, w, view.heightForView);
        view.backgroundColor = [UIColor whiteColor];
        [view.collectionView reloadData];
        view.didSelectedCellBlock = ^(LoanTypeItem *item) {
            [self.dropDownMenu changeMenuWithTitle:item.name at:1];
            [self.dropDownMenu hideMenu];
            viewModel.amountId = item.itemId;
            [viewModel.refresh sendNext:nil];
        };
        [self.dropDownMenu changeViewWithView:view at:1];
    }];
    
    // queryLoanLimits.
    [viewModel.didQueryLimits subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            return;
        }
        
        LoanTypeItem *item = [LoanTypeItem new];
        item.name = @"期限不限";
        item.itemId = nil;
        
        NSMutableArray *arr = [NSMutableArray arrayWithArray:(NSArray *)x];
        [arr insertObject:item atIndex:0];
        viewModel.limits = arr;
        
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        SearchFilterDropDownView *view = [[SearchFilterDropDownView alloc] init];
        view.data = viewModel.limits;
        view.frame = CGRectMake(0, 0, w, view.heightForView);
        view.backgroundColor = [UIColor whiteColor];
        [view.collectionView reloadData];
        view.didSelectedCellBlock = ^(LoanTypeItem *item) {
            [self.dropDownMenu changeMenuWithTitle:item.name at:2];
            [self.dropDownMenu hideMenu];
            viewModel.limitId = item.itemId;
            [viewModel.refresh sendNext:nil];
        };
        [self.dropDownMenu changeViewWithView:view at:2];
    }];
    
    [viewModel.didPresentDetailScreen subscribeNext:^(LoanSearchItem *item) {
        AdvertorialViewController *viewController = [[AdvertorialViewController alloc] initWithLink:item.vistorUrl];
        viewController.title = item.name;
        viewController.hidesBottomBarWhenPushed = YES;
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
        make.top.mas_equalTo(115);
        make.bottom.mas_equalTo(-49);
    }];
}

#pragma mark - UITableView methods.

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.loans.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoanCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LoanCell class])];
    
    if (cell == nil) {
        cell = [[LoanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LoanCell class])];
    }
    cell.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    LoanSearchItem *item = [self.viewModel.loans objectAtIndex:indexPath.row];
    
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
    LoanSearchItem *item = [self.viewModel.loans objectAtIndex:indexPath.row];
    [self.viewModel.presentDetailScreen sendNext:item];
}

@end
