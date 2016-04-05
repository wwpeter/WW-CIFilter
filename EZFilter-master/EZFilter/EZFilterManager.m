//
//  FilterManager.m
//  FilterSample
//
//  Created by 卢天翊 on 15/9/21.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import "EZFilterManager.h"

@interface EZFilterManager ()

@end

@implementation EZFilterManager

@synthesize inputPicture, outputView;

+ (instancetype)managerWithInput:(EZInputPicture *)input output:(EZOutputView *)output {

    return [[self alloc] initWithInput:input output:output];
}

- (instancetype)initWithInput:(EZInputPicture *)input output:(EZOutputView *)output {
    self = [super init];
    if (self) {
        inputPicture = input;
        outputView = output;
    }
    return self;
}

#pragma mark - glass Sphere Filter

+ (GPUImageFilter *)glassSphereFilter {
        
    return [[GPUImageGlassSphereFilter alloc] init];
}

#pragma mark - Sepia Filter

+ (GPUImageFilter *)sepiaFilter {
    
    return [[GPUImageSepiaFilter alloc] init];
}

#pragma mark - RGB Filter

+ (GPUImageFilter *)RGBFilterWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue {
    
    GPUImageRGBFilter * RGBFilter = [[GPUImageRGBFilter alloc] init];
    
    RGBFilter.red = red;
    RGBFilter.green = green;
    RGBFilter.blue = blue;
    
    return RGBFilter;
}

#pragma mark - toon Filter

+ (GPUImageFilter *)toonFilterWithThreshold:(CGFloat)threshold quantizationLevels:(CGFloat)quantizationLevels  {
    
    GPUImageToonFilter * toonFilter = [[GPUImageToonFilter alloc] init];
    toonFilter.threshold = threshold;
    toonFilter.quantizationLevels = quantizationLevels;
    
    return toonFilter;
}

#pragma mark - Average Luminance Threshold

+ (GPUImageFilter *)averageLuminanceThresholdFilterWithMultiplier:(CGFloat)multiplier {
    
    GPUImageAverageLuminanceThresholdFilter * averageLuminanceThresholdFilter = [[GPUImageAverageLuminanceThresholdFilter alloc] init];
    averageLuminanceThresholdFilter.thresholdMultiplier = multiplier;
    
    return  (GPUImageFilter *)averageLuminanceThresholdFilter;
}

#pragma mark - Sketch Filter

+ (GPUImageFilter *)sketchFilter {
    
    return [[GPUImageSketchFilter alloc] init];
}

#pragma mark - Contrast Filter

+ (GPUImageFilter *)contrastFilterWithContrast:(CGFloat)contrast {
    
    GPUImageContrastFilter * contrastFilter = [[GPUImageContrastFilter alloc] init];
    contrastFilter.contrast = contrast;
    
    return contrastFilter;
}

#pragma mark - Exposure Filter

+ (GPUImageFilter *)exposureFilterWithExposure:(CGFloat)exposure {
    
    GPUImageExposureFilter * exposureFilter = [[GPUImageExposureFilter alloc] init];
    exposureFilter.exposure = exposure;
    
    return exposureFilter;
}

#pragma mark - Brightness Filter

+ (GPUImageFilter *)brightnessFilterWithBrightness:(CGFloat)brightness {
    
    GPUImageBrightnessFilter * brightnessFilter = [[GPUImageBrightnessFilter alloc] init];
    brightnessFilter.brightness = brightness;
    
    return brightnessFilter;
}

#pragma mark - Blur Filter

+ (GPUImageFilter *)blurFilterWithRadius:(CGFloat)pixels {
    
    GPUImageiOSBlurFilter * blurFilter = [[GPUImageiOSBlurFilter alloc] init];
    blurFilter.blurRadiusInPixels = pixels;
    
    return (GPUImageFilter *)blurFilter;
}

#pragma mark - Color Invert Filter

+ (GPUImageFilter *)colorInvertFilter {
    
    return [[GPUImageColorInvertFilter alloc] init];
}

#pragma mark - Process Image

- (void)processImageWithFilter:(GPUImageFilter *)filter completionHandler:(void(^)(void))completionHandler {
    
    [inputPicture addTarget:filter];
    [filter addTarget:outputView];
    
    [(GPUImagePicture *)inputPicture processImageWithCompletionHandler:^{
        
        if (completionHandler) {
            completionHandler();
        }
    }];
}

- (void)compositeFilters:(NSArray *)filters completionHandler:(void(^)(GPUImageFilterPipeline * filterPipeline))completionHandler {
    
    GPUImageFilterPipeline * filterPipeline = [[GPUImageFilterPipeline alloc] initWithOrderedFilters:filters input:inputPicture output:outputView];
    
    [(GPUImagePicture *)inputPicture processImageWithCompletionHandler:^{
        
        if (completionHandler) {
            completionHandler(filterPipeline);
        }
    }];
}


@end
