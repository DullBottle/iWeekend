//
//  UINavigationItem+Custom.m
//
//  Created by __End on 2017/4/26.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "UINavigationItem+Custom.h"

@implementation UINavigationItem (Custom)

- (UIBarButtonItem *)backBarButtonItem
{
    return [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
}

@end
