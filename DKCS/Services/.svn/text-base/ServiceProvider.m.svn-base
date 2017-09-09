//
//  ServiceProvider.m
//
//  Created by __End on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "ServiceProvider.h"
#import "AccountService.h"
#import "LoanService.h"
#import "SystemService.h"

@interface ServiceProvider ()

@property (nonatomic, strong) NetWorkManager *networkManager;
@property (nonatomic, strong) AccountService *accountService;
@property (nonatomic, strong) LoanService *loanService;
@property (nonatomic, strong) SystemService *systemService;

@end

@implementation ServiceProvider

- (NetWorkManager *)networkManager
{
    if (!_networkManager) {
        _networkManager = [NetWorkManager sharedInstance];
    }
    return _networkManager;
}

- (AccountService *)accountService
{
    if (!_accountService) {
        _accountService = [[AccountService alloc] initWithProvider:self];
    }
    return _accountService;
}

- (LoanService *)loanService
{
    if (!_loanService) {
        _loanService = [[LoanService alloc] initWithProvider:self];
    }
    return _loanService;
}

- (SystemService *)systemService
{
    if (!_systemService) {
        _systemService = [[SystemService alloc] initWithProvider:self];
    }
    return _systemService;
}

@end
