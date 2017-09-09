//
//  SearchFilterDropDownView.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SearchFilterDropDownView.h"
#import "SearchFilterCell.h"
#import "LoanTypeItem.h"

@interface SearchFilterDropDownView () <UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation SearchFilterDropDownView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        _data = @[];
        
        // collectionView.
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.minimumInteritemSpacing = 0.f;
        layout.minimumLineSpacing = 0.f;
        layout.itemSize = CGSizeMake(w / 3.0, 54);
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.collectionView.backgroundColor = [UIColor whiteColor];
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.showsVerticalScrollIndicator = NO;
        [self.collectionView registerClass:[SearchFilterCell class] forCellWithReuseIdentifier:NSStringFromClass([SearchFilterCell class])];
        [self addSubview:self.collectionView];
        
        [self setupConstraintss];
    }
    return self;
}

- (CGFloat)heightForView
{
    NSUInteger row = ceil(self.data.count / 3.0);
    return row * 54.f;
}

#pragma mark - UICollectionView deleagte & dataSource.

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SearchFilterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([SearchFilterCell class]) forIndexPath:indexPath];
    
    if (indexPath.row == 0) {
        cell.selected = YES;
    } else {
        cell.selected = NO;
    }
    
    LoanTypeItem *item = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = [collectionView visibleCells];
    SearchFilterCell *cell = (SearchFilterCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cells enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SearchFilterCell *cellObj = (SearchFilterCell *)obj;
        if ([cellObj isEqual:cell]) {
            cellObj.selected = YES;
        } else {
            cellObj.selected = NO;
        }
    }];
    
    LoanTypeItem *item = [self.data objectAtIndex:indexPath.row];
    if (self.didSelectedCellBlock) {
        self.didSelectedCellBlock(item);
    }
}

- (void)setupConstraintss
{
    // collectionView.
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

@end






