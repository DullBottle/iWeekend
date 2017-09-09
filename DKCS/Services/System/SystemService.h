//
//  SystemService.h
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseService.h"

//
// 系统相关操作
//
@interface SystemService : BaseService

// 意见反馈
- (RACSignal *)feedback:(NSString *)content;

// 获取系统参数（咨询QQ之类）
- (RACSignal *)systemParams;

@end
