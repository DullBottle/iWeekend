//
//  ServiceProvider.h
//
//  Created by __End on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetWorkManager.h"
@class AccountService;
@class LoanService;
@class SystemService;

@protocol ServiceProviderType <NSObject>

@property (nonatomic, readonly, strong) NetWorkManager *networkManager;
@property (nonatomic, readonly, strong) AccountService *accountService;
@property (nonatomic, readonly, strong) LoanService *loanService;
@property (nonatomic, readonly, strong) SystemService *systemService;

@end

@interface ServiceProvider : NSObject <ServiceProviderType>

@property (nonatomic, readonly, strong) NetWorkManager *networkManager;
@property (nonatomic, readonly, strong) AccountService *accountService;
@property (nonatomic, readonly, strong) LoanService *loanService;
@property (nonatomic, readonly, strong) SystemService *systemService;

@end
