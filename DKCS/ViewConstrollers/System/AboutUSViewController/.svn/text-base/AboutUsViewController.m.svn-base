//
//  AboutUsViewController.m
//  DKCS
//
//  Created by __End on 2017/9/6.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "AboutUsViewController.h"

@interface AboutUsViewController ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *versionLabel;
@property (nonatomic, strong) UILabel *copyrightLabel;

@end

@implementation AboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // TopLine.
    self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
    self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
    [self.view addSubview:self.topLine];
    
    // imageView.
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.imageView.image = [UIImage imageNamed:@"icon"];
    [self.view addSubview:self.imageView];
    
    // versionLabel.
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    NSDictionary *infoDic = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDic objectForKey:@"CFBundleShortVersionString"];
    self.versionLabel.text = version;
    self.versionLabel.font = [UIFont fontWithName:kCommonFont size:20.f];
    self.versionLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.versionLabel];
    
    // copyrightLabel.
    self.copyrightLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.copyrightLabel.text = @"Copyright@2017 杭州搜影网络科技有限公司";
    self.copyrightLabel.font = [UIFont fontWithName:kCommonFont size:12.f];
    self.copyrightLabel.textColor = [UIColor colorWithHexString:@"#999999"];
    [self.view addSubview:self.copyrightLabel];
}

- (void)setupConstraints
{
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    // imageView.
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(158);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.height.mas_equalTo(72);
    }];
    
    // versionLabel.
    [self.versionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
    
    // copyrightLabel.
    [self.copyrightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-20);
        make.centerX.mas_equalTo(self.view.mas_centerX);
    }];
}

@end





