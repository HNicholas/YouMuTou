//
//  YMGoodsViewController.m
//  youMuTou
//
//  Created by Tao on 16/8/13.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMGoodsViewController.h"
#import "YMShowGoodsCell.h"
#import "YMShowTitleView.h"

@interface YMGoodsViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *goodsShowView;
@property(nonatomic, strong) UISegmentedControl *segmentHeadView;
@property(nonatomic, strong) UISegmentedControl *segmentSeeView;
@property(nonatomic, strong) YMShowTitleView *titleView;

@end

enum {
    ShowNum,
    ShowSeeStyle,
    ShowCell1,
    ShowCell2
};


@implementation YMGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backToLastView)];
    self.title = @"我的货物";
    [self.goodsShowView reloadData];
}

- (UITableView *)goodsShowView
{
    if (!_goodsShowView) {
        _goodsShowView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _goodsShowView.delegate = self;
        _goodsShowView.dataSource = self;
        _goodsShowView.tableHeaderView = self.segmentHeadView;
        _goodsShowView.backgroundColor = [UIColor whiteColor];
        _goodsShowView.showsVerticalScrollIndicator = NO;
        _goodsShowView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_goodsShowView];
    }
    return _goodsShowView;
}

- (UISegmentedControl *)segmentHeadView
{
    if (!_segmentHeadView) {
        _segmentHeadView = [[UISegmentedControl alloc] initWithItems:@[@"库存查询",@"入库单",@"出库单"]];
        _segmentHeadView.selectedSegmentIndex = 0;
    }
    return _segmentHeadView;
}

- (UISegmentedControl *)segmentSeeView
{
    if (!_segmentSeeView) {
        _segmentSeeView = [[UISegmentedControl alloc] initWithItems:@[@"按仓库查看",@"按品名查看"]];
        _segmentSeeView.selectedSegmentIndex = 0;
        _segmentSeeView.frame = CGRectMake(0, 0, self.view.frame.size.width, 35);
        [_segmentSeeView addTarget:self action:@selector(seeViewDidChange:) forControlEvents:UIControlEventValueChanged];
    }
    return _segmentSeeView;
}

- (YMShowTitleView *)titleView
{
    if(!_titleView) {
        _titleView = [YMShowTitleView createShowTitle];
    }
    return _titleView;
}


- (void)backToLastView
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)seeViewDidChange:(UISegmentedControl *)control
{
    if(control.selectedSegmentIndex == 0) {
        self.goodsShowView.backgroundColor = [UIColor whiteColor];
    } else {
        self.goodsShowView.backgroundColor = [UIColor yellowColor];
    }
}

#pragma mark - tableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return ShowCell2+1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    YMShowGoodsCell *goodsCell = [YMShowGoodsCell cellWithTableView:tableView];
    switch (indexPath.section) {
        case 0:
            [cell.contentView addSubview:self.titleView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        case 1:
            [cell.contentView addSubview:self.segmentSeeView];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
            break;
        case 2:
        case 3:
        default:
            return goodsCell;
            break;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        case 1:
            return 20;
            break;
        case 2:
        case 3:
        default:
            return 200;
            break;
    }

}

@end
