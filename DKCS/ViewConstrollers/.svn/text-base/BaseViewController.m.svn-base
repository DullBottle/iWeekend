//
//  BaseViewController.m
//
//  Created by __End on 2017/4/18.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, copy) NSString *className;

@end

@implementation BaseViewController {
    BOOL didSetupConstraints;
}

- (NSString *)className
{
    return [self.description componentsSeparatedByString:@":"].firstObject;
}

- (void)dealloc
{
    NSLog(@"DEINIT: %@", self.className);
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    didSetupConstraints = NO;
    [self.view setNeedsUpdateConstraints];
}

- (void)updateViewConstraints
{
    if (!didSetupConstraints) {
        [self setupConstraints];
        didSetupConstraints = YES;
    }
    [super updateViewConstraints];
}

- (void)setupConstraints
{
    // Override this func.
}

@end
