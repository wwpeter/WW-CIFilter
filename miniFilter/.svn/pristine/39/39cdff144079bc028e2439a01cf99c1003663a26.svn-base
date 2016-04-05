//
//  LJRotateTool.m
//  miniFilter
//
//  Created by qianfeng01 on 15/10/6.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import "LJRotateTool.h"

@implementation LJRotateTool

//左旋转90度
+ (UIImage*)rotate90CounterClockwise:(UIImage *)img
{
    UIImage *image = nil;
    switch (img.imageOrientation) {
        case UIImageOrientationUp:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
            break;
        }
        case UIImageOrientationDown:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRight];
            break;
        }
        case UIImageOrientationLeft:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDown];
            break;
        }
        case UIImageOrientationRight:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUp];
            break;
        }
        case UIImageOrientationUpMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRightMirrored];
            break;
        }
        case UIImageOrientationDownMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeftMirrored];
            break;
        }
        case UIImageOrientationLeftMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
            break;
        }
        case UIImageOrientationRightMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
            break;
        }
        default:
            break;
    }
    
    return image;
}

//右旋转90度
+ (UIImage*)rotate90Clockwise:(UIImage *)img
{
    UIImage *image = nil;
    switch (img.imageOrientation) {
        case UIImageOrientationUp:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRight];
            break;
        }
        case UIImageOrientationDown:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
            break;
        }
        case UIImageOrientationLeft:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUp];
            break;
        }
        case UIImageOrientationRight:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDown];
            break;
        }
        case UIImageOrientationUpMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeftMirrored];
            break;
        }
        case UIImageOrientationDownMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRightMirrored];
            break;
        }
        case UIImageOrientationLeftMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
            break;
        }
        case UIImageOrientationRightMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
            break;
        }
        default:
            break;
    }
    
    return image;
}

//水平翻转
+ (UIImage*)flipHorizontal:(UIImage *)img
{
    UIImage *image = nil;
    switch (img.imageOrientation) {
        case UIImageOrientationUp:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
            break;
        }
        case UIImageOrientationDown:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
            break;
        }
        case UIImageOrientationLeft:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRightMirrored];
            break;
        }
        case UIImageOrientationRight:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeftMirrored];
            break;
        }
        case UIImageOrientationUpMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUp];
            break;
        }
        case UIImageOrientationDownMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDown];
            break;
        }
        case UIImageOrientationLeftMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRight];
            break;
        }
        case UIImageOrientationRightMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
            break;
        }
        default:
            break;
    }
    
    return image;
}

//垂直翻转
+ (UIImage*)flipVertical:(UIImage *)img
{
    UIImage *image = nil;
    switch (img.imageOrientation) {
        case UIImageOrientationUp:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDownMirrored];
            break;
        }
        case UIImageOrientationDown:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUpMirrored];
            break;
        }
        case UIImageOrientationLeft:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeftMirrored];
            break;
        }
        case UIImageOrientationRight:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRightMirrored];
            break;
        }
        case UIImageOrientationUpMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationDown];
            break;
        }
        case UIImageOrientationDownMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationUp];
            break;
        }
        case UIImageOrientationLeftMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationLeft];
            break;
        }
        case UIImageOrientationRightMirrored:
        {
            image = [UIImage imageWithCGImage:img.CGImage scale:1 orientation:UIImageOrientationRight];
            break;
        }
        default:
            break;
    }
    
    return image;
}


@end
