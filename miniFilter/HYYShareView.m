//
//  HYYShareView.m
//  分享测试
//
//  Created by qianfeng01 on 15/9/29.
//  Copyright (c) 2015年 侯园园. All rights reserved.
//

#import "HYYShareView.h"
#import "Header.h"
#import "HyyUIButton.h"
#import "Header.h"
#import <CoreGraphics/CoreGraphics.h>
#import "WZLBadgeImport.h"

@implementation HYYShareView
-(instancetype)initWithFrame:(CGRect)frame andType:(TYPE)type{
    self=[super initWithFrame:frame];
     if (self) {
         self.type=type;
        [self loadData];
        [self initItem];
        self.alpha=0;
        [UIView animateWithDuration:1 animations:^{
            self.alpha = 1.0;
        }];
    }
    return self;
}
//加载button视图
-(void)initItem{
    //设置自身背景色
    self.backgroundColor=[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
    //给自己添加手势消除界面
    UITapGestureRecognizer * tapGR = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeShareView)];
    [self addGestureRecognizer:tapGR];
     self.userInteractionEnabled=YES;
    
    
   //创建分享视图
    CGFloat bgViewWIdth =itemWidth *numberOfItemInLine+itemHorMargin*(numberOfItemInLine +1);
    CGFloat bgViewHeight =itemHeight*2+3*itemVerMargin;
    CGFloat bgViewX = (SIZE_OF_SCREEN.width -bgViewWIdth)/2;
    CGFloat bgViewY = (SIZE_OF_SCREEN.height -bgViewHeight)/2;
    UIView * shareActionView =[[UIView alloc]initWithFrame:CGRectMake(bgViewX,bgViewY , bgViewWIdth,bgViewHeight)];
    shareActionView.layer.cornerRadius=5;
    shareActionView.layer.masksToBounds=YES;
    [self addSubview:shareActionView];
    shareActionView.backgroundColor = [UIColor whiteColor];
    for (int i=0; i<iconList.count; i++) {
        UIImage *img=[UIImage imageNamed:iconList[i]];
        int row =i/numberOfItemInLine;
        int col =i%numberOfItemInLine;
        CGFloat x=(itemWidth +itemHorMargin)*col+itemHorMargin;
        CGFloat y= (itemHeight +itemVerMargin)*row +itemVerMargin;
        HyyUIButton * oneButton=[[HyyUIButton alloc]initWithFrame:CGRectMake(x,y ,itemWidth ,itemHeight )];
        oneButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [oneButton setImage:img forState:UIControlStateNormal];
        [oneButton setTitle:textList[i]  forState:UIControlStateNormal];
        [oneButton addTarget:self action:@selector(clickedButton:) forControlEvents:UIControlEventTouchUpInside];
        
        if ([textList[i] isEqualToString:NSLocalizedString(@"微信好友", nil)]) {
            oneButton.tag =SHARE_ITEM_WEIXIN_SESSION;
        }else if([textList[i] isEqualToString:NSLocalizedString(@"朋友圈", nil)]){
            
            oneButton.tag = SHARE_ITEM_WEIXIN_TIMELINE;
            [oneButton showBadgeWithStyle:WBadgeStyleNew value:0 animationType:WBadgeAnimTypeBreathe];
            oneButton.badgeCenterOffset=CGPointMake(-17, 3);
        }else if([textList[i] isEqualToString:NSLocalizedString(@"QQ", nil)]){
            
            oneButton.tag = SHARE_ITEM_QQ;
            
        }else if([textList[i] isEqualToString:NSLocalizedString(@"QQ空间", nil)]){
            
            oneButton.tag = SHARE_ITEM_QZONE;
            
        }else if([textList[i] isEqualToString:NSLocalizedString(@"微博", nil)]){
            
           oneButton.tag = SHARE_ITEM_WEIBO;
            
        }
        [shareActionView addSubview:oneButton];
   }
   
   

}
-(void)loadData{
    textList=[[NSMutableArray alloc]init];
    iconList =[[NSMutableArray alloc]init];
    _tencentOAuth =[[TencentOAuth alloc]initWithAppId:TENCENTKEY andDelegate:self];
    //初始化redirectURL
    _tencentOAuth.redirectURI=@"www.qq.com";
    //设置应用需要用户授权的API列表
    _permissons=[[NSArray alloc]initWithObjects:@"get_user_info", @"get_simple_userinfo", @"add_t", nil];
    
    if (self.type==TYPE_SHARE) {
    [iconList addObject:@"icon_share_moment@2x.png"];
    [textList addObject:NSLocalizedString(@"朋友圈", nil)];
    [iconList addObject:@"icon_share_qzone@2x.png"];
    [textList addObject:NSLocalizedString(@"QQ空间", nil)];
    }
    [iconList addObject:@"icon_wechat@2x.png"];
    [textList addObject:NSLocalizedString(@"微信好友", nil)];
    [iconList addObject:@"icon_qq@2x.png"];
    [textList addObject:NSLocalizedString(@"QQ", nil)];
    [iconList addObject:@"icon_webo@2x.png"];
    [textList addObject:NSLocalizedString(@"微博", nil)];
}
-(void)clickedButton:(HyyUIButton *)sender{
    if ( sender.tag == SHARE_ITEM_WEIXIN_SESSION ) {
        if (self.type==TYPE_SHARE) {
            [self shareToWeixinSession];
        }else{
            [self loginWithWeiXin];
        }
        
        
    }else if ( sender.tag == SHARE_ITEM_WEIXIN_TIMELINE ) {
        [sender clearBadge];
        [self shareToWeixinTimeline];
        
    }else if ( sender.tag == SHARE_ITEM_QQ ) {
        if (self.type==TYPE_SHARE) {
           [self shareToQQ];
        }else{
            
            [self loginWithQQ];
        }
        
        
    }else if ( sender.tag == SHARE_ITEM_QZONE ) {
        
        [self shareToQzone];
        
    }else if ( sender.tag == SHARE_ITEM_WEIBO ) {
        
        if (self.type==TYPE_SHARE) {
            [self shareToWeibo];
        }else{
            [self loginWithWeiBo];
            
        }
     }
}

-(void)loginWithWeiXin{


        SendAuthReq* req = [[SendAuthReq alloc] init] ;
        req.scope = @"snsapi_message,snsapi_userinfo,snsapi_friend,snsapi_contact"; // @"post_timeline,sns"
        req.state = @"xxx";
        req.openID = @"0c806938e2413ce73eef92cc3";
      [WXApi sendReq:req];
}

-(void)shareToWeixinSession{
    
    BOOL canOpenWeiXin =[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]];
    
    if (!canOpenWeiXin ) {
        
        [self showWithMessage:@"请确定你是否安装了微信"];
        return;
    }
    
    WXMediaMessage *message = [WXMediaMessage message];
    WXImageObject *object=[WXImageObject object];
    NSData * data;
    if (!self.shareImage) {
        NSString * filePath = [[NSBundle mainBundle]pathForResource:self.shareImageName ofType:nil];
        data = [NSData dataWithContentsOfFile:filePath];
    }
    else{
     
        data =UIImageJPEGRepresentation(self.shareImage, 1);
    }
  object.imageData=data;
    message.mediaObject=object;
    SendMessageToWXReq * req =[[SendMessageToWXReq alloc]init];
    req.bText=NO;
    req.message=message;
    req.scene=WXSceneSession;
    [WXApi sendReq:req];
    
}
-(void)shareToWeixinTimeline{
    BOOL canOpenWeiXin =[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]];
    
    if (!canOpenWeiXin ) {
        
        [self showWithMessage:@"请确定你是否安装了微信"];
        return;
    }

    WXMediaMessage *message = [WXMediaMessage message];
    WXImageObject *object=[WXImageObject object];
    NSData * data;
    if (!self.shareImage) {
        NSString * filePath = [[NSBundle mainBundle]pathForResource:self.shareImageName ofType:nil];
        data = [NSData dataWithContentsOfFile:filePath];
    }
    else{
        
        data =UIImageJPEGRepresentation(self.shareImage, 1);
    }
    object.imageData=data;
    message.mediaObject=object;
    SendMessageToWXReq * req =[[SendMessageToWXReq alloc]init];
    req.bText=NO;
    req.message=message;
    req.scene=WXSceneTimeline;
    [WXApi sendReq:req];



}
//分享到微信的回调消息

-(void)onReq:(BaseReq *)req{

    NSLog(@"%@",req);
}
-(void)onResp:(BaseResp *)resp{
    NSLog(@"%@",resp);
}
-(void)loginWithQQ{
[_tencentOAuth authorize:_permissons inSafari:NO];
}

-(void)shareToQQ{

    
    
    BOOL canOpenQQ =[[UIApplication sharedApplication]canOpenURL:[NSURL URLWithString:@"QQ://"]];
    NSLog(@"------%d",canOpenQQ);
    if (canOpenQQ) {
        NSData * data;
        if (!self.shareImage) {
            NSString * filePath = [[NSBundle mainBundle]pathForResource:self.shareImageName ofType:nil];
            data = [NSData dataWithContentsOfFile:filePath];
        }
        else{
            
            data =UIImageJPEGRepresentation(self.shareImage, 1);
        }
        QQApiImageObject * imageObject =[QQApiImageObject objectWithData:data previewImageData:data title:self.shareTitle description:self.shareText ];
        SendMessageToQQReq *req =[SendMessageToQQReq reqWithContent:imageObject];
        QQApiSendResultCode send=[QQApiInterface sendReq:req];
        NSLog(@"%d",send);
        
    }else{
       
    
    
    QQApiNewsObject *newsObj =[QQApiNewsObject  objectWithURL:[NSURL URLWithString:self.shareUrl] title:self.shareTitle description:self.shareText previewImageURL:[NSURL URLWithString:self.shareImageUrl]];
    SendMessageToQQReq *req =[SendMessageToQQReq reqWithContent:newsObj];
    QQApiSendResultCode  sent=[QQApiInterface  sendReq:req];
    if (sent==0) {
//        [self showWithMessage:@"success"];
         NSLog(@"%d",sent);
    }else {
     NSLog(@"%d",sent);
    }
    
    }
}
-(void)shareToQzone{
    QQApiNewsObject *newsObj =[QQApiNewsObject  objectWithURL:[NSURL URLWithString:self.shareUrl] title:self.shareTitle description:self.shareText previewImageURL:[NSURL URLWithString:self.shareImageUrl]];
    SendMessageToQQReq *req =[SendMessageToQQReq reqWithContent:newsObj];
    QQApiSendResultCode  sent=[QQApiInterface  SendReqToQZone:req];
    if (sent==0) {
        
         NSLog(@"%d",sent);
    }else {
        NSLog(@"%d",sent);
    }
}
#pragma mark -tencent分享代理-
-(void)checkPageFansResponse:(APIResponse *)response{
    //分享到QZone回调
    NSLog(@"%d,%d,%d%@%@",response.seq,response.retCode,response.detailRetCode,response.errorMsg,response.message);
    
}
-(void)tencentDidLogin{
 if (_tencentOAuth.accessToken &&0!=[_tencentOAuth.accessToken length])
 { [self showWithMessage:@"登陆成功"];
 }else{
   [self showWithMessage:@"登陆失败"];
 
 }
}
-(void)tencentDidNotNetWork{
[self showWithMessage:@"请检查网络连接"];

}
-(void)tencentDidNotLogin:(BOOL)cancelled{
    if (cancelled) {
        [self showWithMessage:@"用户取消了登录"];
    }else{
        [self showWithMessage:@"登录失败请重试"];
    }

}
-(void)cgiRequest:(TCAPIRequest *)request didResponse:(APIResponse *)response{

}
-(NSArray *)getAuthorizedPermissions:(NSArray *)permissions withExtraParams:(NSDictionary *)extraParams{
    return nil;
}
-(void)tencentDidLogout{
}
-(BOOL)tencentNeedPerformIncrAuth:(TencentOAuth *)tencentOAuth withPermissions:(NSArray *)permissions{
    return YES;
}
-(void)addShareResponse:(APIResponse *)response{

}
-(void)getUserInfoResponse:(APIResponse *)response{

}



#pragma mark -分享到新浪微博-
-(void)loginWithWeiBo{
[WeiboSDK messageRegister:@"验证码登陆"];

}
-(void)shareToWeibo{
    
    WBMessageObject *message=[WBMessageObject  message];
    message.text=self.shareText;
    WBImageObject *image=[WBImageObject object];
    
    NSData * data;
    if (!self.shareImage) {
        NSString * filePath = [[NSBundle mainBundle]pathForResource:self.shareImageName ofType:nil];
        data = [NSData dataWithContentsOfFile:filePath];
    }
    else{
        
        data =UIImageJPEGRepresentation(self.shareImage, 1);
    }
    image.imageData=data;
   
    
    message.imageObject=image;
    
    
    AppDelegate * myDelegate =(AppDelegate *)[UIApplication sharedApplication].delegate;
    WBAuthorizeRequest * authRequest =[WBAuthorizeRequest request];
    authRequest.redirectURI= XLkRedirectURL;
    authRequest.scope=@"all";
    
    
    
    
    WBSendMessageToWeiboRequest * request =[WBSendMessageToWeiboRequest requestWithMessage:message authInfo:nil access_token:myDelegate.wbtoken];
    [WeiboSDK sendRequest:request];
    
}
//新浪微博的代理协议
-(void)didReceiveWeiboResponse:(WBBaseResponse *)response{
    [self showWithMessage:response];

}
-(void)didReceiveWeiboRequest:(WBBaseRequest *)request{
    [self showWithMessage:request];
}

-(void)closeShareView{
    [UIView animateWithDuration:1 animations:^{
        self.alpha=0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];

}
-(void)showWithMessage:(id)message{
    
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:nil message:[NSString stringWithFormat:@"%@",message] delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
    
}

@end
