//
//  FilterManager.h
//  FilterSample
//
//  Created by 卢天翊 on 15/9/21.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPUImage.h"
#import "EZInputPicture.h"
#import "EZOutputView.h"

@interface EZFilterManager : NSObject

@property (nonatomic, strong, readonly) EZInputPicture * inputPicture; // 被渲染的图片
@property (nonatomic, strong, readonly) EZOutputView   * outputView;   // 渲染后的图片的容器

/**
 *  初始化方式
 *
 *  @param input  被渲染的图片
 *  @param output 渲染后的图片的容器
 */
- (instancetype)initWithInput:(EZInputPicture *)input output:(EZOutputView *)output;
+ (instancetype)managerWithInput:(EZInputPicture *)input output:(EZOutputView *)output;

#pragma mark - Function
/**
 *  渲染单个图片的滤镜
 *
 *  @param filter 滤镜
 */
- (void)processImageWithFilter:(GPUImageFilter *)filter completionHandler:(void(^)(void))completionHandler;

/**
 *  渲染多个图片的滤镜
 *
 *  @param filters 多个滤镜的数组
 */
- (void)compositeFilters:(NSArray *)filters completionHandler:(void(^)(GPUImageFilterPipeline * filterPipeline))completionHandler;

# pragma mark - Filter
/**
 *  水晶球滤镜
 */
+ (GPUImageFilter *)glassSphereFilter;

/**
 *  褐色滤镜
 */
+ (GPUImageFilter *)sepiaFilter;

/**
 *  RGB滤镜 RGB峰值为1.0
 *
 *  @param red   红色
 *  @param green 绿色
 *  @param blue  蓝色
 */
+ (GPUImageFilter *)RGBFilterWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

/**
 *  卡通滤镜
 *
 *  @param threshold          阈值默认 0.2
 *  @param quantizationLevels 量子化等级默认 10.0
 */
+ (GPUImageFilter *)toonFilterWithThreshold:(CGFloat)threshold quantizationLevels:(CGFloat)quantizationLevels;

/**
 *  黑白亮度平均阈值
 *
 *  @param multiplier 阈值乘数, 默认1.0
 */
+ (GPUImageFilter *)averageLuminanceThresholdFilterWithMultiplier:(CGFloat)multiplier;

/**
 *  素描滤镜
 */
+ (GPUImageFilter *)sketchFilter;

/**
 *  对比度滤镜
 *
 *  @param contrast 对比度等级: 0.0 ~ 4.0 (1.0为正常等级)
 */
+ (GPUImageFilter *)contrastFilterWithContrast:(CGFloat)contrast;

/**
 *  曝光滤镜
 *
 *  @param exposure 曝光等级: -10.0 ~ 10.0
 */
+ (GPUImageFilter *)exposureFilterWithExposure:(CGFloat)exposure;

/**
 *  高亮滤镜
 *
 *  @param brightness 高亮值为: 0.0 ~ 1.0
 */
+ (GPUImageFilter *)brightnessFilterWithBrightness:(CGFloat)brightness;

/**
 *  模糊滤镜
 *
 *  @param pixels 模糊半径的像素点
 */
+ (GPUImageFilter *)blurFilterWithRadius:(CGFloat)pixels;

/**
 *  反色滤镜
 */
+ (GPUImageFilter *)colorInvertFilter;

@end
