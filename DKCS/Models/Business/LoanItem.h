//
//  LoanItem.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseModel.h"

//
// 贷款产品Item.
//

//    "goodsInfo": {
//        "applyCount": 65,
//        "createTime": 1501155970763,
//        "goodsFeatures": "放款快",
//        "goodsSummary": "测试测试测试",
//        "id": 2,
//        "interestMoney": "0.002%",
//        "loanLimitMoneyBegin": 5000,
//        "loanLimitMoneyEnd": 3000,
//        "loanTermBegin": 30,
//        "loanTermEnd": 50,
//        "loanTypeList": "12",
//        "makeLoanTime": "2个工作日",
//        "mediaPools": [
//                       {
//                           "createTime": 1502443033691,
//                           "id": 30,
//                           "mediaType": 1,
//                           "mediaUrl": "http://ou3tf6ov1.bkt.clouddn.com//20170811/Z7HoHTeW-3.jpg",
//                           "showPos": 1,
//                           "sts": 1,
//                           "targetId": 2,
//                           "targetType": 3
//                       }
//                       ],
//        "orderIndex": 1,
//        "shieldDitches": "b00005",
//        "sts": 1,
//        "txtDescription": "id-2简单贷",
//        "txtName": "简单贷",
//        "txtTag": "3",
//        "txtTitle": "嘿嘿嘿",
//        "vistorCount": 542,
//        "vistorType": 2,
//        "vistorUrl": "https://jie.gomemyf.com/jie-h5/html/activity/flow-register-b.html?vendor=haoxk&fromSource=haoxk2"
//    },
//    "itemContentType": 3

@interface LoanItem : BaseModel

@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, assign) LoanType feature;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *limit;
@property (nonatomic, copy) NSString *mediaUrl;
@property (nonatomic, copy) NSString *vistorUrl;

@end





