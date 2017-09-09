//
//  BaseModel.h
//
//  Created by __End on 2017/4/20.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//
// 时间戳 --> 格式化字符串.
//
- (NSString *)timestamp_2_datetime_string:(NSInteger)timestamp formatter:(NSString *)formatter;

//
// 时间戳 --> `几分钟前` 等自然语言的时间描述字符串.
//
//- (NSString *)timestamp_2_date_description_of_natural_language:(NSInteger)timestamp;

@end
