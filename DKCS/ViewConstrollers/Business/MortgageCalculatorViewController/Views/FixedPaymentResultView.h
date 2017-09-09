//
//  FixedPaymentResultView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputView.h"

//
// 计算`等额本息`结果视图
//
@interface FixedPaymentResultView : UIView

@property (nonatomic, strong) InputView *monthlyRepaymentView;          // 月还款额
@property (nonatomic, strong) InputView *payInterestSumView;            // 支付利息总和
@property (nonatomic, strong) InputView *totalDueAmountView;            // 还款总额

@end
