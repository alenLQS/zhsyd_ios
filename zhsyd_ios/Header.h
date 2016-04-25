//
//  Header.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#ifndef Header_h
#define Header_h

//thirdPath
#import "UIView+Extension.h"
#import "UIButton+Extension.h"
#import "UIBarButtonItem+Extension.h"
#import "WHC_Banner.h"
#import "UIImageView+WebCache.h"
#import <NSString+FontAwesome.h>



#import "MainNavController.h"
#import "MainTabbarController.h"
#import "BeginViewController.h"
#import "InvestViewController.h"
#import "MeViewController.h"
#import "OtherViewController.h"
#import "BaseViewController.h"

// 文字大小
#define LFFont(size) [UIFont systemFontOfSize:size]
#define AFManager  [AFHTTPRequestOperationManager manager]
#define Screen_width [UIScreen mainScreen].bounds.size.width
#define Screen_height [UIScreen mainScreen].bounds.size.height
#define Screen_scale 0.5625

#define TintColor [UIColor colorWithRed:205.0/255 green:36.0/255 blue:45.0/255 alpha:1.0]//导航栏主题色
#define WhiteColor [UIColor colorWithRed:236.0/255 green:236.0/255 blue:236.0/255 alpha:1.0]//主题色

#define Red_Color [UIColor colorWithRed:211.0/255 green:94.0/255 blue:98.0/255 alpha:1.0]//红
#define Blue_Color [UIColor colorWithRed:83.0/255 green:167.0/255 blue:231.0/255 alpha:1.0]//蓝
#define Purple_Color [UIColor colorWithRed:107.0/255 green:99.0/255 blue:166.0/255 alpha:1.0]//紫
#define Green_Color [UIColor colorWithRed:109.0/255 green:190.0/255 blue:166.0/255 alpha:1.0]//绿
#endif /* Header_h */
