//
//  NetWorkManager.h
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 Ettwit. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager+RACSupport.h"

@interface NetWorkManager : NSObject

@property (nonatomic, readonly, strong) AFHTTPSessionManager *sessionManager;

+ (instancetype)sharedInstance;

- (NSString *)combineURL:(NSString *)path;

- (NSString *)transformToJSONString:(id)Object;

- (NSString *)commonDateFormatter;

@end
