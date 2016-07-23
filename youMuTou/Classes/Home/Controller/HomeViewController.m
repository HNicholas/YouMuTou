//
//  HomeViewController.m
//  youMuTou
//
//  Created by Tao on 16/7/17.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "HomeViewController.h"
#import "YMNavgationView.h"
#import "YMHomeTableHeadView.h"
#import "YMTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView *contentTableView;
@property(nonatomic, strong) NSArray *data;
@property(nonatomic, strong) YMHomeTableHeadView *homeHeadView;

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:[YMNavgationView createNavgationView]];
}

- (UITableView *)contentTableView
{
    if (!_contentTableView) {
        _contentTableView = [[UITableView alloc] init];
        _contentTableView.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
        _contentTableView.dataSource = self;
        _contentTableView.delegate = self;
        _contentTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _contentTableView.tableHeaderView = self.homeHeadView;
        _contentTableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_contentTableView];
    }
    return _contentTableView;
}

- (YMHomeTableHeadView *)homeHeadView
{
    if (!_homeHeadView) {
        _homeHeadView = [[YMHomeTableHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
    }
    return _homeHeadView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createData];
    [self.contentTableView reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YMTableViewCell *cell = [[[YMTableViewCell alloc] init] cellWithTablView:tableView] ;
    cell.cellDatas = self.data[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)createData
{
    self.data = [NSArray array];
    NSMutableArray *tmpArray = [NSMutableArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"]];
    self.data = tmpArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *array = self.data[indexPath.row];
    
    return array.count * 60;
}

@end
