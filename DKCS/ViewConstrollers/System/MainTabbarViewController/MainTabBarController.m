//
//  MainTabBarController.m
//
//  Created by __End on 2017/4/22.
//  Copyright © 2017年 IIIidan Stormrage. All rights reserved.
//

#import "MainTabBarController.h"
#import "BaseNavigationController.h"

#import "HomepageViewModel.h"
#import "HomepageViewController.h"
#import "SearchViewModel.h"
#import "SearchViewController.h"
#import "ToolsViewModel.h"
#import "ToolsViewController.h"
#import "MineViewModel.h"
#import "MineViewController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (instancetype)initWithViewModel:(id<MainTabBarViewModelType>)viewModel
{
    if (self = [super init]) {
        
        [self configure:viewModel];
    }
    return self;
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}
    
#pragma mark Configure
    
- (void)configure:(id<MainTabBarViewModelType>)viewModel
{
    // 借款首页
    HomepageViewController *homepageViewController = [[HomepageViewController alloc] initWithViewModel:viewModel.homepageViewModel];
    [homepageViewController.tabBarItem setImage:[UIImage imageNamed:@"借款-灰"]];
    [homepageViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"借款-红"]];
    homepageViewController.tabBarItem.title = @"贷款";
    BaseNavigationController *homepageNavigationController = [[BaseNavigationController alloc] initWithRootViewController:homepageViewController];

    // 搜索
    SearchViewController *searchViewController = [[SearchViewController alloc] initWithViewModel:viewModel.searchViewModel];
    [searchViewController.tabBarItem setImage:[UIImage imageNamed:@"搜索-灰"]];
    [searchViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"搜索-红"]];
    searchViewController.title = @"搜索贷款";
    searchViewController.tabBarItem.title = @"搜索";
    BaseNavigationController *searchNavigationController = [[BaseNavigationController alloc] initWithRootViewController:searchViewController];
    
    // 工具
    ToolsViewController *toolsViewController = [[ToolsViewController alloc] initWithViewModel:viewModel.toolsViewModel];
    [toolsViewController.tabBarItem setImage:[UIImage imageNamed:@"工具-灰"]];
    [toolsViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"工具-红"]];
    toolsViewController.title = @"工具";
    BaseNavigationController *toolsNavigationController = [[BaseNavigationController alloc] initWithRootViewController:toolsViewController];
    
    // 我的
    MineViewController *mineViewController = [[MineViewController alloc] initWithViewModel:viewModel.mineViewModel];
    [mineViewController.tabBarItem setImage:[UIImage imageNamed:@"我的-灰"]];
    [mineViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"我的-红"]];
    mineViewController.tabBarItem.title = @"我的";
    BaseNavigationController *mineNavigationController = [[BaseNavigationController alloc] initWithRootViewController:mineViewController];
    
    NSArray *navigations = @[ homepageNavigationController,
                              searchNavigationController,
                              toolsNavigationController,
                              mineNavigationController ];
    self.tabBar.tintColor = [UIColor colorWithHexString:@"#FF4E33"];
    self.viewControllers = navigations;
    
}

@end

