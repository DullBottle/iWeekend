//
//  AFNetworkActivityLogger.m
//
//  Created by __End on 16/9/27.
//  Copyright © 2016年 IIIidan Stormrage. All rights reserved.
//

#import "AFNetworkActivityLogger.h"
#import <AFNetworking/AFURLSessionManager.h>

#import <objc/runtime.h>

static NSURLRequest * AFNetworkRequestFromNotification(NSNotification *notification) {
    NSURLRequest *request = nil;
    if ([[notification object] respondsToSelector:@selector(originalRequest)]) {
        request = [[notification object] originalRequest];
    } else if ([[notification object] respondsToSelector:@selector(request)]) {
        request = [[notification object] request];
    }
    return request;
}

static NSError * AFNetworkErrorFromNotification(NSNotification *notification) {
    NSError *error = nil;
    if ([[notification object] isKindOfClass:[NSURLSessionTask class]]) {
        error = [(NSURLSessionTask *)[notification object] error];
        if (!error) {
            error = notification.userInfo[AFNetworkingTaskDidCompleteErrorKey];
        }
    }
    return error;
}

@implementation AFNetworkActivityLogger

+ (instancetype)sharedNetworkLogger
{
    static AFNetworkActivityLogger *_instance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    return _instance;
}

- (void)dealloc
{
    [self stopLogging];
}

- (instancetype)init
{
    if (self = [super init]) {
        
        self.level = AFNetworkLoggerLevelInfo;
    }
    return self;
}

- (void)startLogging
{
    [self stopLogging];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkTaskDidResume:)
                                                 name:AFNetworkingTaskDidResumeNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkTaskDidComplete:)
                                                 name:AFNetworkingTaskDidCompleteNotification object:nil];
    
}

- (void)stopLogging
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - NSNotification 

static void * AFNetworkRequestStartDate = &AFNetworkRequestStartDate;

- (void)networkTaskDidResume:(NSNotification *)notification
{
    NSURLRequest *request = AFNetworkRequestFromNotification(notification);
    
    // `request is nil` return.
    if (!request) return;
    
    objc_setAssociatedObject([notification object], AFNetworkRequestStartDate, [NSDate date], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    NSString *httpBody = nil;
    if ([request HTTPBody]) {
        httpBody = [[NSString alloc] initWithData:[request HTTPBody] encoding:NSUTF8StringEncoding];
    }
    
    switch (self.level) {
        case AFNetworkLoggerLevelDebug:
            NSLog(@"☘️ - %@ '%@': %@ %@", [request HTTPMethod], [[request URL] absoluteString], [request allHTTPHeaderFields], httpBody);
            break;
        case AFNetworkLoggerLevelInfo:
            NSLog(@"☘️ - %@ '%@'", [request HTTPMethod], [[request URL] absoluteString]);
            break;
        default:
            break;
    }
    
}

- (void)networkTaskDidComplete:(NSNotification *)notification
{
    NSURLRequest *request = AFNetworkRequestFromNotification(notification);
    NSURLResponse *response = [notification.object response];
    NSError *error = AFNetworkErrorFromNotification(notification);
    
    if (!request && !response) {
        return;
    }
    
    NSUInteger responseStatusCode = 0;
    NSDictionary *responseHeaderFields = nil;
    if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
        responseStatusCode = (NSUInteger)[(NSHTTPURLResponse *)response statusCode];
        responseHeaderFields = [(NSHTTPURLResponse *)response allHeaderFields];
    }
    
    id responseObject = nil;
    if ([[notification object] respondsToSelector:@selector(response)]) {
        responseObject = [[notification object] response];
    } else if (notification.userInfo) {
        responseObject = notification.userInfo[AFNetworkingTaskDidCompleteSerializedResponseKey];
    }
    
    NSTimeInterval elapsedTime = [[NSDate date] timeIntervalSinceDate:objc_getAssociatedObject(notification.object, AFNetworkRequestStartDate)];
    
    if (error) {
        switch (self.level) {
            case AFNetworkLoggerLevelDebug:
            case AFNetworkLoggerLevelInfo:
            case AFNetworkLoggerLevelWarn:
            case AFNetworkLoggerLevelError:
                NSLog(@"[❌Error] %@ '%@' (%ld) [%.04f s]: %@", [request HTTPMethod], [[response URL] absoluteString], (long)responseStatusCode, elapsedTime, error);
            default:
                break;
        }
    } else {
        switch (self.level) {
            case AFNetworkLoggerLevelDebug:
                NSLog(@"🦁 %ld '%@' [%.04f s]: %@ %@", (long)responseStatusCode, [[response URL] absoluteString], elapsedTime, responseHeaderFields, responseObject);
                break;
            case AFNetworkLoggerLevelInfo:
                NSLog(@"🦁 %ld '%@' [%.04f s]", (long)responseStatusCode, [[response URL] absoluteString], elapsedTime);
                break;
            default:
                break;
        }
    }

}

@end



