//
//  YMShowGoodsCell.m
//  youMuTou
//
//  Created by Tao on 16/8/13.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMShowGoodsCell.h"

static NSString * identifer = @"ShowGoodsCell";

@implementation YMShowGoodsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
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

@end
