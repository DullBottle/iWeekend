//
//  NSAttributedString+BoundingRect.h
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (BoundingRect)

@property (nonatomic, readonly, assign) CGFloat width;

- (CGFloat)heightThatFitsWidth:(CGFloat)width;

@end
