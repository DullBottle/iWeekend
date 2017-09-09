//
//  SearchViewModel.h
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface SearchViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) NSNumber *typeId;
@property (nonatomic, strong) NSNumber *amountId;
@property (nonatomic, strong) NSNumber *limitId;
@property (nonatomic, strong) RACSubject *queryLoanTypes;
@property (nonatomic, strong) RACSubject *queryLoanAmounts;
@property (nonatomic, strong) RACSubject *queryLoanLimits;
@property (nonatomic, strong) RACSubject *refresh;
@property (nonatomic, strong) RACSubject *presentDetailScreen;

//
// Output.
//
@property (nonatomic, copy) NSArray *types;
@property (nonatomic, copy) NSArray *amounts;
@property (nonatomic, copy) NSArray *limits;
@property (nonatomic, copy) NSArray *loans;
@property (nonatomic, strong) RACSignal *didQueryTypes;
@property (nonatomic, strong) RACSignal *didQueryAmounts;
@property (nonatomic, strong) RACSignal *didQueryLimits;
@property (nonatomic, strong) RACSignal *didRefresh;
@property (nonatomic, strong) RACSignal *didPresentDetailScreen;

@end
