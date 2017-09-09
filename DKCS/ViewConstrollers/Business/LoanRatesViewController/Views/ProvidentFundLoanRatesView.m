//
//  ProvidentFundLoanRatesView.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ProvidentFundLoanRatesView.h"
#import "LoanRatesCell.h"
#import "ShadowRootView.h"

@interface ProvidentFundLoanRatesView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) LoanRatesViewModel *viewModel;

@property (nonatomic, strong) ShadowRootView *shadowRootView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UILabel *reminderLabelOne;
@property (nonatomic, strong) UILabel *reminderLabelTwo;

@end

@implementation ProvidentFundLoanRatesView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // shadowRootView.
        self.shadowRootView = [[ShadowRootView alloc] initWithFrame:CGRectZero];
        [self addSubview:self.shadowRootView];
        
        // collectionView.
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 40) / 3.f;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.itemSize = CGSizeMake(width, 35);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        [self.collectionView registerClass:[LoanRatesCell class] forCellWithReuseIdentifier:NSStringFromClass([LoanRatesCell class])];
        [self.shadowRootView addSubview:self.collectionView];
        
        // reminderLabelOne.
        self.reminderLabelOne = [[UILabel alloc] initWithFrame:CGRectZero];
        self.reminderLabelOne.numberOfLines = 1;
        self.reminderLabelOne.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.reminderLabelOne.textColor = [UIColor colorWithHexString:@"#333333"];
        self.reminderLabelOne.text = @"1.最新利率更新时间为2015年8月26日。";
        [self addSubview:self.reminderLabelOne];
        
        // reminderLabelTwo.
        self.reminderLabelTwo = [[UILabel alloc] initWithFrame:CGRectZero];
        self.reminderLabelTwo.numberOfLines = 2;
        self.reminderLabelTwo.font = [UIFont fontWithName:kCommonFont size:12.f];
        self.reminderLabelTwo.textColor = [UIColor colorWithHexString:@"#333333"];
        self.reminderLabelTwo.text = @"2.以上为央行公布的贷款基准利率，房贷、车贷以此为基准上浮或下调。消费、经营贷款各银行利率差异很大。";
        [self addSubview:self.reminderLabelTwo];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    // shadowRootView.
    [self.shadowRootView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(315);
    }];
    
    // collectionView.
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    // reminderLabelOne.
    [self.reminderLabelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(36);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.shadowRootView.mas_bottom).offset(20);
        make.height.mas_equalTo(17);
    }];
    
    // reminderLabelTwo.
    [self.reminderLabelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(36);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(self.reminderLabelOne.mas_bottom).offset(12);
        make.height.mas_equalTo(34);
    }];
    
}

- (void)configure:(LoanRatesViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    [self.collectionView reloadData];
}

#pragma mark - UICollectionView deleagte & dataSource.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.providentFundRates.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LoanRatesCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LoanRatesCell class]) forIndexPath:indexPath];
    
    NSString *text = [self.viewModel.providentFundRates objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    
    return cell;
}

@end





