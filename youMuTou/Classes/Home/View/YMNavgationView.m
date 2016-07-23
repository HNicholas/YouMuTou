//
//  YMNavgationView.m
//  youMuTou
//
//  Created by Tao on 16/7/17.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMNavgationView.h"

@interface YMNavgationView ()

@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation YMNavgationView

+ (instancetype)createNavgationView
{
    YMNavgationView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([YMNavgationView class]) owner:self options:nil] lastObject];
    view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44);
    return view;
}
- (IBAction)searchBtnClick:(id)sender {
    
    [self.searchTextField resignFirstResponder];
}

@end
