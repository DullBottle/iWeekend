//
//  HomepageViewModel.h
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomepageViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) RACSubject *refresh;
@property (nonatomic, strong) RACSubject *refreshMarquee;

//
// Output.
//
@property (nonatomic, copy) NSArray *typeIcons;
@property (nonatomic, copy) NSArray *types;
@property (nonatomic, copy) NSArray *bannerList;                    // 首页轮播array.
@property (nonatomic, copy) NSArray *loanAmountList;                // 首页贷款金额分类array.
@property (nonatomic, copy) NSArray *loanList;                      // 首页贷款产品array.
@property (nonatomic, copy) NSArray *maruqees;                      // 首页跑马灯array.
@property (nonatomic, strong) RACSignal *didRefresh;
@property (nonatomic, strong) RACSignal *didRefreshMarquee;

@end
