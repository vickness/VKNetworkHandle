//
//  VKSessionManager.h
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKSessionManager : NSObject

/**
 POST请求接口
 @param url    请求地址
 @param header 请求头部
 @param param 请求参数
 @param block 请求回调
 */
+(void)postUrl:(NSString *)url
        header:(NSDictionary *)header
         param:(NSDictionary *)param
         block:(void(^)(BOOL status, id data, NSError *error))block;


/**
 GET请求接口
 @param url    请求地址
 @param header 请求头部
 @param param 请求参数
 @param block 请求回调
 */
+(void)getUrl:(NSString *)url
       header:(NSDictionary *)header
        param:(NSDictionary *)param
        block:(void(^)(BOOL status, id data, NSError *error))block;


/** 取消请求*/
+(void)cancelRequest;

@end
