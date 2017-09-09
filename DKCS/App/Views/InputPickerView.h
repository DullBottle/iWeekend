//
//  InputPickerView.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TapTap.h"

//
// 计算器选择视图
//
@interface InputPickerView : UIView

@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *result;

@property (nonatomic, strong) UILabel *textLabel;

@end
