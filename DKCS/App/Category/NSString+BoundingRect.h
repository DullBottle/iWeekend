//
//  NSString+BoundingRect.h
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSString (BoundingRect)

- (CGFloat)widthWithFont:(UIFont *)font maximumNumberOfLines:(NSUInteger)lines;

- (CGFloat)heightThatFitsWithWidth:(CGFloat)width font:(UIFont *)font maximumNumberOfLines:(NSUInteger)lines;

@end
