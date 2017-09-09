//
//  Question.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "Question.h"

@interface Question ()

@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) NSString *txtQuestion;

@end

@implementation Question

- (NSString *)question
{
    return [NSString stringWithFormat:@"%li.%@", self.index, self.txtQuestion];
}

+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{ @"questionId" : @"id",
              @"index": @"orderIndex",
              @"answer": @"txtAnswer" };
}

@end
