//
//  BaseModel.m
//
//  Created by __End on 2017/4/20.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "BaseModel.h"

@interface BaseModel ()

@end

@implementation BaseModel

- (NSString *)timestamp_2_datetime_string:(NSInteger)timestamp formatter:(NSString *)formatter
{
    return [[NSDate dateWithTimeIntervalSince1970:timestamp] formattedDateWithFormat:formatter];
}

//- (NSString *)timestamp_2_date_description_of_natural_language:(NSInteger)timestamp
//{
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
//    
//    if ([self isInOneHour:date]) {
//        // 1小时之内
//        NSDate *now = [NSDate date];
//        double off = [now minutesFrom:date];
//        off = (int)fabs(off);
//        if (off > 0) {
//            return [NSString localizedStringWithFormat:@"MINS_AGO".localized, (int)off];
//        }
//        return @"JUST_NOW".localized;
//    }
//    if ([date isToday]) {
//        // 今天
//        if (date.hour >= 0 && date.hour < 6) {
//            // 凌晨
//            return [date formattedDateWithFormat:@"TODAY_WEE_HOURS".localized];
//        } else if (date.hour >= 6 && date.hour < 13) {
//            // 上午
//            return [date formattedDateWithFormat:@"TODAY_AM".localized];
//        } else if (date.hour >= 13 && date.hour < 19) {
//            // 下午
//            NSDate *d = [date dateBySubtractingHours:12];
//            return [d formattedDateWithFormat:@"TODAY_PM".localized];
//        } else if (date.hour >= 19 && date.hour <= 23) {
//            // 晚上
//            NSDate *d = [date dateBySubtractingHours:12];
//            return [d formattedDateWithFormat:@"TODAY_TONIGHT".localized];
//        }
//    }
//    if ([date isYesterday]) {
//        //  昨天
//        if (date.hour >= 0 && date.hour < 6) {
//            // 凌晨
//            return [date formattedDateWithFormat:@"YESTODAY_WEE_HOURS".localized];
//        } else if (date.hour >= 6 && date.hour < 13) {
//            // 上午
//            return [date formattedDateWithFormat:@"YESTODAY_AM".localized];
//        } else if (date.hour >= 13 && date.hour < 19) {
//            // 下午
//            NSDate *d = [date dateBySubtractingHours:12];
//            return [d formattedDateWithFormat:@"YESTODAY_PM".localized];
//        } else if (date.hour >= 19 && date.hour <= 23) {
//            // 晚上
//            NSDate *d = [date dateBySubtractingHours:12];
//            return [d formattedDateWithFormat:@"YESTODAY_TONIGHT".localized];
//        }
//    }
//    
//    // 其它情况
//    if (date.hour >= 0 && date.hour < 6) {
//        // 凌晨
//        return [date formattedDateWithFormat:@"OTHER_WEE_HOURS".localized];
//    } else if (date.hour >= 6 && date.hour < 13) {
//        // 上午
//        return [date formattedDateWithFormat:@"OTHER_AM".localized];
//    } else if (date.hour >= 13 && date.hour < 19) {
//        // 下午
//        NSDate *d = [date dateBySubtractingHours:12];
//        return [d formattedDateWithFormat:@"OTHER_PM".localized];
//    } else if (date.hour >= 19 && date.hour <= 23) {
//        // 晚上
//        NSDate *d = [date dateBySubtractingHours:12];
//        return [d formattedDateWithFormat:@"OTHER_TONIGHT".localized];
//    }
//    
//    return @"";
//}

#pragma mark - Private help methods

- (BOOL)isInOneHour:(NSDate *)date
{
    NSDate *now = [NSDate date];
    double off = [now minutesFrom:date];
    if (off >= 0 && off < 60) {
        return YES;
    }
    return NO;
}

@end
