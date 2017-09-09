//
//  MarqueeView.m
//
//  Created by __End on 2017/5/21.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "MarqueeView.h"

@interface MarqueeView ()

@property (nonatomic, copy) NSArray *items;

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *firstLabel;
@property (nonatomic, strong) UILabel *secondLabel;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation MarqueeView {
    NSInteger currentIndex;
}

- (void)dealloc
{
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}

#pragma mark - setter & getter

- (void)setFont:(UIFont *)font
{
    self.firstLabel.font = font;
    self.secondLabel.font = font;
}

- (void)setTextColor:(UIColor *)textColor
{
    self.firstLabel.textColor = textColor;
    self.secondLabel.textColor = textColor;
}

- (NSInteger)index
{
    return currentIndex;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
     
        self.backgroundColor = [UIColor whiteColor];
        currentIndex = 0;
        
        // scroll view.
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.scrollEnabled = NO;
        [self.scrollView setContentSize:CGSizeMake(0, 60)];
        [self addSubview:self.scrollView];
        
        [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.right.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
        
        // first label.
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.firstLabel.numberOfLines = 1;
        self.firstLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.firstLabel.textColor = [UIColor colorWithHexString:@"#ED7B9C"];
        self.firstLabel.font = [UIFont systemFontOfSize:15.f];
        [self.scrollView addSubview:self.firstLabel];
        
        [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
        // second label.
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.secondLabel.numberOfLines = 1;
        self.secondLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        self.secondLabel.font = [UIFont systemFontOfSize:15.f];
        self.secondLabel.textColor = [UIColor colorWithHexString:@"#ED7B9C"];
        [self.scrollView addSubview:self.secondLabel];
        
        [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(self.firstLabel.mas_bottom).offset(0);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(30);
        }];
        
        [self setupConstraints];
    }
    return self;
}

- (void)running:(NSArray *)items
{
    self.items = items;
    
    if (items && items.count > 0) {
        
        self.firstLabel.text = items[currentIndex];
        
        // only the count > 1, make the timer fire.
        if (items.count > 1) {
            self.timer = [NSTimer timerWithTimeInterval:3.5f target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
        }
    }
}

#pragma mark - Timer action.

- (void)timerAction:(NSTimer *)sender
{
    currentIndex++;
    if (currentIndex > self.items.count - 1) {
        currentIndex = 0;
    }
    self.secondLabel.text = self.items[currentIndex];
    
    [self.scrollView setContentOffset:CGPointMake(0, 30) animated:YES];

    // scroll back to `TOP`. no animation.
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.firstLabel.text = self.items[currentIndex];
        [self.scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
        
    });
}

- (void)setupConstraints
{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
}

@end
