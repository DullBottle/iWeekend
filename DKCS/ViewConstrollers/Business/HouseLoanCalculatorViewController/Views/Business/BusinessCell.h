//
//  BusinessCell.h
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessInputView.h"
#import "BusinessOutputView.h"

@interface BusinessInputCell : UICollectionViewCell

@property (nonatomic, strong) BusinessInputView *inputView;

+ (CGSize)size:(CGFloat)width;

@end

@interface BusinessOutputCell : UICollectionViewCell

@property (nonatomic, strong) BusinessOutputView *outputView;

+ (CGSize)size:(CGFloat)width;

@end
