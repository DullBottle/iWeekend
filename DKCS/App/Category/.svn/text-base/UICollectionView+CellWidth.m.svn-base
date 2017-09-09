//
//  UICollectionView+CellWidth.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "UICollectionView+CellWidth.h"
@import ManualLayout;

@implementation UICollectionView (CellWidth)

- (CGFloat)cellWidthForSectionAt:(NSInteger)section
{
    CGFloat width = self.width;
    width -= self.contentInset.left;
    width -= self.contentInset.right;
    
    if ([self conformsToProtocol:@protocol(UICollectionViewDelegateFlowLayout)]) {
        id<UICollectionViewDelegateFlowLayout> delegate = (id<UICollectionViewDelegateFlowLayout>)self.delegate;
        UIEdgeInsets insets = [delegate collectionView:self layout:self.collectionViewLayout insetForSectionAtIndex:section];
        width -= insets.left;
        width -= insets.right;
    } else if (self.collectionViewLayout) {
        UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)self.collectionViewLayout;
        width -= flowLayout.sectionInset.left;
        width -= flowLayout.sectionInset.right;
    }
    
    return width;
}

@end
