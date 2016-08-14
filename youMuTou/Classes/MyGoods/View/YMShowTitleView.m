//
//  YMShowTitleView.m
//  youMuTou
//
//  Created by Tao on 16/8/13.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMShowTitleView.h"

@implementation YMShowTitleView

+ (instancetype)createShowTitle
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YMShowTitleView class]) owner:self options:nil] lastObject];
}

@end
