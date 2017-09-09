//
//  ConsultingViewController.m
//  DKCS
//
//  Created by 銀色魔頭號 on 2017/8/31.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ConsultingViewController.h"
#import "UIViewController+SVP.h"
#import "ConsultingQQView.h"
#import "ConsultingWorkingHoursView.h"

@interface ConsultingViewController ()

@property (nonatomic, strong) ConsultingViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) ConsultingQQView *consultingQQView;
@property (nonatomic, strong) ConsultingWorkingHoursView *consultingWorkingHoursView;

@end

@implementation ConsultingViewController

- (instancetype)initWithViewModel:(ConsultingViewModel *)viewModel
{
    if (self = [super init]) {
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // consulting QQ View.
        self.consultingQQView = [[ConsultingQQView alloc] initWithFrame:CGRectZero];
        
        // consulting working hours View.
        self.consultingWorkingHoursView = [[ConsultingWorkingHoursView alloc] initWithFrame:CGRectZero];
     
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.consultingQQView];
    [self.view addSubview:self.consultingWorkingHoursView];
}

- (void)configure:(ConsultingViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self.consultingQQView.cpyButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
        NSString *string = self.consultingQQView.label.text;
        pasteboard.string = [string substringFromIndex:5];
        [self showMessage:@"已复制"];
    }];
    
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        [viewModel.refresh sendNext:nil];
    }];
    
    //
    // Output.
    //
    [viewModel.didRefresh subscribeNext:^(id  _Nullable x) {
        
        @strongify(self);
        if ([x isKindOfClass:[NSError class]]) {
            NSError *error = (NSError *)x;
            [self showMessage:error.localizedDescription];
            return;
        }
        
        NSDictionary *JSON = (NSDictionary *)x;
        NSString *QQ = [NSString stringWithFormat:@"在线QQ：%@", JSON[@"data"][@"QQ"]];
        [self.consultingQQView.label setText:QQ afterInheritingLabelAttributesAndConfiguringWithBlock:^NSMutableAttributedString *(NSMutableAttributedString *mutableAttributedString) {
            NSRange range = [[mutableAttributedString string] rangeOfString:@"在线QQ：" options:NSCaseInsensitiveSearch];
            [mutableAttributedString addAttribute:(NSString *)kCTForegroundColorAttributeName value:[UIColor colorWithHexString:@"#333333"] range:range];
            return mutableAttributedString;
        }];
        
        NSString *worktime = JSON[@"data"][@"worktime"];
        self.consultingWorkingHoursView.label.text = worktime;
    }];
}

- (void)setupConstraints
{
    // TopLine.
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(64);
        make.height.mas_equalTo(0.5);
    }];
    
    // consulting QQ View.
    [self.consultingQQView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(74);
        make.height.mas_equalTo(65);
    }];
    
    // consulting working hours View.
    [self.consultingWorkingHoursView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.consultingQQView.mas_bottom).offset(10);
        make.height.mas_equalTo(96);
    }];
}

@end







