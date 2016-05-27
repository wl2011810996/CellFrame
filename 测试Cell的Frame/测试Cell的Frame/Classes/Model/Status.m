//
//  Status.m
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import "Status.h"

@implementation Status

- (id)initWithDict:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
//        Status *status = [[Status alloc]init];
//        status.text = dict[@"text"];
//        status.icon = dict[@"icon"];
//        status.name = dict[@"name"];
//        status.picture = dict[@"picture"];
//        status.vip = [dict[@"vip"]boolValue];
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+ (id)weiboWithDict:(NSDictionary *)dict
{
    return  [[self alloc]initWithDict:dict];
}

/**
 
 @property (nonatomic, copy) NSString *text; // 内容
 @property (nonatomic, copy) NSString *icon; // 头像
 @property (nonatomic, copy) NSString *name; // 昵称
 @property (nonatomic, copy) NSString *picture; // 配图
 @property (nonatomic, assign) BOOL vip;
 
 
 */

@end
