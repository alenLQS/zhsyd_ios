//
//  MainNavController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MainNavController.h"

@implementation MainNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**
 *  重写这个方法目的：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0) {
        /* 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）*/
        /**
         *  自动显示和隐藏tabbar
         */
        
        viewController.hidesBottomBarWhenPushed = YES;
        
        /**
         *  设置左边的返回按钮
         */
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(pressBack) nomalImage:[UIImage imageNamed:@"BackBarButton"] higeLightedImage:[UIImage imageNamed:@"BackBarButtonHighlight"]];
    }
    [super pushViewController:viewController animated:animated];
}
/**
 *  返回上一级事件
 */
-(void)pressBack{
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self popViewControllerAnimated:YES];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
