//
//  VKNetworkHandle.h
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKNetworkHandle : NSObject


/**
 POST请求接口
 @param url   请求地址
 @param param 请求参数
 @param block 请求回调
 status YES为请求成功，NO为请求失败
 data   默认状态，status为YES，data为响应数据，status为NO，data为NSError，可以在子类重写
 */
+(void)postUrl:(NSString *)url
         param:(NSDictionary *)param
         block:(void(^)(BOOL status, id data))block;


/**
 GET请求接口
 @param url   请求地址
 @param param 请求参数
 @param block 请求回调
 status YES为请求成功，NO为请求失败
 data   默认状态，status为YES，data为响应数据，status为NO，data为NSError，可以在子类重写
 */
+(void)getUrl:(NSString *)url
        param:(NSDictionary *)param
        block:(void(^)(BOOL status, id data))block;


/** 取消请求*/
+(void)cancelRequest;


/**
 请求头设置（添加token等），子类重写
 @return 返回设置的请求头
 */
+(NSDictionary *)requestHeaderData;


/**
 请求体处理（签名加密等），子类重写
 @return 返回处理后的数据
 */
+(id)requestBodySign:(id)body;


/**
 响应体统一解析（若需要统一解析，重写该方法）
 @param status 响应状态，YES/成功，NO/失败
 @param data 响应体数据
 @param error 响应错误
 @param block 响应数据处理回调
 */
+(void)responseAnalysisStatus:(BOOL)status
                         data:(id)data
                        error:(NSError *)error
                        block:(void (^)(BOOL status, id data))block;

@end
