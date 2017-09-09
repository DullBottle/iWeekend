//
//  AFNetworkActivityLogger.h
//
//  Created by __End on 16/9/27.
//  Copyright © 2016年 IIIidan Stormrage. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, AFNetworkLoggerLevel) {
    AFNetworkLoggerLevelOff = 0,
    AFNetworkLoggerLevelDebug,
    AFNetworkLoggerLevelInfo,
    AFNetworkLoggerLevelWarn,
    AFNetworkLoggerLevelError,
    AFNetworkLoggerLevelFatal = AFNetworkLoggerLevelOff,
};

/// support `AFNetworking 3.0`.
/// for AFN2.0, check https://github.com/AFNetworking/AFNetworkActivityLogger
@interface AFNetworkActivityLogger : NSObject

@property (nonatomic, assign) AFNetworkLoggerLevel level;           // `AFNetworkLoggerLevelInfo` by default.

+ (instancetype)sharedNetworkLogger;

- (void)startLogging;

- (void)stopLogging;

@end
