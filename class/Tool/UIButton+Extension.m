//
//  UIButton+Extension.m
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "UIButton+Extension.h"

@implementation UIButton (Extension)

+(UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}

@end
