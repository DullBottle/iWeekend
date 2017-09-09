//
//  ToolsViewModel.h
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "BaseViewModel.h"

@interface ToolsViewModel : BaseViewModel

//
// Input.
//
@property (nonatomic, strong) RACSubject *presentDetailScreen;

//
// Output.
//
@property (nonatomic, copy) NSArray *icons;
@property (nonatomic, copy) NSArray *items;
@property (nonatomic, strong) RACSignal *didPresentDetailScreen;

@end
