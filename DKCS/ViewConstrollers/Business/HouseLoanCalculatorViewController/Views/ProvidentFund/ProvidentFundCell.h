//
//  ProvidentFundCell.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProvidentFundInputView.h"
#import "ProvidentFundOutputView.h"

@interface ProvidentFundInputCell : UICollectionViewCell

@property (nonatomic, strong) ProvidentFundInputView *inputView;

+ (CGSize)size:(CGFloat)width;

@end

@interface ProvidentFundOutputCell : UICollectionViewCell

@property (nonatomic, strong) ProvidentFundOutputView *outputView;

+ (CGSize)size:(CGFloat)width;

@end
