//
//  HomepageHeaderView.h
//  DKCS
//
//  Created by __End on 2017/9/1.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomepageViewModel.h"
#import <SDCycleScrollView/SDCycleScrollView.h>
#import "MarqueeView.h"

@interface HomepageHeaderView : UIView

@property (nonatomic, strong) SDCycleScrollView *iCarousel;                         // 轮播图
@property (nonatomic, strong) MarqueeView *iMarquee;                                // 跑马灯
@property (nonatomic, strong) UICollectionView *loanTypeCollectionView;             // 贷款类型视图

- (void)configure:(HomepageViewModel *)viewModel;

@end
