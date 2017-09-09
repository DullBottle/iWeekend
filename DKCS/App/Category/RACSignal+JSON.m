//
//  RACSignal+JSON.m
//
//  Created by __End on 2017/5/17.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "RACSignal+JSON.h"
#import <SVProgressHUD/SVProgressHUD.h>

NSInteger const JSONMapErrorCode = 0x6D;

@implementation RACSignal (Model)

- (RACSignal *)mapObject:(Class)cls
{
    return [self mapObject:cls withNode:nil];
}

- (RACSignal *)mapObject:(Class)cls withNode:(NSString *)node
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                NSError *err = (NSError *)x;
                [subscriber sendNext:err];
                [subscriber sendCompleted];
                return;
            }
            
            NSDictionary *JSON = (NSDictionary *)x;
            id object;
            if (node) {
                object = [cls yy_modelWithJSON:JSON[node]];
            } else {
                object = [cls yy_modelWithJSON:JSON];
            }
            if (object) {
                [subscriber sendNext:object];
                [subscriber sendCompleted];
            } else {
                NSError *error = [NSError errorWithDomain:RACSignalErrorDomain code:JSONMapErrorCode userInfo:@{ NSLocalizedDescriptionKey: @"JSON map -Object- error." }];
                [subscriber sendError:error];
            }
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)mapArray:(Class)cls
{
    return [self mapArray:cls withNode:nil];
}

- (RACSignal *)mapArray:(Class)cls withNode:(NSString *)node
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                NSError *err = (NSError *)x;
                [subscriber sendNext:err];
                [subscriber sendCompleted];
                return;
            }
            
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *list;
            if (node) {
                list = [NSArray yy_modelArrayWithClass:cls json:JSON[node]];
            } else {
                list = [NSArray yy_modelArrayWithClass:cls json:JSON];
            }
            if (list) {
                [subscriber sendNext:list];
                [subscriber sendCompleted];
            } else {
                NSError *error = [NSError errorWithDomain:RACSignalErrorDomain code:JSONMapErrorCode userInfo:@{ NSLocalizedDescriptionKey: @"JSON map -List- error." }];
                [subscriber sendError:error];
            }
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)mapDictionaryWithNode:(NSString *)node
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self subscribeNext:^(id  _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                NSError *err = (NSError *)x;
                [subscriber sendNext:err];
                [subscriber sendCompleted];
                return;
            }
            
            NSDictionary *JSON = (NSDictionary *)x;
            NSDictionary *list;
            if (node) {
                list = JSON[node];
            } else {
                list = @{ };
            }
            if (list) {
                [subscriber sendNext:list];
                [subscriber sendCompleted];
            } else {
                NSError *error = [NSError errorWithDomain:RACSignalErrorDomain code:JSONMapErrorCode userInfo:@{ NSLocalizedDescriptionKey: @"JSON map -List- error." }];
                [subscriber sendError:error];
            }
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)mapArrayWithNode:(NSString *)node
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self subscribeNext:^(id _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                NSError *err = (NSError *)x;
                [subscriber sendNext:err];
                [subscriber sendCompleted];
                return;
            }
            
            NSDictionary *JSON = (NSDictionary *)x;
            NSArray *list;
            if (node) {
                list = JSON[node];
            } else {
                list = @[];
            }
            if (list) {
                [subscriber sendNext:list];
                [subscriber sendCompleted];
            } else {
                NSError *error = [NSError errorWithDomain:RACSignalErrorDomain code:JSONMapErrorCode userInfo:@{ NSLocalizedDescriptionKey: @"JSON map -List- error." }];
                [subscriber sendNext:error];
                [subscriber sendCompleted];
            }
        } error:^(NSError * _Nullable error) {
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)catchLocalServerError
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        [self subscribeNext:^(id  _Nullable x) {
            RACTuple *tuple = (RACTuple *)x;
            NSString *message = tuple.first[@"msg"];
            NSInteger code = [tuple.first[@"status"] integerValue];
            if (code != 0) {
                NSError *error = [NSError errorWithDomain:RACSignalErrorDomain code:code userInfo:@{ NSLocalizedDescriptionKey: message }];
                NSLog(@"Local Server Error: [%li] - %@", code, message);
                [subscriber sendNext:error];
                [subscriber sendCompleted];
            } else {
                [subscriber sendNext:tuple.first];
                [subscriber sendCompleted];
            }
        } error:^(NSError * _Nullable error) {
            
            if ([SVProgressHUD isVisible]) {
                [SVProgressHUD dismiss];
            }
            
            if (error.code == -1001) {
                // Request time out.
                [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeNone];
                [SVProgressHUD setMinimumDismissTimeInterval:1.3f];
                [SVProgressHUD showImage:nil status:@"连接超时"];
            }
            
            [subscriber sendError:error];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

- (RACSignal *)onErrorJustReturn:(id)obj
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
       
        [self subscribeNext:^(id _Nullable x) {
            
            if ([x isKindOfClass:[NSError class]]) {
                [subscriber sendNext:obj];
                [subscriber sendCompleted];
                return;
            }
            
            [subscriber sendNext:x];
            [subscriber sendCompleted];
        }];
        
        return nil;
    }];
}

@end
