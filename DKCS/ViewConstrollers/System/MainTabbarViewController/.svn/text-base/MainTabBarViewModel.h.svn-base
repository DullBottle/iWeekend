//
//  MainTabBarViewModel.h
//  Natalie
//
//  Created by 浚韩 陈 on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "BaseViewModel.h"
#import "AppDelegate.h"

#import "HomepageViewModel.h"
#import "SearchViewModel.h"
#import "ToolsViewModel.h"
#import "MineViewModel.h"

@protocol MainTabBarViewModelType <NSObject>

@property (nonatomic, readonly, strong) HomepageViewModel *homepageViewModel;
@property (nonatomic, readonly, strong) SearchViewModel *searchViewModel;
@property (nonatomic, readonly, strong) ToolsViewModel *toolsViewModel;
@property (nonatomic, readonly, strong) MineViewModel *mineViewModel;

@end

@interface MainTabBarViewModel : BaseViewModel <MainTabBarViewModelType>

//
// Output.
//
@property (nonatomic, readonly, strong) HomepageViewModel *homepageViewModel;
@property (nonatomic, readonly, strong) SearchViewModel *searchViewModel;
@property (nonatomic, readonly, strong) ToolsViewModel *toolsViewModel;
@property (nonatomic, readonly, strong) MineViewModel *mineViewModel;

@end
