//
//  MarqueeItem.h
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseModel.h"

//
// 首页跑马灯item
//

//{
//    "goodsId": 12,
//    "msg": "182****3924在学生贷成功借款6500元",
//    "txtTitle": "只贷给学生，尤其是女学生",
//    "vistorUrl": "http://www.studentloan.cn/fsgeg"
//}

@interface MarqueeItem : BaseModel

@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, copy) NSString *message;
@property (nonatomic, copy) NSString *vistorUrl;

@end
