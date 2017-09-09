//
//  ToolsViewController.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ToolsViewController.h"
#import "ToolCell.h"

// viewModel & viewController.
#import "MortgageCalculateViewModel.h"
#import "MortgageCalculateController.h"
#import "HouseLoanCalculateViewModel.h"
#import "HouseLoanCalculateController.h"
#import "LoanRatesViewModel.h"
#import "LoanRatesViewController.h"
#import "HotQuestionViewModel.h"
#import "HotQuestionViewController.h"

@interface ToolsViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) ToolsViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ToolsViewController

- (instancetype)initWithViewModel:(ToolsViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // collectionView.
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.itemSize = CGSizeMake(w / 2.0, w / 2.0);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        [self.collectionView registerClass:[ToolCell class] forCellWithReuseIdentifier:NSStringFromClass([ToolCell class])];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
 
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.collectionView];
}

- (void)configure:(ToolsViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    
    //
    // Output.
    //
    [viewModel.didPresentDetailScreen subscribeNext:^(id viewModel) {
        @strongify(self);
        UIViewController *viewController = nil;
        
        if ([viewModel isKindOfClass:[MortgageCalculateViewModel class]]) {
            
            viewController = [[MortgageCalculateController alloc] initWithViewModel:viewModel];
            viewController.title = @"贷款计算器";
            
        } else if ([viewModel isKindOfClass:[HouseLoanCalculateViewModel class]]) {
            
            viewController = [[HouseLoanCalculateController alloc] initWithViewModel:viewModel];
            viewController.title = @"房贷计算器";
        } else if ([viewModel isKindOfClass:[LoanRatesViewModel class]]) {
            
            viewController = [[LoanRatesViewController alloc] initWithViewModel:viewModel];
            viewController.title = @"贷款利率";
        } else if ([viewModel isKindOfClass:[HotQuestionViewModel class]]) {
            
            viewController = [[HotQuestionViewController alloc] initWithViewModel:viewModel];
            viewController.title = @"热门问题";
        }
        
        if (viewController) {
            viewController.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
            viewController.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:viewController animated:YES];
        }
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

    // CollectionView.
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(65, 0, 0, 0));
    }];
}

#pragma mark - UICollectionView deleagte & dataSource.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ToolCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ToolCell class]) forIndexPath:indexPath];
    
    NSString *icon = [self.viewModel.icons objectAtIndex:indexPath.row];
    NSString *text = [self.viewModel.items objectAtIndex:indexPath.row];
    cell.iconView.image = [UIImage imageNamed:icon];
    cell.textLabel.text = text;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.viewModel.presentDetailScreen sendNext:indexPath];
}

@end






