//
//  HotQuestionViewModel.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface HotQuestionViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) RACSubject *refresh;

//
// Output.
//
@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, strong) RACSignal *didRefresh;

@end
