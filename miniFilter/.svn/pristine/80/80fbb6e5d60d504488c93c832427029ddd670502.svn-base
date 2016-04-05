//
//  HyyUIButton.m
//  分享测试
//
//  Created by qianfeng01 on 15/9/29.
//  Copyright (c) 2015年 侯园园. All rights reserved.
//

#import "HyyUIButton.h"

@implementation HyyUIButton
-(void)layoutSubviews{
    [super layoutSubviews];
    //调整image的中心位置
    CGPoint center=self.imageView.center;
    center.x=self.frame.size.width/2;
    center.y=self.imageView.frame.size.height/2;
    
    self.imageView.center=center;
   
    //调整text的中心位置
    CGRect titleFrame=self.titleLabel.frame;
    titleFrame.origin.x=0;
    titleFrame.origin.y=CGRectGetMaxY(self.imageView.frame)+5;
    titleFrame.size.width=self.frame.size.width;
    self.titleLabel.frame=titleFrame;
    self.titleLabel.textAlignment =NSTextAlignmentCenter;
    self.titleLabel.textColor=[UIColor blackColor];
}
@end
