//
//  AuthCodeLabel.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "AuthCodeLabel.h"

@implementation AuthCodeLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        self.userInteractionEnabled = YES;
        
        self.layer.borderWidth = 1.f;
        self.layer.borderColor = [UIColor colorWithHexString:@"#666666"].CGColor;
        self.layer.cornerRadius = 2.f;
        self.clipsToBounds = YES;
        self.font = [UIFont fontWithName:kCommonFont size:21.f];
        self.textColor = [UIColor colorWithHexString:@"#666666"];
        self.textAlignment = NSTextAlignmentCenter;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

#pragma makr - Tap action

- (void)tap:(UITapGestureRecognizer *)sender
{
    if (self.tap) {
        self.tap(self);
    }
}

@end
