//
//  HomepageHeaderView.m
//  DKCS
//
//  Created by __End on 2017/9/1.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HomepageHeaderView.h"
#import "LoanTypeCell.h"
#import "LoanLimitCell.h"
#import "LoanAmountItem.h"

@interface HomepageHeaderView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) HomepageViewModel *viewModel;

@property (nonatomic, strong) UIView *statusBarView;
@property (nonatomic, strong) UIView *marqueeRootView;
@property (nonatomic, strong) UIImageView *marqueeIcon;
@property (nonatomic, strong) UIImageView *arrowIcon;

@end

static NSUInteger Loan_Type_Tag = 918;
static NSUInteger Loan_Limit_Tag = 109;

@implementation HomepageHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        
        // iCarousel.
        self.iCarousel = [SDCycleScrollView cycleScrollViewWithFrame:CGRectZero imageURLStringsGroup:@[]];
        self.iCarousel.autoScrollTimeInterval = 3.5f;
        self.iCarousel.backgroundColor = [UIColor whiteColor];
        self.iCarousel.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.iCarousel];
        
        // MarqueeView.
        {
            self.marqueeRootView = [[UIView alloc] initWithFrame:CGRectZero];
            self.marqueeRootView.backgroundColor = [UIColor whiteColor];
            [self addSubview:self.marqueeRootView];
            
            // marqueeIcon.
            self.marqueeIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.marqueeIcon.image = [UIImage imageNamed:@"通知"];
            [self.marqueeRootView addSubview:self.marqueeIcon];
            
            // iMarquee.
            self.iMarquee = [[MarqueeView alloc] initWithFrame:CGRectZero];
            self.iMarquee.textColor = [UIColor colorWithHexString:@"#666666"];
            self.iMarquee.font = [UIFont fontWithName:kCommonFont size:12.f];
            [self.marqueeRootView addSubview:self.iMarquee];
            
            // arrowIcon.
            self.arrowIcon = [[UIImageView alloc] initWithFrame:CGRectZero];
            self.arrowIcon.image = [UIImage imageNamed:@"翻页箭头"];
            [self.marqueeRootView addSubview:self.arrowIcon];
        }
        
        // LoanTypeCollectionView.
        {
            CGFloat w = [UIScreen mainScreen].bounds.size.width;
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
            layout.sectionInset = UIEdgeInsetsMake(0, 25, 0, 25);
            layout.minimumInteritemSpacing = 0.f;
            layout.minimumLineSpacing = 0.f;
            layout.itemSize = CGSizeMake((w - 50) / 3.0, 75);
            layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
            self.loanTypeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
            self.loanTypeCollectionView.tag = Loan_Type_Tag;
            self.loanTypeCollectionView.delegate = self;
            self.loanTypeCollectionView.dataSource = self;
            self.loanTypeCollectionView.backgroundColor = [UIColor whiteColor];
            self.loanTypeCollectionView.showsHorizontalScrollIndicator = NO;
            [self.loanTypeCollectionView registerClass:[LoanTypeCell class] forCellWithReuseIdentifier:NSStringFromClass([LoanTypeCell class])];
            [self addSubview:self.loanTypeCollectionView];
        }
        
        [self setupConstraints];
    }
    return self;
}

- (void)configure:(HomepageViewModel *)viewModel
{
    self.viewModel = viewModel;
    
    [self.loanTypeCollectionView reloadData];
}

- (void)setupConstraints
{
    // iCarousel.
    [self.iCarousel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(20);
        make.height.mas_equalTo(179);
    }];
    
    {
        // marqueeRootView.
        [self.marqueeRootView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.iCarousel.mas_bottom).offset(0);
            make.height.mas_equalTo(40);
        }];
        
        // marqueeIcon.
        [self.marqueeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.top.mas_equalTo(10);
            make.width.height.mas_equalTo(20);
        }];
        
        // iMarquee.
        [self.iMarquee mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.marqueeIcon.mas_right).offset(10);
            make.right.mas_equalTo(-10);
            make.centerY.mas_equalTo(self.marqueeIcon.mas_centerY);
            make.height.mas_equalTo(30);
        }];
        
        // arrowIcon.
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-14);
            make.centerY.mas_equalTo(self.marqueeIcon.mas_centerY);
            make.width.height.mas_equalTo(12);
        }];
    }
    
    // loanTypeCollectionView.
    {
        [self.loanTypeCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.marqueeRootView.mas_bottom).offset(10);
            make.height.mas_equalTo(150);
        }];
    }
}

#pragma mark - UICollectionView deleagte & dataSource.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.types.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LoanTypeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LoanTypeCell class]) forIndexPath:indexPath];
    
    NSString *text = [self.viewModel.types objectAtIndex:indexPath.row];
    NSString *icon = [self.viewModel.typeIcons objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    cell.iconView.image = [UIImage imageNamed:icon];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end


