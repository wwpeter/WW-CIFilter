//
//  LJBlurTool.h
//  miniFilter
//
//  Created by qianfeng on 15/10/5.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HUMSlider.h"
@interface LJBlurTool : NSObject
{
//    UIImage *_originalImage;
//    UIImage *_thumnailImage;
    UIImage *_blurImage;
    
   // HUMSlider *_blurSlider;
    UIScrollView *_menuScroll;
    
    UIView *_handlerView;

}
@property (nonatomic,weak) UIImage *originalImage;
@property (nonatomic,weak) UIImage *thumnailImage;
@property (nonatomic,strong) UIImage *blurImage;
@property (strong,nonatomic)UIImage *nowImage;
@property (weak,nonatomic)UIImageView *showImgV;
@property (weak,nonatomic)UIView *bView;

@property (nonatomic,weak) HUMSlider *blurSlider;
@property (nonatomic,strong) UIScrollView *menuScroll;

-(void)setup;
@end
