//
//  StubResponse.m
//
//  Created by __End on 2017/5/29.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "StubResponse.h"

@implementation StubResponse

+ (RACSignal *)load:(NSString *)fileName
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"json"];
        if (path) {
            NSData *JSONData = [NSData dataWithContentsOfFile:path];
            NSError *error = nil;
            id JSON = [NSJSONSerialization JSONObjectWithData:JSONData options:(NSJSONReadingMutableContainers) error:&error];
            if (!error) {
                [subscriber sendNext:RACTuplePack(JSON, nil)];
                [subscriber sendCompleted];
            } else {
                NSLog(@"JSON Serialization Error: %@", error.localizedDescription);
            }
        }
        
        return nil;
    }];
}

@end
