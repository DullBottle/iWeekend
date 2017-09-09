//
//  AdvertorialViewController.m
//
//  Created by __End on 2017/6/30.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "AdvertorialViewController.h"
#import <WebKit/WebKit.h>

@interface AdvertorialViewController () <WKNavigationDelegate>

@property (nonatomic, strong) NSString *link;

@end

@implementation AdvertorialViewController

- (instancetype)initWithLink:(NSString *)link
{
    if (self = [super init]) {
        
        self.link = link;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    webView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    webView.scrollView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    webView.navigationDelegate = self;
    self.view.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    [self.view addSubview:webView];
    
    // statusBarView.
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    UIView *statusBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 20)];
    statusBarView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    [self.view addSubview:statusBarView];

    [self.view bringSubviewToFront:statusBarView];
    
    [self loadPage:webView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

- (void)loadPage:(WKWebView*)webView
{
    NSString* htmlPath = self.link;
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:htmlPath]];
    [webView loadRequest:request];
}


@end
