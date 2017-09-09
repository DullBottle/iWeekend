//
//  ProvidentFundInputView.m
//  DKCS
//
//  Created by __End on 2017/9/7.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "ProvidentFundInputView.h"
#import "TabIndicatorView.h"

@interface ProvidentFundInputView () <TabIndicatorViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) TabIndicatorView *tabIndicator;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIView *amountRootView;
@property (nonatomic, strong) UIView *areaRootView;
@property (nonatomic, strong) UIView *separatorOne;

// amountViewSeparators.
@property (nonatomic, strong) UIView *separatorTwo;
@property (nonatomic, strong) UIView *separatorThree;
@property (nonatomic, strong) UIView *separatorFour;

// areaViewSepartors.
@property (nonatomic, strong) UILabel *areaUnitLabel;
@property (nonatomic, strong) UIView *separatorFive;
@property (nonatomic, strong) UIView *separatorSix;
@property (nonatomic, strong) UIView *separatorSeven;

@end

@implementation ProvidentFundInputView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        // titleView.
        {
            // titleLabel.
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.titleLabel.text = @"计算方式";
            self.titleLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
            self.titleLabel.textColor = [UIColor colorWithHexString:@"#666666"];
            self.titleLabel.textAlignment = NSTextAlignmentCenter;
            [self addSubview:self.titleLabel];
            
            // tabIndicator.
            self.tabIndicator = [[TabIndicatorView alloc] initWithFrame:CGRectZero];
            self.tabIndicator.delegate = self;
            self.tabIndicator.backgroundColor = [UIColor whiteColor];
            [self addSubview:self.tabIndicator];
            
            // scrollView.
            CGFloat width = [UIScreen mainScreen].bounds.size.width;
            self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
            self.scrollView.delegate = self;
            [self.scrollView setContentSize:CGSizeMake((width - 40) * 2, 0)];
            self.scrollView.pagingEnabled = YES;
            self.scrollView.showsHorizontalScrollIndicator = NO;
            [self addSubview:self.scrollView];
            
            // amountRootView.
            self.amountRootView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width - 40, 250)];
            [self.scrollView addSubview:self.amountRootView];
            
            // areaRootView.
            self.areaRootView = [[UIView alloc] initWithFrame:CGRectMake(width - 40, 0, width - 40, 250)];
            [self.scrollView addSubview:self.areaRootView];
            
            // separatorOne.
            self.separatorOne = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorOne.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self addSubview:self.separatorOne];
        }
        
        // amountView.
        {
            self.totalPriceInputView = [[InputView alloc] initWithFrame:CGRectZero];
            self.totalPriceInputView.unit = YES;
            self.totalPriceInputView.text = @"房屋总价";
            self.totalPriceInputView.unitText = @"万元";
            self.totalPriceInputView.placeholder = @"请输入房屋总价";
            [self.amountRootView addSubview:self.totalPriceInputView];
            
            // separatorTwo.
            self.separatorTwo = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorTwo.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.amountRootView addSubview:self.separatorTwo];
            
            self.firstPaymentsInputView = [[InputView alloc] initWithFrame:CGRectZero];
            self.firstPaymentsInputView.unit = YES;
            self.firstPaymentsInputView.text = @"首付额度";
            self.firstPaymentsInputView.unitText = @"万元";
            self.firstPaymentsInputView.placeholder = @"请输入";
            [self.amountRootView addSubview:self.firstPaymentsInputView];
            
            self.firstPayTapTap = [[TapTap alloc] initWithFrame:CGRectZero];
            self.firstPayTapTap.placeholder = @"请选择";
            [self.firstPaymentsInputView addSubview:self.firstPayTapTap];
            
            // separatorThree.
            self.separatorThree = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorThree.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.amountRootView addSubview:self.separatorThree];
            
            self.loanPeriodPickerView = [[InputPickerView alloc] initWithFrame:CGRectZero];
            self.loanPeriodPickerView.text = @"贷款期限";
            self.loanPeriodPickerView.placeholder = @"请选择贷款年限";
            [self.amountRootView addSubview:self.loanPeriodPickerView];
            
            // separatorFour.
            self.separatorFour = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorFour.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.amountRootView addSubview:self.separatorFour];
            
            self.loanAnnualRatePickerView = [[InputPickerView alloc] initWithFrame:CGRectZero];
            self.loanAnnualRatePickerView.text = @"贷款年利率";
            self.loanAnnualRatePickerView.placeholder = @"请选择贷款年利率";
            [self.amountRootView addSubview:self.loanAnnualRatePickerView];
        }
        
        // areaView.
        {
            self.totalAreaInputView = [[InputView alloc] initWithFrame:CGRectZero];
            self.totalAreaInputView.unit = YES;
            self.totalAreaInputView.text = @"房屋面积";
            self.totalAreaInputView.unitText = @"元/㎡";
            self.totalAreaInputView.placeholder = @"请输入";
            [self.areaRootView addSubview:self.totalAreaInputView];
            
            // textField.
            self.areaTextField = [[UITextField alloc] initWithFrame:CGRectZero];
            self.areaTextField.textAlignment = NSTextAlignmentRight;
            self.areaTextField.font = [UIFont fontWithName:kCommonFont size:14.f];
            self.areaTextField.textColor = [UIColor colorWithHexString:@"#333333"];
            self.areaTextField.keyboardType = UIKeyboardTypeNumberPad;
            NSMutableParagraphStyle *style = [self.areaTextField.defaultTextAttributes[NSParagraphStyleAttributeName] mutableCopy];
            style.minimumLineHeight = self.areaTextField.font.lineHeight - (self.areaTextField.font.lineHeight - [UIFont fontWithName:kCommonFont size:14.f].lineHeight) / 2.0;
            self.areaTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入"
                                                                                       attributes:@{ (id)kCTForegroundColorAttributeName: (id)[UIColor colorWithHexString:@"#CCCCCC"].CGColor,
                                                                                                     NSFontAttributeName: [UIFont fontWithName:kCommonFont size:14.f],
                                                                                                     NSParagraphStyleAttributeName : style }];
            [self.totalAreaInputView addSubview:self.areaTextField];
            
            // unit label.
            self.areaUnitLabel = [[UILabel alloc] initWithFrame:CGRectZero];
            self.areaUnitLabel.font = [UIFont fontWithName:kCommonFont size:14.f];
            self.areaUnitLabel.textColor = [UIColor colorWithHexString:@"#333333"];
            self.areaUnitLabel.textAlignment = NSTextAlignmentCenter;
            self.areaUnitLabel.text = @"㎡";
            [self.totalAreaInputView addSubview:self.areaUnitLabel];
            
            // separatorFive.
            self.separatorFive = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorFive.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.areaRootView addSubview:self.separatorFive];
            
            self.firstAreaPaymentsInputView = [[InputView alloc] initWithFrame:CGRectZero];
            self.firstAreaPaymentsInputView.unit = YES;
            self.firstAreaPaymentsInputView.text = @"首付额度";
            self.firstAreaPaymentsInputView.unitText = @"万元";
            self.firstAreaPaymentsInputView.placeholder = @"请输入";
            [self.areaRootView addSubview:self.firstAreaPaymentsInputView];
            
            self.firstAreaPayTapTap = [[TapTap alloc] initWithFrame:CGRectZero];
            self.firstAreaPayTapTap.placeholder = @"请选择";
            [self.firstAreaPaymentsInputView addSubview:self.firstAreaPayTapTap];
            
            // separatorSix.
            self.separatorSix = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorSix.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.areaRootView addSubview:self.separatorSix];
            
            self.loanAreaPeriodPickerView = [[InputPickerView alloc] initWithFrame:CGRectZero];
            self.loanAreaPeriodPickerView.text = @"贷款期限";
            self.loanAreaPeriodPickerView.placeholder = @"请选择贷款年限";
            [self.areaRootView addSubview:self.loanAreaPeriodPickerView];
            
            // separatorSeven.
            self.separatorSeven = [[UIView alloc] initWithFrame:CGRectZero];
            self.separatorSeven.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
            [self.areaRootView addSubview:self.separatorSeven];
            
            self.loanAreaAnnualRatePickerView = [[InputPickerView alloc] initWithFrame:CGRectZero];
            self.loanAreaAnnualRatePickerView.text = @"贷款年利率";
            self.loanAreaAnnualRatePickerView.placeholder = @"请选择贷款年利率";
            [self.areaRootView addSubview:self.loanAreaAnnualRatePickerView];
        }
        
        [self setupConstraints];
    }
    return self;
}

- (void)setupConstraints
{
    {
        // titleLabel.
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(15);
        }];
        
        // tabIndicator.
        [self.tabIndicator mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
            make.width.mas_equalTo(125);
        }];
        
        // separatorOne.
        [self.separatorOne mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(50);
            make.height.mas_equalTo(0.5);
        }];
        
        // scrollView.
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorOne.mas_bottom).offset(0);
            make.height.mas_equalTo(200);
        }];
    }
    
    // amountView.
    {
        [self.totalPriceInputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.separatorTwo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.totalPriceInputView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.firstPaymentsInputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorTwo.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.firstPayTapTap mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-150);
            make.width.mas_equalTo(60);
        }];
        
        [self.separatorThree mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.firstPaymentsInputView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.loanPeriodPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorThree.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.separatorFour mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.loanPeriodPickerView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.loanAnnualRatePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorFour.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
    }
    
    // areaView.
    {
        [self.totalAreaInputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.areaUnitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-150);
        }];
        
        [self.areaTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(self.areaUnitLabel.mas_left).offset(-1);
        }];
        
        [self.separatorFive mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.totalAreaInputView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.firstAreaPaymentsInputView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorFive.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.firstAreaPayTapTap mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.right.mas_equalTo(-150);
            make.width.mas_equalTo(60);
        }];
        
        [self.separatorSix mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.firstAreaPaymentsInputView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.loanAreaPeriodPickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorSix.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
        
        [self.separatorSeven mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.right.mas_equalTo(-20);
            make.top.mas_equalTo(self.loanAreaPeriodPickerView.mas_bottom).offset(0);
            make.height.mas_equalTo(0.5);
        }];
        
        [self.loanAreaAnnualRatePickerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.separatorSeven.mas_bottom).offset(0);
            make.height.mas_equalTo(50);
        }];
    }
}

#pragma mark - TabIndicatorViewDelegate methods

- (NSArray<NSString *> *)tabIndicatorTitles
{
    return @[ @"金额", @"面积" ];
}

- (CGFloat)widthForTabIndicator
{
    return 34.f;
}

- (void)tabIndicatorView:(TabIndicatorView *)tabIndicatorView didSelectedAtIndex:(NSUInteger)index
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    CGFloat offset = index * width;
    [self.scrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

#pragma mark - ScrollViewDelegate methods

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width - 40;
    NSUInteger index = scrollView.contentOffset.x / width;
    [self.tabIndicator setIndicatorOffsetWithIndex:index];
}

@end




