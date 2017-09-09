//
//  UIViewController+SVP.m
//
//  Created by __End on 2017/5/23.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "UIViewController+SVP.h"

@interface UIViewController ()

@end

@implementation UIViewController (SVP)

- (void)showLoading
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD show];
}

- (void)showLoading:(NSString *)message
{
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleCustom];
    [SVProgressHUD showWithStatus:message];
}

- (void)showMessage:(NSString *)message
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
    [SVProgressHUD setMinimumDismissTimeInterval:1.3f];
    [SVProgressHUD showImage:nil status:message];
}

- (void)dismissHUD
{
    if ([SVProgressHUD isVisible]) {
        [SVProgressHUD dismiss];
    }
}

@end


