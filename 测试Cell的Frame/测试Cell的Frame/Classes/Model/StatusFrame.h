//
//  StatusFrame.h
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class Status;
@interface StatusFrame : NSObject

/**
 *  头像的frame
 */
@property (nonatomic, assign) CGRect iconF;
/**
 *  昵称的frame
 */
@property (nonatomic, assign) CGRect nameF;
/**
 *  vip的frame
 */
@property (nonatomic, assign) CGRect vipF;
/**
 *  正文的frame
 */
@property (nonatomic, assign) CGRect introF;
/**
 *  配图的frame
 */
@property (nonatomic, assign) CGRect pictrueF;
/**
 *  行高
 */
@property (nonatomic, assign) CGFloat cellHeight;

/**
 *  模型数据
 */
@property (nonatomic, strong) Status *status;

@end
