//
//  YMDataManager.h
//  youMuTou
//
//  Created by Tao on 16/7/26.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YMDataManager : NSObject
+ (instancetype)sharedDataManger;
- (BOOL)addUserWithDict:(NSDictionary *)dict;
- (BOOL)checkUserLoginWithDict:(NSDictionary *)dict;
@end
