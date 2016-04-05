//
//  LJAdjustmentTool.h
//  miniFilter
//
//  Created by qianfeng on 15/10/6.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LJAdjustmentTool : NSObject
{
    UIImage *_thumnailImage;
}

@property (nonatomic , weak)UIImage *originalImage;
@property (nonatomic , strong)UIImage *nowImg;
@property (nonatomic , weak)UIImageView *showImgV;

@property (nonatomic , strong)UIImage *thumnailImage;

@property (nonatomic , weak)UISlider *saturationSlider;
@property (nonatomic , weak)UISlider *brightnessSlider;
@property (nonatomic , weak)UISlider *contrastSlider;
- (void)setup;
@end
