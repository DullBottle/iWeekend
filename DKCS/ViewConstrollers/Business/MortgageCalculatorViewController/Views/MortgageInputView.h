//
//  MortgageInputView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ShadowRootView.h"
#import "InputView.h"
#import "InputPickerView.h"

@interface MortgageInputView : ShadowRootView

@property (nonatomic, strong) InputView *loanSumInputView;
@property (nonatomic, strong) InputPickerView *loanPeriodInputView;
@property (nonatomic, strong) InputView *loanAnnualRateInputView;

@end
