//
//  NetWorkManager.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "NetWorkManager.h"

@interface NetWorkManager()

@property (strong,nonatomic) AFNetworkReachabilityManager *reachabilityManager;

@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation NetWorkManager

+ (instancetype)sharedInstance {
    static NetWorkManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [NetWorkManager new];
    });
    return instance;
}

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
        _sessionManager.responseSerializer = [AFJSONResponseSerializer serializer];
        _sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        [_sessionManager.requestSerializer setValue:@"No-cache" forHTTPHeaderField:@"Pragma"];
        [_sessionManager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [_sessionManager.requestSerializer setValue:@"gzip" forHTTPHeaderField:@"Content-Encoding"];
        _sessionManager.requestSerializer.timeoutInterval = 45.f;
    }
    return _sessionManager;
}

- (NSString *)combineURL:(NSString *)path
{
    NSCParameterAssert(path);
    
#if DEBUG
    return [DKDevelopURL stringByAppendingString:path];
#else
    return [DKReleaseURL stringByAppendingString:path];
#endif
}

- (NSString *)transformToJSONString:(id)Object
{
    NSError *error = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:Object options:NSJSONWritingPrettyPrinted error:&error];
    
    if (error) {
        NSLog(@"id(Object) --> JSON String failed. (%@)", error.localizedDescription);
        return @"";
    }
    
    NSString *JSONString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return JSONString;
}

- (NSString *)commonDateFormatter
{
    return @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
}

@end


