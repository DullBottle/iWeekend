//
//  LoanService.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseService.h"

//
// 贷款相关业务
//

NS_ASSUME_NONNULL_BEGIN

@interface LoanService : BaseService

// 首页查询数据（包括轮播图、贷款价格类型、热门贷款item）
- (RACSignal *)homepageData:(NSNumber * _Nullable)page;

// 首页跑马灯数据
- (RACSignal *)marqueeData;

// 搜索页贷款类型items
- (RACSignal *)loanTypeItems:(NSUInteger)type;

// 搜索某类型的贷款商品
- (RACSignal *)searchLoans:(NSNumber * _Nullable)type amount:(NSNumber * _Nullable)amount limit:(NSNumber * _Nullable)limit;

// 贷款热门问题
- (RACSignal *)hotQuestions:(NSNumber * _Nullable)page;

@end

NS_ASSUME_NONNULL_END
