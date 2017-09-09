//
//  AppDelegate.m
//  DKCS
//
//  Created by __End on 2017/8/30.
//  Copyright © 2017年 Sooying.com All rights reserved.
//

#import "AppDelegate.h"

#import "DKDefaults.h"
#import "AFNetworkActivityLogger.h"

#import "MainTabBarViewModel.h"
#import "MainTabBarController.h"

// Tools.
#import <SVProgressHUD/SVProgressHUD.h>

@interface AppDelegate ()

@property (nonatomic, strong) id<ServiceProviderType> provider;

@end

@implementation AppDelegate

+ (AppDelegate *)shared
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    
    /*
     *  ⚠️ Provider 全局唯一
     *  此处初始化之后不断往下传递。。
     */
    self.provider = [ServiceProvider new];
    
    [self commonConfigure];
    
    MainTabBarViewModel *viewModel = [[MainTabBarViewModel alloc] initWithProvider:self.provider];
    MainTabBarController *tabbarController = [[MainTabBarController alloc] initWithViewModel:viewModel];
    
    [self.window setRootViewController:tabbarController];
    [self.window makeKeyAndVisible];

    return YES;
}

- (void)reloadRootViewController
{
    MainTabBarViewModel *viewModel = [[MainTabBarViewModel alloc] initWithProvider:self.provider];
    MainTabBarController *tabbarController = [[MainTabBarController alloc] initWithViewModel:viewModel];
    [tabbarController setSelectedIndex:3];
    
    [self.window setRootViewController:tabbarController];
    [self.window makeKeyAndVisible];
}

#pragma mark - Base Configure.

- (void)commonConfigure
{
    [DKDefaults setup];
    [self configureAppearance];
    [self configureNetworkLogger];
    [self configureIQKeyboardManager];
    [self configureSVProgressHUD];
}

- (void)configureAppearance
{
    [UINavigationBar.appearance setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [UINavigationBar.appearance setShadowImage:[UIImage new]];
    [UINavigationBar.appearance setBackgroundColor:[UIColor clearColor]];
    [UINavigationBar.appearance setBarStyle:UIBarStyleBlack];
}

- (void)configureNetworkLogger
{
    [[AFNetworkActivityLogger sharedNetworkLogger] startLogging];
}

- (void)configureIQKeyboardManager
{
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = NO;
    manager.shouldResignOnTouchOutside = YES;
    manager.enableAutoToolbar = NO;
}

- (void)configureSVProgressHUD
{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithHexString:@"#000000" withAlpha:0.8f]];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setDefaultAnimationType:SVProgressHUDAnimationTypeNative];
    [SVProgressHUD setFont:[UIFont fontWithName:kCommonFont size:14.f]];
    [SVProgressHUD setCornerRadius:6.f];
}

#pragma mark - application Life.

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end






