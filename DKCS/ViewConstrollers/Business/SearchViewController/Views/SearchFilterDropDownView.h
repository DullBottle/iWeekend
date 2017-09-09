//
//  SearchFilterDropDownView.h
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchFilterCell.h"
@class LoanTypeItem;

typedef void(^search_filter_dropDown_selected_block_t)(LoanTypeItem *);

@interface SearchFilterDropDownView : UIView

- (CGFloat)heightForView;

@property (nonatomic, copy) NSArray *data;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy) search_filter_dropDown_selected_block_t didSelectedCellBlock;

@end
