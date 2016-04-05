//
//  EZFilterTableViewController.m
//  EZFilterSample
//
//  Created by 卢天翊 on 15/10/14.
//  Copyright © 2015年 Lanou3G. All rights reserved.
//

#import "EZFilterTableViewController.h"
#import "EZFilterViewController.h"
#import "EZFilterManager.h"
//#import <objc/runtime.h>
#import <objc/message.h>

@interface EZFilterTableViewController ()

@property (nonatomic, strong) NSArray * filterList;

@end

@implementation EZFilterTableViewController

@synthesize filterList;

static NSString * identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"滤镜列表";
    
    filterList = @[@{@"display": @"水晶球滤镜", @"method": @"glassSphereFilter"},
                   @{@"display": @"褐色滤镜", @"method": @"sepiaFilter"},
                   @{@"display": @"素描滤镜", @"method": @"sketchFilter"},
                   @{@"display": @"黑白亮度平均阈值滤镜", @"method": @"averageLuminanceThresholdFilterWithMultiplier:", @"param": @1.0},
                   @{@"display": @"反色滤镜", @"method": @"colorInvertFilter"},
                   @{@"display": @"高亮滤镜", @"method": @"brightnessFilterWithBrightness:", @"param": @0.4}];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return filterList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    [cell.textLabel setText:filterList[indexPath.row][@"display"]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    EZFilterViewController * filterVC = [[EZFilterViewController alloc] init];
   
    NSDictionary * methodDic = filterList[indexPath.row];
    
//    id obj = ((id (*)(Class, SEL op, ...))objc_msgSend)([EZFilterManager class], NSSelectorFromString(@"RGBFilterWithRed:green:blue:"), 0.2f, 0.4f, 0.7f);
    
    GPUImageFilter * obj = ((id (*)(Class, SEL op, ...))objc_msgSend)([EZFilterManager class], NSSelectorFromString(methodDic[@"method"]), [methodDic[@"param"] floatValue]);
    
    filterVC.imageFilter = obj;
    
    [self.navigationController pushViewController:filterVC animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
