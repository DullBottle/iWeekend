//
//  NSAttributedString+BoundingRect.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "NSAttributedString+BoundingRect.h"
#import "ISSnap.h"

@implementation NSAttributedString (BoundingRect)

- (CGFloat)width
{
    CGSize constraintSize = CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX);
    return [self sizeToFits:constraintSize limitedToNumberOfLines:0].width;
}

- (CGFloat)heightThatFitsWidth:(CGFloat)width
{
    CGSize constraintSize = CGSizeMake(width, CGFLOAT_MAX);
    return [self sizeToFits:constraintSize limitedToNumberOfLines:0].height;
}

#pragma mark Private method

- (CGSize)sizeToFits:(CGSize)size limitedToNumberOfLines:(NSUInteger)lines
{
    CGSize s = [TTTAttributedLabel sizeThatFitsAttributedString:self withConstraints:size limitedToNumberOfLines:lines];
    return [ISSnap snapSize:s];
}

@end
