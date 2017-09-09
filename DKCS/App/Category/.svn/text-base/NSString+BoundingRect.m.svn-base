//
//  NSString+BoundingRect.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "NSString+BoundingRect.h"
#import "ISSnap.h"

@implementation NSString (BoundingRect)

- (CGFloat)widthWithFont:(UIFont *)font maximumNumberOfLines:(NSUInteger)lines
{
    CGSize s = [self sizeThatFitsWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) font:font maximumNumberOfLines:lines];
    return s.width;
}

- (CGFloat)heightThatFitsWithWidth:(CGFloat)width font:(UIFont *)font maximumNumberOfLines:(NSUInteger)lines
{
    CGSize s = [self sizeThatFitsWithSize:CGSizeMake(width, CGFLOAT_MAX) font:font maximumNumberOfLines:lines];
    return s.height;
}

#pragma mark Private methods

- (CGRect)boundingRectWithSize:(CGSize)size attributes:(NSDictionary *)attributes
{
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [self boundingRectWithSize:size options:options attributes:attributes context:nil];
    return  [ISSnap snapRect:rect];
}

- (CGSize)sizeThatFitsWithSize:(CGSize)size font:(UIFont *)font maximumNumberOfLines:(NSUInteger)lines
{
    NSDictionary *attributes = @{ NSFontAttributeName: font };
    CGSize s = [self boundingRectWithSize:size attributes:attributes].size;
    if (lines > 0) {
        size.height = MIN(size.height, (CGFloat)lines * font.lineHeight);
    }
    return s;
}

@end
