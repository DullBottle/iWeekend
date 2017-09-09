//
//  LoanAmountItem.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanAmountItem.h"

@implementation LoanAmountItem

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"itemId" : @"itemInfo.id",
              @"name" : @"itemInfo.itemName" };
}

@end
