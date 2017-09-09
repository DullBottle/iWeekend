//
//  RedPacketBanner.h
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>

//
// 首页顶部红包广告横幅试图
//

@interface RedPacketBanner : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailTitleLabel;
@property (nonatomic, strong) UIButton *cancelButton;

@end
