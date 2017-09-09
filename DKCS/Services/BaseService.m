//
//  BaseService.m
//
//  Created by __End on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super init]) {
        self.provider = provider;
    }
    return self;
}
    
@end
