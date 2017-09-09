//
//  UITextField+TextFieldDidDeleteBackwardNotification.m
//  DKCS
//
//  Created by __End on 2017/9/5.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "UITextField+TextFieldDidDeleteBackwardNotification.h"
#import <objc/runtime.h>

NSString * const IIITextFieldDidDeleteBackwardNotification = @"com.Sooying.textField.deleteBackward.Notification";

@implementation UITextField (TextFieldDidDeleteBackwardNotification)

+ (void)load
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        Class class = [self class];
        
        SEL originalSelector = @selector(deleteBackward);
        SEL swizzledSelector = @selector(iii_deleteBackward);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)iii_deleteBackward
{
    [self iii_deleteBackward];
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(textFieldDidDeleteBackward:)]) {
        id <IIITextFieldDelegate> delegate = (id <IIITextFieldDelegate>)self.delegate;
        [delegate textFieldDidDeleteBackward:self];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:IIITextFieldDidDeleteBackwardNotification object:self];
}

@end






