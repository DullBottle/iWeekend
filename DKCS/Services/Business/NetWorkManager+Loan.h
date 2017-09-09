//
//  NetWorkManager+Loan.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "NetWorkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager (Loan)

// 首页查询数据（包括轮播图、贷款价格类型、热门贷款item）
- (RACSignal *)getHomepageDataWithPage:(NSNumber * _Nullable)page;

// 首页跑马灯数据
- (RACSignal *)getHomepageMarqueeData;

// 查询搜索页贷款类型
- (RACSignal *)getLoanItemsWithType:(NSUInteger)type;           // 1按需求，2按金额，3按期限

// 根据条件搜索商品
- (RACSignal *)searchLoanItemsWithType:(NSNumber * _Nullable)type amount:(NSNumber * _Nullable)amount limit:(NSNumber * _Nullable)limit;

// 热门问题
- (RACSignal *)getHotQuestionsWithPage:(NSNumber * _Nullable)page;

@end

NS_ASSUME_NONNULL_END
