//
//  CombineOutputView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ShadowRootView.h"
#import "TabIndicatorView.h"
#import "CombinationFixedPaymentView.h"
#import "CombinationFixedBasisView.h"

@interface CombinationOutputView : ShadowRootView

@property (nonatomic, strong) TabIndicatorView *tabIndicator;
@property (nonatomic, strong) CombinationFixedPaymentView *fixedPaymentResultView;
@property (nonatomic, strong) CombinationFixedBasisView *fixedBasisResultView;

@end
