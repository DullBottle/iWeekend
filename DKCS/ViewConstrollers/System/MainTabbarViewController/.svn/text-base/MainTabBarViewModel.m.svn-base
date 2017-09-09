//
//  MainTabBarViewModel.m
//  Natalie
//
//  Created by 浚韩 陈 on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "MainTabBarViewModel.h"

@interface MainTabBarViewModel ()

@property (nonatomic, strong) HomepageViewModel *homepageViewModel;
@property (nonatomic, strong) SearchViewModel *searchViewModel;
@property (nonatomic, strong) ToolsViewModel *toolsViewModel;
@property (nonatomic, strong) MineViewModel *mineViewModel;

@end

@implementation MainTabBarViewModel

- (instancetype)initWithProvider:(id<ServiceProviderType>)provider
{
    if (self = [super initWithProvider:provider]) {
        
        //
        // Output.
        //
        _homepageViewModel = [[HomepageViewModel alloc] initWithProvider:provider];
        _searchViewModel = [[SearchViewModel alloc] initWithProvider:provider];
        _toolsViewModel = [[ToolsViewModel alloc] initWithProvider:provider];
        _mineViewModel = [[MineViewModel alloc] initWithProvider:provider];
        
    }
    return self;
}
    
@end
