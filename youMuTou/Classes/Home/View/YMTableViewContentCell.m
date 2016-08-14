//
//  YMTableViewContentCell.m
//  youMuTou
//
//  Created by Tao on 16/7/18.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMTableViewContentCell.h"

static NSString * identifer = @"TableViewContentCell";

@interface YMTableViewContentCell ()

@property (weak, nonatomic) IBOutlet UILabel *specLabel;
@property (weak, nonatomic) IBOutlet UILabel *bagNumLabel;

@property (weak, nonatomic) IBOutlet UILabel *packetNumLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@end


@implementation YMTableViewContentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (IBAction)addBtnClick:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"addBtnClick" object:nil userInfo:nil];
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    YMTableViewContentCell * cell = [tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YMTableViewContentCell class]) owner:self options:nil] lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
}

- (void)setCellModel:(YMTableContentModel *)cellModel
{
    _cellModel = cellModel;
    self.specLabel.text = cellModel.Specifications;
    self.bagNumLabel.text = cellModel.bagNums;
    self.packetNumLabel.text = [NSString stringWithFormat:@"%f",cellModel.packetNum];
    self.priceLabel.text = [NSString stringWithFormat:@"%f",cellModel.price];
}

@end
