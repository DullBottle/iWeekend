//
//  MortgageOutputView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ShadowRootView.h"
#import "TabIndicatorView.h"
#import "FixedPaymentResultView.h"
#import "FixedBasisResultView.h"

@interface MortgageOutputView : ShadowRootView

@property (nonatomic, strong) TabIndicatorView *tabIndicator;
@property (nonatomic, strong) FixedPaymentResultView *fixedPaymentResultView;
@property (nonatomic, strong) FixedBasisResultView *fixedBasisResultView;

@end
