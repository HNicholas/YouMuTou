//
//  YMNetWorkManager.m
//  youMuTou
//
//  Created by Tao on 16/7/22.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMNetWorkManager.h"
#import "AFNetworking.h"

@implementation YMNetWorkManager

+ (instancetype)sharedManager
{
    static YMNetWorkManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YMNetWorkManager alloc] init];
    });
    return manager;
}

- (AFHTTPSessionManager *)baseHttpRequest
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"text/html",@"application/javascript",@"application/json", nil];
    return manager;
}

- (void)getResultWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHttpRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager GET:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];

}

- (void)postRequestWithParameter:(NSDictionary *)parameter url:(NSString *)url successBlock:(SuccessBlock)successBlock failureBlock:(FailureBlock)failureBlock
{
    AFHTTPSessionManager *manager = [self baseHttpRequest];
    NSString *urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [manager POST:urlStr parameters:parameter constructingBodyWithBlock:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        successBlock(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSString *errorStr = [error.userInfo objectForKey:@"NSLocalizedDescription"];
        failureBlock(errorStr);
    }];
}

@end
