//
//  UILabel+init.h
//  UIView
//
//  Created by 聂晓昀 on 2018/9/11.
//  Copyright © 2018年 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (init)
//设置字体颜色
-(UILabel *(^)(UIColor *))ns_color;
//设置背景颜色
-(UILabel *(^)(UIColor *))ns_backgroundColor;
//设置内容
-(UILabel *(^)(NSString *))ns_text;
//设置字体大小
-(UILabel *(^)(UIFont *))ns_font;
//设置对齐方式
-(UILabel *(^)(NSTextAlignment))ns_textAlignment;
//设置显示行数
-(UILabel *(^)(NSInteger))ns_numberOfLines;
@end
