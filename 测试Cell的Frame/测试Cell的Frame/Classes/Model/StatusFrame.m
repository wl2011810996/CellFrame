
//
//  StatusFrame.m
//  测试Cell的Frame
//
//  Created by 荣耀iMac on 16/5/23.
//  Copyright © 2016年 GloriousSoftware. All rights reserved.
//

#import "StatusFrame.h"
#import "Status.h"

#define WLNameFont [UIFont systemFontOfSize:15]
#define WLTextFont [UIFont systemFontOfSize:16]

@implementation StatusFrame

-(void)setStatus:(Status *)status
{
    _status = status;
    
    CGFloat padding = 10;
    
    CGFloat iconViewX = padding;
    CGFloat iconViewY = padding;
    CGFloat iconViewW = 30;
    CGFloat iconViewH = 30;
    self.iconF = CGRectMake(iconViewX, iconViewY, iconViewW, iconViewH);
    
    CGFloat namelabelX = CGRectGetMaxX(self.iconF) + padding;
    CGSize nameSize = [self sizeWithString:_status.name font:WLNameFont maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)];
    CGFloat namelabelH = nameSize.height;
    CGFloat namelabelY = iconViewY + (iconViewH - namelabelH)* 0.5;
    CGFloat namelabelW = nameSize.width;
    self.nameF = CGRectMake(namelabelX, namelabelY, namelabelW, namelabelH);
    
    // 设置vip的frame
    CGFloat vipViewX = CGRectGetMaxX(self.nameF) + padding;
    CGFloat vipViewY = namelabelY;
    CGFloat vipViewW = 14;
    CGFloat vipViewH = 14;
    self.vipF = CGRectMake(vipViewX, vipViewY, vipViewW, vipViewH);
    
    // 设置正文的frame
    CGFloat introLabelX = iconViewX;
    CGFloat introLabelY = CGRectGetMaxY(self.iconF) + padding;
    CGSize textSize =  [self sizeWithString:_status.text font:WLTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    
    CGFloat introLabelW = textSize.width;
    CGFloat introLabelH = textSize.height;
    
    self.introF = CGRectMake(introLabelX, introLabelY, introLabelW, introLabelH);
    
    CGFloat cellHeight = 0;
    if (_status.picture) {
        CGFloat pictureViewX = iconViewX;
        CGFloat pictureViewY = CGRectGetMaxY(self.introF) + padding;
        CGFloat pictureViewW = 100;
        CGFloat pictureViewH = 100;
        self.pictrueF = CGRectMake(pictureViewX, pictureViewY, pictureViewW, pictureViewH);
        
        self.cellHeight = CGRectGetMaxY(self.pictrueF) + padding;
    }else
    {
        self.cellHeight = CGRectGetMaxY(self.introF) + padding;
    }
}

-(CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName :font};
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
