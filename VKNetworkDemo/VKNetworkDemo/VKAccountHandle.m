//
//  VKAccountHandle.m
//  VKNetworkDemo
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "VKAccountHandle.h"

@implementation VKAccountHandle

/** 设置请求头数据*/
+(NSDictionary *)requestHeaderData{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setValue:@"" forKey:@""];
    [dict setValue:@"" forKey:@""];
    return dict;
}


/** 请求体数据处理*/
+(id)requestBodySign:(id)body{
    
    //请求体签名，加密
    
    return body;
}


/** 响应体数据解析*/
+(void)responseAnalysisStatus:(BOOL)status data:(id)data error:(NSError *)error block:(void (^)(BOOL, id))block{
    
    
}

@end
