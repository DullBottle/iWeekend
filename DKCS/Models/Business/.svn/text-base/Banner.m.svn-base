//
//  Banner.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "Banner.h"

@implementation Banner

- (BOOL)modelCustomTransformFromDictionary:(NSDictionary *)dic
{
    NSArray *mediaPools = dic[@"mediaPools"];
    if (!mediaPools) { return NO; }
    
    NSDictionary *mediaPool = mediaPools.firstObject;
    _mediaUrl = mediaPool[@"mediaUrl"];
    
    return YES;
}

@end
