//
//  LoanTypeItem.h
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseModel.h"

//
// 贷款类型item
//

//{
//    "classType": 2,
//    "createTime": 1501826917169,
//    "id": 9,
//    "loanLimitMoneyBegin": 0,
//    "loanLimitMoneyEnd": 3000,
//    "orderIndex": 1,
//    "showPos": 0,
//    "sts": 1,
//    "typeName": "3000以下"
//}

@interface LoanTypeItem : BaseModel

@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, copy) NSString *name;

@end
