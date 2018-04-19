//
//  VKSessionManager.m
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "VKSessionManager.h"
#import "AFNetworking.h"

@implementation VKSessionManager

/**
 * 获取单例对象
 */
+ (AFHTTPSessionManager *)manager
{
    static AFHTTPSessionManager *manager = nil;
    static dispatch_once_t oneToken ;
    dispatch_once(&oneToken, ^{
        if (manager == nil) {
            manager = [AFHTTPSessionManager manager];
            AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
            policy.allowInvalidCertificates = YES;
            policy.validatesDomainName = NO;
            manager.securityPolicy = policy;
            manager.requestSerializer = [AFJSONRequestSerializer serializer];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
        }
    });
    return manager;
}


#pragma mark -
#pragma mark - 发送POST请求
+(void)postUrl:(NSString *)url header:(NSDictionary *)header param:(NSDictionary *)param block:(void (^)(BOOL, id, NSError *))block{
    
    for (NSString *key in header.allKeys) {
        [[self manager].requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    
    [[self manager] POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (block) block(YES,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (block) block(NO,nil,error);
    }];
}


#pragma mark -
#pragma mark - 发送GET请求
+(void)getUrl:(NSString *)url header:(NSDictionary *)header param:(NSDictionary *)param block:(void (^)(BOOL, id, NSError *))block{
    
    for (NSString *key in header.allKeys) {
        [[self manager].requestSerializer setValue:header[key] forHTTPHeaderField:key];
    }
    
    [[self manager] GET:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (block) block(YES,responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (block) block(NO,nil,error);
    }];
}


#pragma mark -
#pragma mark - 取消请求
+(void)cancelRequest{
    [[self manager].operationQueue cancelAllOperations];
}

@end
