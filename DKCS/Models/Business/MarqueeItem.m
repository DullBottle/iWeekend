//
//  MarqueeItem.m
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MarqueeItem.h"

@implementation MarqueeItem

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"itemId" : @"goodsId",
              @"message": @"msg" };
}


@end
