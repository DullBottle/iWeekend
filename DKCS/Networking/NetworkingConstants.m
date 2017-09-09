//
//  NetworkingConstants.m
//
//  Created by __End on 16/8/16.
//  Copyright © 2016年 IIIidan Stormrage. All rights reserved.
//
#import <Foundation/Foundation.h>

NSString * const DKDebugURL = @"http://192.168.0.12:9206/loanmarket-server";

NSString * const DKDevelopURL = @"http://192.168.0.12:9206/loanmarket-server";

NSString * const DKReleaseURL = @"http://192.168.0.12:9206/loanmarket-server";

#pragma mark - Account 账户

NSString * const AccountCellPhoneAuthCodeURL = @"/getVerifCode.service";
NSString * const LoginURL = @"/registerUser.service";

#pragma mark - Loan 贷款

NSString * const HomepageDataURL = @"/getItemContents.service";
NSString * const HomepageMarqueeURL = @"/getShoppingAlertMsg.service";
NSString * const LoanTypesURL = @"/getLoanTypes.service";
NSString * const LoanSearchURL = @"/getSearchGoods.service";
NSString * const LoanHotQuestionsURL = @"/getQas.service";

#pragma mark - System 系统

NSString * const FeedbackURL = @"/feedback.service";
NSString * const SystemParamsURL = @"/getSysParams.service";

