//
//  HYYShareView.h
//  分享测试
//
//  Created by qianfeng01 on 15/9/29.
//  Copyright (c) 2015年 侯园园. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WXApi.h"
#import "AppDelegate.h"
#import "WeiboSDK.h"
#import <TencentOpenAPI/QQApiInterface.h>
#import <TencentOpenAPI/sdkdef.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/TencentOAuthObject.h>

typedef NS_ENUM(NSInteger, TYPE) {
    TYPE_SHARE,
    TYPE_REGISTER
};


typedef NS_ENUM(NSInteger, REGISTER_ITEM){
    REGISTER_ITEM_QQ,
    REGISTER_ITEM_WEIXIN,
    REGISTER_ITEM_XINLANG
};


typedef NS_ENUM(NSInteger, SHARE_ITEM) {
//微信会话
    SHARE_ITEM_WEIXIN_SESSION,
//微信朋友圈
    SHARE_ITEM_WEIXIN_TIMELINE,
//QQ会话
    SHARE_ITEM_QQ,
//QQ空间
    SHARE_ITEM_QZONE,
//新浪微博
    SHARE_ITEM_WEIBO

};


@interface HYYShareView : UIView<WXApiDelegate,WeiboSDKDelegate,WBHttpRequestDelegate ,TencentSessionDelegate,TCAPIRequestDelegate >
{
    NSMutableArray * iconList;
    NSMutableArray * textList;
    enum WXScene _scene;
}
@property(strong,nonatomic)TencentOAuth *tencentOAuth;
@property (nonatomic, retain)NSArray* permissons;
@property(nonatomic,copy)NSString  * shareTitle;
@property(nonatomic,copy)NSString  * shareText;
@property(nonatomic,copy)NSString  * shareUrl;
@property(nonatomic,copy)NSString  * shareImageName;
@property(nonatomic,copy)NSString  * shareImageUrl;
@property(nonatomic,strong)UIImage * shareImage;
@property(nonatomic,assign)TYPE type;
-(instancetype)initWithFrame:(CGRect)frame andType:(TYPE)type;
@end
