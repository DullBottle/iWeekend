//
//  SearchFilterBar.m
//  DKCS
//
//  Created by __End on 2017/9/4.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "SearchFilterBar.h"
#import "SearchFilterDropDownView.h"

@interface SearchFilterBar ()

@property (nonatomic, strong) YNDropDownMenu *dropDownMenu;

@end

@implementation SearchFilterBar

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
                
        // dropDownMenu.
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        SearchFilterDropDownView *view = [[SearchFilterDropDownView alloc] initWithFrame:CGRectMake(0, 0, w, 108)];
        view.backgroundColor = [UIColor whiteColor];
        
        self.dropDownMenu = [[YNDropDownMenu alloc] initWithFrame:CGRectMake(0, 0, w, 40)
                                                    dropDownViews:@[ view, view, view ]
                                               dropDownViewTitles:@[ @"所有贷款类型", @"金额不限", @"期限不限" ]];
        [self.dropDownMenu setLabelWithFont:[UIFont fontWithName:kCommonFont size:12.f]];
        UIColor *color = [UIColor colorWithHexString:@"#FF4E33"];
        [self.dropDownMenu setLabelColorWhenNormal:color selected:color disabled:color];
        [self.dropDownMenu setImageWhenNormal:[UIImage imageNamed:@"下拉箭头"] selected:[UIImage imageNamed:@"下拉箭头"] disabled:nil];
        self.dropDownMenu.backgroundBlurEnabled = NO;
        
//        UIView *backgroundView = [UIView new];
//        backgroundView.userInteractionEnabled = YES;
//        backgroundView.backgroundColor = [UIColor blackColor];
//        self.dropDownMenu.blurEffectView = backgroundView;
//        self.dropDownMenu.blurEffectViewAlpha = 0.7f;
        
        [self addSubview:self.dropDownMenu];
        
//        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//        [self.dropDownMenu.blurEffectView addGestureRecognizer:tapGesture];
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    
}

#pragma Tap Gesture Action

- (void)tap:(UITapGestureRecognizer *)sender
{
    [self.dropDownMenu hideMenu];
}

@end


































