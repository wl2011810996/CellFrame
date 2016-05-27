//
//  MyCell.m
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import "MyCell.h"
#import "Status.h"
#import "StatusFrame.h"

#define WLNameFont [UIFont systemFontOfSize:15]
#define WLTextFont [UIFont systemFontOfSize:16]

@interface MyCell()

/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;
/**
 *  vip
 */
@property (nonatomic, weak) UIImageView *vipView;
/**
 *  配图
 */
@property (nonatomic, weak) UIImageView *pictureView;
/**
 *  昵称
 */
@property (nonatomic, weak) UILabel *nameLabel;
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *introLabel;

@end

@implementation MyCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    // NSLog(@"cellForRowAtIndexPath");
    static NSString *identifier = @"status";
    // 1.缓存中取
    MyCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[MyCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 让自定义Cell和系统的cell一样, 一创建出来就拥有一些子控件提供给我们使用
        // 1.创建头像
        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        // 2.创建昵称
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = WLNameFont;
        // nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:nameLabel];
        self.nameLabel = nameLabel;
        
        // 3.创建vip
        UIImageView *vipView = [[UIImageView alloc] init];
        vipView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipView];
        self.vipView = vipView;
        
        // 4.创建正文
        UILabel *introLabel = [[UILabel alloc] init];
        introLabel.font = WLTextFont;
        introLabel.numberOfLines = 0;
        // introLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:introLabel];
        self.introLabel = introLabel;
        
        // 5.创建配图
        UIImageView *pictureView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
    }
    return self;
}

-(void)setStatusFrame:(StatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    // 1.给子控件赋值数据
    [self settingData];
    // 2.设置frame
    [self settingFrame];
    
}

/**
 *  设置子控件的数据
 */
- (void)settingData
{
    Status *status = self.statusFrame.status;
    
    // 设置头像
    self.iconView.image = [UIImage imageNamed:status.icon];
    // 设置昵称
    self.nameLabel.text = status.name;
    // 设置vip
    if (status.vip) {
        self.vipView.hidden = NO;
        self.nameLabel.textColor = [UIColor redColor];
    }else
    {
        self.vipView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    // 设置内容
    self.introLabel.text = status.text;
    
    // 设置配图
    if (status.picture) {// 有配图
        self.pictureView.image = [UIImage imageNamed:status.picture];
        self.pictureView.hidden = NO;
    }else
    {
        self.pictureView.hidden = YES;
    }
}


/**
 *  设置子控件的frame
 */
- (void)settingFrame
{
    
    // 设置头像的frame
    self.iconView.frame = self.statusFrame.iconF;
    
    // 设置昵称的frame
    self.nameLabel.frame = self.statusFrame.nameF;
    
    // 设置vip的frame
    self.vipView.frame = self.statusFrame.vipF;
    
    // 设置正文的frame
    self.introLabel.frame = self.statusFrame.introF;
    
    // 设置配图的frame
    
    if (self.statusFrame.status.picture) {// 有配图
        self.pictureView.frame = self.statusFrame.pictrueF;
    }
}

@end
