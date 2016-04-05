//
//  PageViewController.m
//  miniFilter
//
//  Created by qianfeng01 on 15/10/7.
//  Copyright (c) 2015年 miniFilter. All rights reserved.
//

#import "PageViewController.h"
#import "ViewController.h"

@interface PageViewController ()
<UIScrollViewDelegate>
@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(creatScrollView) withObject:nil afterDelay:0];
    // Do any additional setup after loading the view.
}

- (void)creatScrollView {
    //创建滚动视图
    //必须要设置滚动区域 (所有并排显示子视图的总大小)
    //3张 并排显示
    _scrollView.contentSize =CGSizeMake(_scrollView.frame.size.width * 4, _scrollView.frame.size.height) ;
    //粘贴子视图
    //图片子视图要并排显示
    for (int i = 1; i <= 4; i++) {
        //获取图片在包内的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%d",i] ofType:@"png"];
        //每次都是从磁盘加载图片
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        //每张图片视图的大小和 滚动视图一样大，并排粘贴在滚动视图上
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(_scrollView.frame.size.width*(i-1), 0,_scrollView.frame.size.width , _scrollView.frame.size.height)];
        imageView.image = image;
        
        if (i == 4) {
            //把一个button粘到最后一张图片上
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(self.scrollView.frame.size.width / 2 - 50, self.scrollView.frame.size.height - 65, 100, 20);
            [button setTitle:@"开始体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
            button.titleLabel.textColor = [UIColor blackColor];
            button.titleLabel.font = [UIFont systemFontOfSize:13];
            button.backgroundColor = [[UIColor lightGrayColor]colorWithAlphaComponent:0.5];;
            button.alpha = 1;
            button.layer.cornerRadius = 8;
            button.layer.masksToBounds = YES;
            [imageView addSubview:button];
            imageView.userInteractionEnabled = YES;
            
        }
        
        //粘贴
        [_scrollView addSubview:imageView];
    }
    

    
    //隐藏滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    //不回弹
    _scrollView.bounces = NO;
    
    //设置 是否按页进行滚动 (每次滚动的偏移量都是滚动视图宽的整数倍)
    _scrollView.pagingEnabled = YES;
    //设置代理
    _scrollView.delegate = self;
    
    
    [self.view addSubview:_scrollView];
    
    //滚动视图 如果按照页进行滚动 一般会和页码指示器一起使用
    //页码指示器 事件驱动型控件
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, _scrollView.frame.size.height-30, _scrollView.frame.size.width, 30)];
    pageControl.tag = 101;
    //设置小白球个数
    pageControl.numberOfPages = 4;
    
    //设置小白球的颜色
    //pageControl.pageIndicatorTintColor = [UIColor redColor];
    //设置当前页的小白球 的颜色
    //pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    //增加事件
    [pageControl addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    
    //pageControl.backgroundColor = [UIColor blackColor];
    //粘贴到self.view 上
    [self.view addSubview:pageControl];
}

//点击pageControl 左右侧 小白球就会切换变化
//pageControl 触发的函数
- (void)pageClick:(UIPageControl *)pageControl {
    
    //获取当前的页码pageControl.currentPage;
    //这时要修改滚动视图的内容偏移量 滚动视图的内容就会滚动
    //[_scrollView setContentOffset:CGPointMake(_scrollView.frame.size.width*pageControl.currentPage, 0) animated:YES];
    //滚动到指定的可视子视图的范围
    [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width*pageControl.currentPage, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
}
- (void)btnClick {
    
    //跳转到RootViewController界面
   
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.7;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"cameraIrisHollowOpen";
    [self.view.layer addAnimation:animation forKey:@"animation"];
    [self performSelector:@selector(prenstViewController) withObject:nil afterDelay:0.5];
}

-(void)prenstViewController
{
    UIStoryboard * stroy = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController * vc = [stroy instantiateViewControllerWithIdentifier:@"st"];
    [self presentViewController:vc animated:NO completion:nil];
}





#pragma mark - UIScrollViewDelegate
//当滚动视图减速停止的时候 修改页码指示器的页码
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //减速停止之后 获取滚动视图内容偏移量
    CGPoint offset = scrollView.contentOffset;
    
    //计算出当前页码:水平内容偏移量/滚动视图的宽度
    
    UIPageControl *page = (UIPageControl *)[self.view viewWithTag:101];
    page.currentPage = offset.x/scrollView.frame.size.width;
}
/*
 
 - (void)setContentOffset:(CGPoint)contentOffset animated:(BOOL)animated;
 - (void)scrollRectToVisible:(CGRect)rect animated:(BOOL)animated;
 
 //当用代码调用 上面两个方法并且开启动画效果 下面协议的方法才会调用
 */

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    NSLog(@"滚动视图 改变偏移量 滚动动画结束");
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
