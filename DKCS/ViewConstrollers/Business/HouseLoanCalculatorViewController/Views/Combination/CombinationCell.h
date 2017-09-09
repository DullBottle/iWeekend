//
//  CombinationCell.h
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CombinationInputView.h"
#import "CombinationOutputView.h"

@interface CombinationInputCell : UICollectionViewCell

@property (nonatomic, strong) CombinationInputView *inputView;

+ (CGSize)size:(CGFloat)width;

@end

@interface CombinationOutputCell : UICollectionViewCell

@property (nonatomic, strong) CombinationOutputView *outputView;

+ (CGSize)size:(CGFloat)width;

@end
