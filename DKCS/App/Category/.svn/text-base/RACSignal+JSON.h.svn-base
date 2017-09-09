//
//  RACSignal+JSON.h
//
//  Created by __End on 2017/5/17.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import <ReactiveObjC/ReactiveObjC.h>

NS_ASSUME_NONNULL_BEGIN

@interface RACSignal (JSON)

- (RACSignal *)mapObject:(Class)cls;

- (RACSignal *)mapObject:(Class)cls withNode:(NSString * _Nullable)node;

- (RACSignal *)mapArray:(Class)cls;

- (RACSignal *)mapArray:(Class)cls withNode:(NSString * _Nullable)node;

- (RACSignal *)mapArrayWithNode:(NSString * _Nullable)node;

- (RACSignal *)mapDictionaryWithNode:(NSString * _Nullable)node;

- (RACSignal *)catchLocalServerError;

- (RACSignal *)onErrorJustReturn:(id _Nullable)obj;

@end

NS_ASSUME_NONNULL_END
