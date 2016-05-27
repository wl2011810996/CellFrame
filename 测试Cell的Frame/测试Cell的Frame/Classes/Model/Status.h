//
//  Status.h
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Status : NSObject

@property (nonatomic, copy) NSString *text; // 内容
@property (nonatomic, copy) NSString *icon; // 头像
@property (nonatomic, copy) NSString *name; // 昵称
@property (nonatomic, copy) NSString *picture; // 配图
@property (nonatomic, assign) BOOL vip;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)weiboWithDict:(NSDictionary *)dict;

@end
