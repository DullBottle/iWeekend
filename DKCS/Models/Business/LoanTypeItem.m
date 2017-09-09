//
//  LoanTypeItem.m
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "LoanTypeItem.h"

@implementation LoanTypeItem

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"itemId" : @"id",
              @"name": @"typeName" };
}

@end
