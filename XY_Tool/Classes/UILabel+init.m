//
//  UILabel+init.m
//  UIView
//
//  Created by 聂晓昀 on 2018/9/11.
//  Copyright © 2018年 HP. All rights reserved.
//

#import "UILabel+init.h"

@implementation UILabel (init)
-(UILabel *(^)(UIColor *))ns_color
{
    return ^UILabel *(UIColor *color){
        self.textColor = color;
        return self;
    };
}
-(UILabel *(^)(UIColor *))ns_backgroundColor
{
    return ^UILabel *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
-(UILabel *(^)(NSString *))ns_text
{
    return ^UILabel *(NSString *text){
        self.text = text;
        return self;
    };
}
-(UILabel *(^)(UIFont *))ns_font
{
    return ^UILabel *(UIFont *font){
        self.font = font;
        return self;
    };
}
-(UILabel *(^)(NSTextAlignment))ns_textAlignment
{
    return ^UILabel *(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}
-(UILabel *(^)(NSInteger))ns_numberOfLines
{
    return ^UILabel *(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}
@end
