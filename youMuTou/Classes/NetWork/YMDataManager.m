//
//  YMDataManager.m
//  youMuTou
//
//  Created by Tao on 16/7/26.
//  Copyright © 2016年 HuangTao. All rights reserved.
//

#import "YMDataManager.h"
#import <sqlite3.h>

@implementation YMDataManager
{
    sqlite3 *database;
    sqlite3_stmt *stmt;
}

+ (instancetype)sharedDataManger
{
    static YMDataManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[YMDataManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self createDb];
    }
    return self;
}

- (NSString *)path
{
    NSArray *documentArr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [documentArr firstObject];
    NSString *path = [documentPath stringByAppendingPathComponent:@"YMData.db"];
    return path;
}

- (void)createDb
{
    int databaseResult = sqlite3_open([[self path] UTF8String], &database);
    
    if (databaseResult != SQLITE_OK) {
        
        NSLog(@"创建／打开数据库失败,%d",databaseResult);
    }
    
    char *error;
    const char *createSQL = "create table if not exists user(id integer primary key autoincrement,name char,token char)";
    
    int tableResult = sqlite3_exec(database, createSQL, NULL, NULL, &error);
    
    if (tableResult != SQLITE_OK) {
        
        NSLog(@"创建表失败:%s",error);
    }
}

- (BOOL)addUserWithDict:(NSDictionary *)dict
{
    NSString *insertSQL = [NSString stringWithFormat:@"insert into user (name,token)values('%@','%@')", dict[@"username"], dict[@"token"]];
    int insertResult = sqlite3_prepare_v2(database, [insertSQL UTF8String], -1, &stmt, nil);
    
    if (insertResult != SQLITE_OK) {
        NSLog(@"添加失败,%d",insertResult);
        return FALSE;
    }
    else {
        sqlite3_step(stmt);
        return YES;
    }
}

- (BOOL)checkUserLoginWithDict:(NSDictionary *)dict
{
    NSString *searchSQL = [NSString stringWithFormat:@"select token from user where name = '%@'",dict[@"username"]];
    int searchResult = sqlite3_prepare_v2(database, [searchSQL UTF8String], -1, &stmt, nil);
    if (searchResult != SQLITE_OK) {
        NSLog(@"查询失败,%d",searchResult);
    }
    else{
        while (sqlite3_step(stmt) == SQLITE_ROW) {
            // 查询的结果可能不止一条,直到 sqlite3_step(stmt) != SQLITE_ROW,查询结束。
            char *tokenWord = (char *) sqlite3_column_text(stmt, 0);
            NSString *token = [NSString stringWithUTF8String:tokenWord];
            if ([token isEqualToString:dict[@"token"]]) {
                return TRUE;
            }
        }
    }
    
    return FALSE;
}

@end
