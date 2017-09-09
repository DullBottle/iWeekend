//
//  Question.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseModel.h"

//
// 热门问题
//

//{
//    "createTime": 1503318560906,
//    "id": 5,
//    "orderIndex": 5,
//    "sts": 1,
//    "txtAnswer": "射雕，弯铁弓，万世声威震南北西东。伟绩，丰功，男儿到此是不是英雄？",
//    "txtQuestion": "是不是英雄"
//},

@interface Question : BaseModel

@property (nonatomic, strong) NSNumber *questionId;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *answer;

@end
