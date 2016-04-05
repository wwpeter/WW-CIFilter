//
//  AppDelegate.m
//  miniFilter
//
//  Created by qianfeng01 on 15/9/22.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import "AppDelegate.h"
#import "PageViewController.h"
#import "ViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>
#import "WeiboSDK.h"
#import "WXApi.h"
#import "Header.h"
@interface AppDelegate ()<WeiboSDKDelegate,WXApiDelegate>

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //实现 开机引导
    //如果程序是第一次执行 那么 加载开机引导页  把PageViewController根视图控制器
    //如果是第二次以后 那么都是加载RootViewController 把它作为window的根视图控制器
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL isOpen = [ud boolForKey:@"isOpen"];
    //打印存储plist文件的路径
//        NSString *path=[NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES)lastObject];
//        NSLog(@"%@",path);
    UIStoryboard * story = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (isOpen == NO) {//NO表示程序没有打开过 ，程序是第一次执行
        PageViewController *page = [story instantiateViewControllerWithIdentifier:@"page"];
        self.window.rootViewController = page;
    }else {
        //程序不是第一次执行
        ViewController * vc = [story instantiateViewControllerWithIdentifier:@"st"];
        self.window.rootViewController = vc;
    }
    //程序已经执行过那么就本地保存下
    [ud setBool:YES forKey:@"isOpen"];
    [ud synchronize];
    
    
    // Override point for customization after application launch.
  //  self.window.backgroundColor = [UIColor whiteColor];
    //[self.window makeKeyAndVisible];
    
    [WXApi registerApp:WXAppKey];
    [WeiboSDK enableDebugMode:YES];
    [WeiboSDK registerApp:XLkAppKey];

    return YES;
}
-(void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    
}
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    
}
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([[url absoluteString]hasPrefix:@"tencent"]) {
        return [TencentOAuth HandleOpenURL:url];
    }else if ([[url absoluteString]hasPrefix:@"wb"])
    {
    return [WeiboSDK handleOpenURL:url delegate:self];
        
    }else
    return [WXApi handleOpenURL:url delegate:self];
 }


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
