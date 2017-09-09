//
//  LoanSearchItem.h
//  DKCS
//
//  Created by __End on 2017/9/9.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseModel.h"

@interface LoanSearchItem : BaseModel

@property (nonatomic, strong) NSNumber *itemId;
@property (nonatomic, assign) LoanType feature;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *limit;
@property (nonatomic, copy) NSString *mediaUrl;
@property (nonatomic, copy) NSString *vistorUrl;

@end
