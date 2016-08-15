//
//  YMShowGoodsCell.m
//  youMuTou
//
//  Created by Tao on 16/8/13.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMShowGoodsCell.h"
#import "YMTableViewContentCell.h"

static NSString * identifer = @"ShowGoodsCell";

@interface YMShowGoodsCell ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *goodsContentView;

@end

@implementation YMShowGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _goodsContentView.delegate = self;
    _goodsContentView.dataSource = self;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    YMShowGoodsCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YMShowGoodsCell class]) owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YMTableViewContentCell *cell = [YMTableViewContentCell cellWithTableView:tableView];
    return cell;
}

@end
