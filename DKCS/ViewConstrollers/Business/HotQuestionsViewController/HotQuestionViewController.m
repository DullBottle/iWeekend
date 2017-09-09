//
//  HotQuestionViewController.m
//  DKCS
//
//  Created by __End on 2017/9/8.
//  Copyright © 2017年 IIIidan Stromrage. All rights reserved.
//

#import "HotQuestionViewController.h"
#import "HVTableView.h"
#import "HotQuestionExpandCell.h"
#import "Question.h"

@interface HotQuestionViewController () <HVTableViewDelegate, HVTableViewDataSource>

@property (nonatomic, strong) HotQuestionViewModel *viewModel;

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) HVTableView *tableView;

@end

@implementation HotQuestionViewController

- (instancetype)initWithViewModel:(HotQuestionViewModel *)viewModel
{
    if (self = [super init]) {
        
        self.viewModel = viewModel;
        
        // TopLine.
        self.topLine = [[UIView alloc] initWithFrame:CGRectZero];
        self.topLine.backgroundColor = [UIColor colorWithHexString:@"#CCCCCC"];
        
        // tableView.
        self.tableView = [[HVTableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        self.tableView.expandOnlyOneCell = YES;
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.HVTableViewDataSource = self;
        self.tableView.HVTableViewDelegate = self;
        [self.tableView registerClass:[HotQuestionExpandCell class] forCellReuseIdentifier:NSStringFromClass([HotQuestionExpandCell class])];
        
        [self configure:viewModel];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.topLine];
    [self.view addSubview:self.tableView];
}

- (void)configure:(HotQuestionViewModel *)viewModel
{
    @weakify(self);
    //
    // Input.
    //
    [[self rac_signalForSelector:@selector(viewDidLoad)] subscribeNext:^(RACTuple * _Nullable x) {
        [viewModel.refresh sendNext:nil];
    }];
    
    //
    // Output.
    //
    [viewModel.didRefresh subscribeNext:^(NSArray *questions) {
        @strongify(self);
        viewModel.questions = questions;
        [self.tableView reloadData];
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
    
    // tableView.
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.topLine.mas_bottom).offset(0);
        make.bottom.mas_equalTo(0);
    }];
}

#pragma mark - HVTableViewDelegate & dataSource methods

- (void)tableView:(UITableView *)tableView expandCell:(HotQuestionExpandCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    [UIView animateWithDuration:.3 animations:^{
        cell.arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
    
    Question *question = [self.viewModel.questions objectAtIndex:indexPath.row];
    cell.answerLabel.text = question.answer;
}

- (void)tableView:(UITableView *)tableView collapseCell:(HotQuestionExpandCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    cell.arrow.transform = CGAffineTransformMakeRotation(0);
    
    [UIView animateWithDuration:.3 animations:^{
        cell.arrow.transform = CGAffineTransformMakeRotation(0);
    }];
    
    cell.answerLabel.text = @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.viewModel.questions.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isExpanded
{
    HotQuestionExpandCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HotQuestionExpandCell class])];
    
    if (cell == nil) {
        cell = [[HotQuestionExpandCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([HotQuestionExpandCell class])];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    Question *question = [self.viewModel.questions objectAtIndex:indexPath.row];
    cell.questionLabel.text = question.question;
    
    if (!isExpanded) {
        cell.arrow.transform = CGAffineTransformMakeRotation(0);
    } else {
        cell.arrow.transform = CGAffineTransformMakeRotation(M_PI_2);
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath isExpanded:(BOOL)isexpanded
{
    if (isexpanded) {
        
        return 100.f;
    }
    return 50.f;
}

@end



