# VKNetworkHandle
a network tool with AFNetworking
# CocosPods
```
pod 'VKIconTextField', '~> 1.0'
```
# Examples
```
//直接使用
[VKNetworkHandle postUrl:@"" param:@{} block:^(BOOL status, id data) {
        
}];
[VKNetworkHandle getUrl:@"" param:@{} block:^(BOOL status, id data) {
        
}];
```
```
//继承后使用
#import "VKNetworkHandle.h"

@interface VKAccountHandle : VKNetworkHandle

@end

//重写请求头和请求体
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
```
