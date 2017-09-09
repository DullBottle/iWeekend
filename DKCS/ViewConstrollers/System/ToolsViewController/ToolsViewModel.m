//
//  ToolsViewModel.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ToolsViewModel.h"
#import "MortgageCalculateViewModel.h"
#import "HouseLoanCalculateViewModel.h"
#import "LoanRatesViewModel.h"
#import "HotQuestionViewModel.h"

@implementation ToolsViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Input.
        //
        self.didPresentDetailScreen = [self.presentDetailScreen map:^id _Nullable(NSIndexPath *indexPath) {
            if (indexPath.row == 0) {
                return [[MortgageCalculateViewModel alloc] initWithProvider:provider];
            } else if (indexPath.row == 1) {
                return [[HouseLoanCalculateViewModel alloc] initWithProvider:provider];
            } else if (indexPath.row == 2) {
                return [[LoanRatesViewModel alloc] initWithProvider:provider];
            } else if (indexPath.row == 3) {
                return [[HotQuestionViewModel alloc] initWithProvider:provider];
            }
            return nil;
        }];
        
        //
        // Output.
        //
        self.icons = @[ @"贷款计算", @"房贷计算", @"贷款利率", @"问题" ];
        self.items = @[ @"贷款计算", @"房贷计算", @"贷款利率", @"热门问题" ];
        
    }
    return self;
}

#pragma mark - setter & getter

- (RACSubject *)presentDetailScreen
{
    if (!_presentDetailScreen) {
        _presentDetailScreen = [RACSubject subject];
    }
    return _presentDetailScreen;
}

@end
