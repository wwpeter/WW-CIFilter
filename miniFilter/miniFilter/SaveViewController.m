//
//  SaveViewController.m
//  miniFilter
//
//  Created by qianfeng01 on 15/9/28.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import "SaveViewController.h"

@interface SaveViewController ()

@end

@implementation SaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide]; 
}
- (IBAction)CancelBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
