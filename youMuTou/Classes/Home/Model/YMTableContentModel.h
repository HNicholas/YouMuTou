//
//  YMTableContentModel.h
//  youMuTou
//
//  Created by Tao on 16/7/18.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMTableContentModel : NSObject
@property(nonatomic, copy) NSString *Specifications;
@property(nonatomic, copy) NSString *bagNums;
@property(nonatomic, assign) float packetNum;
@property(nonatomic, assign) float price;
- (instancetype)modelWithDict:(NSDictionary *)dict;
@end
