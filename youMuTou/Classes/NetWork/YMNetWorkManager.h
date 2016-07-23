//
//  YMNetWorkManager.h
//  youMuTou
//
//  Created by Tao on 16/7/22.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id responseBody);

typedef void(^FailureBlock)(NSString *error);

@interface YMNetWorkManager : NSObject
+ (instancetype)sharedManager;
- (void)getResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

- (void)postRequestWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock;

@end
