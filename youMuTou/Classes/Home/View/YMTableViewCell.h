//
//  YMTableViewCell.h
//  youMuTou
//
//  Created by Tao on 16/7/18.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YMTableViewCell : UITableViewCell
@property(nonatomic, strong) NSArray *cellDatas;

- (instancetype)cellWithTablView:(UITableView *)tableView;
@end
