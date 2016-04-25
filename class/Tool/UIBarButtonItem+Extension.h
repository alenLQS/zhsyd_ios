//
//  UIBarButtonItem+Extension.h
//  zhsyd_ios
//
//  Created by 刘青山 on 16/4/22.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)


+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action nomalImage:(UIImage *)nomalImage higeLightedImage:(UIImage *)higeLightedImage;


+(UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title image:(UIImage *)image;

@end
