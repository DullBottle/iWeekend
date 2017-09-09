//
//  CombinationCalculateView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "CombinationCalculateView.h"
#import "UICollectionView+CellWidth.h"

@interface CombinationCalculateView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation CombinationCalculateView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // collectionView.
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        self.collectionView.showsVerticalScrollIndicator = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        [self.collectionView registerClass:[CombinationInputCell class] forCellWithReuseIdentifier:NSStringFromClass([CombinationInputCell class])];
        [self.collectionView registerClass:[CombinationOutputCell class] forCellWithReuseIdentifier:NSStringFromClass([CombinationOutputCell class])];
        [self addSubview:self.collectionView];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

#pragma mark - UICollectionView methods

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [collectionView cellWidthForSectionAt:0];
    if (indexPath.item == 0) {
        return [CombinationInputCell size:width];
    } else if (indexPath.item == 1) {
        return [CombinationOutputCell size:width];
    }
    
    return CGSizeZero;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 0: {
            
            CombinationInputCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CombinationInputCell class])
                                                                                forIndexPath:indexPath];
            //            [cell configure:self.viewModel];
            return cell;
            
        } break;
        case 1: {
            
            CombinationOutputCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([CombinationOutputCell class])
                                                                                 forIndexPath:indexPath];
            //            [cell configure:self.viewModel];
            return cell;
            
        } break;
        default:
            break;
    }
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"" forIndexPath:indexPath];
    
    return cell;
}

@end

