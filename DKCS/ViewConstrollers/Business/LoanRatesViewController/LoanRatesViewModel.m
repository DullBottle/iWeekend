//
//  LoanRatesViewModel.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanRatesViewModel.h"

@implementation LoanRatesViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        
        
        //
        // Output.
        //
        self.businessRates = @[ @"",        @"<=1年", @"1-5年", @">5年",
                                @"基准利率", @"4.35%", @"4.75%", @"4.9%",
                                @"8.5折",   @"3.70%", @"4.04%", @"4.16%",
                                @"8.8折",   @"3.83%", @"4.18%", @"4.31%",
                                @"9.0折",   @"3.92%", @"4.28%", @"4.41%",
                                @"9.5折",   @"4.13%", @"4.51%", @"4.66%",
                                @"1.05倍",  @"4.57%", @"4.99%", @"5.14%",
                                @"1.1倍",   @"4.78%", @"5.22%", @"5.39%",
                                @"1.2倍",   @"5.22%", @"5.70%", @"5.88%" ];
        
        self.providentFundRates = @[ @"",        @"<=5年", @">5年",
                                     @"基准利率", @"2.75%", @"3.25%",
                                     @"8.5折",   @"2.34%", @"2.76%",
                                     @"8.8折",   @"2.42%", @"2.86%",
                                     @"9.0折",   @"2.48%", @"2.92%",
                                     @"9.5折",   @"2.61%", @"3.09%",
                                     @"1.05倍",  @"2.89%", @"3.41%",
                                     @"1.1倍",   @"3.02%", @"3.58%",
                                     @"1.2倍",   @"3.30%", @"3.90%" ];
        
    }
    return self;
}

@end















