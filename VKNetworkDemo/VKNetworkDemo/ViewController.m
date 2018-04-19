//
//  ViewController.m
//  VKNetworkDemo
//
//  Created by Senvid on 2018/4/19.
//  Copyright © 2018年 Senvid. All rights reserved.
//

#import "ViewController.h"
#import "VKNetworkHandle.h"
#import "VKAccountHandle.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //直接使用
    [VKNetworkHandle postUrl:@"" param:@{} block:^(BOOL status, id data) {
        
    }];
    [VKNetworkHandle getUrl:@"" param:@{} block:^(BOOL status, id data) {
        
    }];
    
    //继承后使用
    [VKAccountHandle postUrl:@"" param:@{} block:^(BOOL status, id data) {
        
    }];
    [VKAccountHandle getUrl:@"" param:@{} block:^(BOOL status, id data) {
        
    }];
}

@end
