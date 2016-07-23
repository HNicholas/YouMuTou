//
//  YMTableViewContentCell.h
//  youMuTou
//
//  Created by Tao on 16/7/18.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YMTableContentModel.h"

@interface YMTableViewContentCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic, strong) YMTableContentModel *cellModel;

@end
