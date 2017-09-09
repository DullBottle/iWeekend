//
//  ShadowRootView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ShadowRootView.h"

@implementation ShadowRootView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        self.clipsToBounds = NO;
        self.layer.cornerRadius = 4.f;
        self.layer.shadowColor = [UIColor colorWithHexString:@"#CCCCCC"].CGColor;
        self.layer.shadowRadius = 3.5f;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity = 0.7f;
    }
    return self;
}

@end
