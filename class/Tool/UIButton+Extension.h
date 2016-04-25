//
//  UIButton+Extension.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extension)

+(UIButton *)buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color target:(id)target action:(SEL)action;

@end
