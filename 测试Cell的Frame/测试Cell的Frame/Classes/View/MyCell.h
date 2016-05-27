//
//  MyCell.h
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StatusFrame;

@interface MyCell : UITableViewCell

@property (nonatomic,strong)StatusFrame *statusFrame;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
