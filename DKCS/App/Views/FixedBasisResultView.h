//
//  FixedBasisResultView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputView.h"

//
// 计算`等额本金`结果视图
//
@interface FixedBasisResultView : UIView

@property (nonatomic, strong) InputView *firstMonthRepaymentView;          // 首月还款额
@property (nonatomic, strong) InputView *monthDeclineView;                 // 逐月递减
@property (nonatomic, strong) InputView *totalInterestPaidView;            // 支付利息总额
@property (nonatomic, strong) InputView *totalDueAmountView;               // 还款总额

@end
