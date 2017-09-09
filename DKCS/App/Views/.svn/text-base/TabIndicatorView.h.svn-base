//
//  TabIndicatorView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// 贷款、房贷计算器上的Tab导航条
//
@protocol TabIndicatorViewDelegate;

@interface TabIndicatorView : UIView

@property (nonatomic, weak) id<TabIndicatorViewDelegate> delegate;

- (void)setIndicatorOffsetWithIndex:(NSUInteger)index;

@end

@protocol TabIndicatorViewDelegate <NSObject>

- (NSArray<NSString *> *)tabIndicatorTitles;

@optional
- (CGFloat)widthForTabIndicator;
- (void)tabIndicatorView:(TabIndicatorView *)tabIndicatorView didSelectedAtIndex:(NSUInteger)index;

@end

