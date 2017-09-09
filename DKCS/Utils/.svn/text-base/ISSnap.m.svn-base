//
//  ISSnap.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "ISSnap.h"

@implementation ISSnap

+ (CGPoint)snapPoint:(CGPoint)point
{
    return CGPointMake([self snap:point.x], [self snap:point.y]);
}

+ (CGSize)snapSize:(CGSize)size
{
    return CGSizeMake([self snap:size.width], [self snap:size.height]);
}

+ (CGRect)snapRect:(CGRect)rect
{
    return CGRectMake([self snap:rect.origin.x], [self snap:rect.origin.y], [self snap:rect.size.width], [self snap:rect.size.height]);
}

#pragma mark - Private method

+ (CGFloat)snap:(CGFloat)x
{
    CGFloat scale = [UIScreen mainScreen].scale;
    return ceil(x * scale) / scale;
}

@end
