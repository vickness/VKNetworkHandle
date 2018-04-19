//
//  VKNetworkHandle.m
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "VKNetworkHandle.h"
#import "VKSessionManager.h"

@implementation VKNetworkHandle

#pragma mark -
#pragma mark - 发送POST请求
+(void)postUrl:(NSString *)url param:(NSDictionary *)param block:(void (^)(BOOL, id))block{
    
    NSDictionary *header = [self requestHeaderData];
    NSDictionary *body = [self requestBodySign:param];
    
    [VKSessionManager postUrl:url header:header param:body block:^(BOOL status, id data, NSError *error) {
        //请求数据解析
        [self responseAnalysisStatus:status data:data error:error block:block];
    }];
}


#pragma mark -
#pragma mark - 发送GET请求
+(void)getUrl:(NSString *)url param:(NSDictionary *)param block:(void (^)(BOOL, id))block{
    
    NSDictionary *header = [self requestHeaderData];
    NSDictionary *body = [self requestBodySign:param];
    
    [VKSessionManager getUrl:url header:header param:body block:^(BOOL status, id data, NSError *error) {
        //请求数据解析
        [self responseAnalysisStatus:status data:data error:error block:block];
    }];
}


#pragma mark -
#pragma mark - 取消请求
+(void)cancelRequest{
    [VKSessionManager cancelRequest];
}


#pragma mark -
#pragma mark - 重写请求头
+(NSDictionary *)requestHeaderData{
    return nil;
}


#pragma mark -
#pragma mark - 重写请求体
+(id)requestBodySign:(id)body{
    return body;
}


#pragma mark -
#pragma mark - 重写响应体解析
+(void)responseAnalysisStatus:(BOOL)status data:(id)data error:(NSError *)error block:(void (^)(BOOL, id))block{
    if (block) {
        if (data) {
            block(status,data);
        } else {
            block(status,error);
        }
    }
}

@end
