//
//  TapTap.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^taptap_tap_block_t)();

@interface TapTap : UIView

@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, copy) NSString *result;

@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, copy) taptap_tap_block_t tap;

@end
