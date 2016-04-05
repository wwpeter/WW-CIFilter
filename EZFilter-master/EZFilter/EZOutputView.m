//
//  EZOutputView.m
//  FilterSample
//
//  Created by 卢天翊 on 15/9/21.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import "EZOutputView.h"

@implementation EZOutputView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.fillMode = kGPUImageFillModePreserveAspectRatioAndFill;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
