//
//  UITextField+TextFieldDidDeleteBackwardNotification.h
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const IIITextFieldDidDeleteBackwardNotification;

@protocol IIITextFieldDelegate <NSObject>

@optional
- (void)textFieldDidDeleteBackward:(UITextField *)textField;

@end

@interface UITextField (TextFieldDidDeleteBackwardNotification)

@property (nonatomic, weak) id<IIITextFieldDelegate> delegate;

@end
