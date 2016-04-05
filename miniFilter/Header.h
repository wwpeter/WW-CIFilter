//
//  Header.h
//  分享测试
//
//  Created by qianfeng01 on 15/9/29.
//  Copyright (c) 2015年 侯园园. All rights reserved.
//

#ifndef _____Header_h
#define _____Header_h
//新浪appkey
#define XLkAppKey (@"278333670")
#define XLkRedirectURL (@"http://api.weibo.com/oauth2/default.html")
//tencent appkey
#define TENCENTKEY (@"1104800257")
#define TENCENTAppKey (@"tencent1104800257");
//微信appkey
#define WXAppKey (@"wx470427b1e01cca56")
//主屏幕宽度
#define SIZE_OF_SCREEN [[UIScreen mainScreen] bounds].size
//每一项的宽度
#define itemWidth ((CGFloat)[UIScreen mainScreen].bounds.size.width/4.5)
//每一项的高度
#define itemHeight ((CGFloat)[UIScreen mainScreen].bounds.size.width/4.5)
//水平间隔
#define itemHorMargin ((CGFloat)[UIScreen mainScreen].bounds.size.width/18.7)
//垂直间隔
#define itemVerMargin ((CGFloat)[UIScreen mainScreen].bounds.size.width/18.7)
//每一行的item个数
#define numberOfItemInLine (3)
#endif
