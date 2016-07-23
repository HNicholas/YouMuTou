//
//  YMTableViewCell.m
//  youMuTou
//
//  Created by Tao on 16/7/18.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMTableViewCell.h"
#import "YMTableViewContent.h"
#import "YMTableViewContentCell.h"


 static NSString * identifer = @"TableViewCell";

@interface YMTableViewCell()<UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic)  YMTableViewContent *cellTableView;


@end
@implementation YMTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)cellWithTablView:(UITableView *)tableView
{
    YMTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[YMTableViewCell alloc] init];
    }
    [cell.contentView addSubview:self.cellTableView];
    _cellTableView.delegate = cell;
    _cellTableView.dataSource = cell;
    return cell;
}

- (instancetype)init
{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YMTableViewCell class]) owner:self options:nil] lastObject];
    }
    return self;
}

- (YMTableViewContent *)cellTableView
{
    if (!_cellTableView) {
        _cellTableView = [[YMTableViewContent alloc] init];
        _cellTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _cellTableView.frame = CGRectMake(0, 6, self.bounds.size.width, self.bounds.size.height - 6);
        _cellTableView.scrollEnabled = NO;
    }
    return _cellTableView;
}

- (void)setCellDatas:(NSArray *)cellDatas
{
    _cellDatas = cellDatas;
    [_cellTableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cellDatas.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YMTableViewContentCell *cell = [YMTableViewContentCell cellWithTableView:tableView];
    YMTableContentModel *model = [[YMTableContentModel alloc] init];
    cell.cellModel = [model modelWithDict:self.cellDatas[indexPath.row]];
    return cell;
}


@end
