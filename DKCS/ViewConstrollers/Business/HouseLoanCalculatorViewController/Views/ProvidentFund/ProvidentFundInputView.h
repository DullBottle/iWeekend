//
//  ProvidentFundInputView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ShadowRootView.h"
#import "InputView.h"
#import "InputPickerView.h"

@interface ProvidentFundInputView : ShadowRootView

//
// 金额视图
//
@property (nonatomic, strong) InputView *totalPriceInputView;
@property (nonatomic, strong) TapTap *firstPayTapTap;
@property (nonatomic, strong) InputView *firstPaymentsInputView;
@property (nonatomic, strong) InputPickerView *loanPeriodPickerView;
@property (nonatomic, strong) InputPickerView *loanAnnualRatePickerView;

//
// 面积视图
//
@property (nonatomic, strong) UITextField *areaTextField;
@property (nonatomic, strong) InputView *totalAreaInputView;
@property (nonatomic, strong) TapTap *firstAreaPayTapTap;
@property (nonatomic, strong) InputView *firstAreaPaymentsInputView;
@property (nonatomic, strong) InputPickerView *loanAreaPeriodPickerView;
@property (nonatomic, strong) InputPickerView *loanAreaAnnualRatePickerView;

@end
