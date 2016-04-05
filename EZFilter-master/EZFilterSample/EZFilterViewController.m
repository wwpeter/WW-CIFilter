//
//  EZFilterViewController.m
//  EZFilterSample
//
//  Created by 卢天翊 on 15/9/21.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import "EZFilterViewController.h"
#import "EZFilterManager.h"

@interface EZFilterViewController ()

@end

@implementation EZFilterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    EZInputPicture * inputPicture   = [[EZInputPicture alloc] initWithImage:[UIImage imageNamed:@"test"]];
    EZOutputView   * outputView     = [[EZOutputView alloc] initWithFrame:self.view.bounds];
    
    self.view = outputView;
    
    EZFilterManager * filterManager = [EZFilterManager managerWithInput:inputPicture output:outputView];
    
    [filterManager processImageWithFilter:self.imageFilter completionHandler:^{
        
        NSLog(@"加载完成");
    }];

//    [filterManager compositeFilters:@[[filterManager sepiaFilter], [filterManager contrastFilterWithContrast:2.0]] completionHandler:^(GPUImageFilterPipeline *filterPipeline) {
//       
//        NSLog(@"组合滤镜加载完成");
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
