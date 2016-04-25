//
//  MainTabberController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "MainTabbarController.h"
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory.h>
#import <FontAwesomeIconFactory/NIKFontAwesomeIconFactory+iOS.h>

@implementation MainTabbarController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NIKFontAwesomeIconFactory *factory = [NIKFontAwesomeIconFactory tabBarItemIconFactory];

    
    BeginViewController *notes=[[BeginViewController alloc]init];
    [self addChildViewController:notes withTitle:@"首页" image:[factory createImageForIcon:NIKFontAwesomeIconHome] selectedImage:nil];
    InvestViewController *tactics=[[InvestViewController alloc]init];
    [self addChildViewController:tactics withTitle:@"理财产品" image:[factory createImageForIcon:NIKFontAwesomeIconQrcode] selectedImage:nil];
    MeViewController *tools=[[MeViewController alloc]init];
    [self addChildViewController:tools withTitle:@"我的账户" image:[factory createImageForIcon:NIKFontAwesomeIconUser] selectedImage:nil];
    OtherViewController *mine=[[OtherViewController alloc]init];
    [self addChildViewController:mine withTitle:@"更多" image:[factory createImageForIcon:NIKFontAwesomeIconEllipsisH] selectedImage:nil];
    
    self.tabBar.tintColor=TintColor;

}
/**
 *  添加子控制器到tabbar,并封装一个navgationbar
 *
 *  @param childController 子控制器对象
 *  @param title           子控制器标题
 *  @param image           tabbaritem正常图片
 *  @param selectedImage   tabbaritem选中图片
 */
-(void)addChildViewController:(UIViewController *)childController withTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
    childController.tabBarItem=[[UITabBarItem alloc]initWithTitle:title image:image selectedImage:[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childController.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:TintColor} forState:UIControlStateSelected];
    /**
     给每个控制器添加一个UINavigationController
     */
    UINavigationController *navigationController=[[UINavigationController alloc]initWithRootViewController:childController];
    [self addChildViewController:navigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
