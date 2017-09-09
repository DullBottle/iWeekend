//
//  SystemService.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SystemService.h"
#import "NetWorkManager+System.h"

@implementation SystemService

- (RACSignal *)feedback:(NSString *)content
{
    RACSignal *signal = [self.provider.networkManager feedbackWithContent:content];
    
    return [signal catchLocalServerError];
}

- (RACSignal *)systemParams
{
    RACSignal *signal = [self.provider.networkManager systemParmas];
    
    return [signal catchLocalServerError];
}

@end
