//
//  LoanRatesViewModel.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface LoanRatesViewModel : BaseViewModel

//
// Input.
//

//
// Output.
//
@property (nonatomic, copy) NSArray *businessRates;
@property (nonatomic, copy) NSArray *providentFundRates;

@end
