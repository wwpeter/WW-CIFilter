//
//  LJFilterTool.h
//  miniFilter
//
//  Created by qianfeng on 15/10/3.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

static const CGFloat kCLImageToolAnimationDuration = 0.3;
static const CGFloat kCLImageToolFadeoutDuration   = 0.2;


@interface LJFilterTool : NSObject
{
//    UIImage *_originalImage;
//    UIImage *_thumnailImage;
    NSArray *_filters;
//    UIScrollView *_filterScroll;
}
@property (weak,nonatomic)UIImage *originalImage;
@property (weak,nonatomic)UIImage *thumnailImage;
@property (strong,nonatomic)UIImage *nowImage;

@property (strong,nonatomic)NSArray *filters;
@property (weak,nonatomic)UIScrollView *filterScroll;
@property (weak,nonatomic)UIImageView *showImg;
@property (weak,nonatomic)UIView *bView;

- (void)setup;

@end
