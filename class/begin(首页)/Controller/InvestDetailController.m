//
//  InvestDetailController.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/25.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "InvestDetailController.h"


@interface InvestDetailController ()


@end

@implementation InvestDetailController



-(void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationItem.title = @"投资详情";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}




@end
