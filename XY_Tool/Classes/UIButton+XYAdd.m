//
//  UIButton+XYAdd.m
//  block
//
//  Created by 聂晓昀 on 2019/4/2.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "UIButton+XYAdd.h"

@implementation UIButton (XYAdd)

+(instancetype)xy_btnWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.titleLabel.font = font;
    btn.backgroundColor = backgroundColor;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
}
@end
