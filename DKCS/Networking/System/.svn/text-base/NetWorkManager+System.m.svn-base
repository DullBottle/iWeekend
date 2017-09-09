//
//  NetWorkManager+System.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "NetWorkManager+System.h"

@implementation NetWorkManager (System)

- (RACSignal *)feedbackWithContent:(NSString *)content
{
    NSString *path = [self combineURL:FeedbackURL];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *UUID = [defaults objectForKey:kApplicationUUID];
    NSString *mobile = [defaults objectForKey:kUserMobile];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDic objectForKey:@"CFBundleShortVersionString"];
    version = [NSString stringWithFormat:@"V%@", version];
    
    NSDictionary *params = @{ @"mobile": mobile,
                              @"uuid": UUID,
                              @"txtContent": content,
                              @"versionNo": version };
    
    return [self.sessionManager rac_GET:path parameters:params];
}

- (RACSignal *)systemParmas
{
    NSString *path = [self combineURL:SystemParamsURL];
    
    return [self.sessionManager rac_GET:path parameters:nil];
}

@end













