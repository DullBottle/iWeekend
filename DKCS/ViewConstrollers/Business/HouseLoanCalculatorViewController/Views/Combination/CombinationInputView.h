//
//  CombinationInputView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InputView.h"
#import "InputPickerView.h"

@interface CombinationInputView : UIView

@property (nonatomic, strong) InputPickerView *loanPeriodInputView;

@property (nonatomic, strong) InputView *businessLoanInputView;
@property (nonatomic, strong) InputPickerView *businessAnnualRatesInputView;

@property (nonatomic, strong) InputView *providentFundLoanInputView;
@property (nonatomic, strong) InputPickerView *providentFundAnnualRatesInputView;

@end
