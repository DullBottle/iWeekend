//
//  BaseService.h
//
//  Created by __End on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ServiceProvider.h"
#import "RACSignal+JSON.h"

@interface BaseService : NSObject

@property (nonatomic, weak) id<ServiceProviderType> provider;
    
- (instancetype)initWithProvider:(id<ServiceProviderType>)provider;
    
@end
