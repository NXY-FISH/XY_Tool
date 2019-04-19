//
//  UILabel+XYAdd.m
//  block
//
//  Created by 聂晓昀 on 2019/4/2.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "UILabel+XYAdd.h"
#import <CoreText/CoreText.h>

@implementation UILabel (XYAdd)

-(UILabel * _Nonnull (^)(UIColor * _Nonnull))xy_color
{
    return ^UILabel *(UIColor *color){
        self.textColor = color;
        return self;
    };
}
-(UILabel *(^)(UIColor *))xy_backgroundColor
{
    return ^UILabel *(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
-(UILabel *(^)(NSString *))xy_text
{
    return ^UILabel *(NSString *text){
        self.text = text;
        return self;
    };
}
-(UILabel *(^)(UIFont *))xy_font
{
    return ^UILabel *(UIFont *font){
        self.font = font;
        return self;
    };
}
-(UILabel *(^)(NSInteger))xy_numberOfLines
{
    return ^UILabel *(NSInteger numberOfLines){
        self.numberOfLines = numberOfLines;
        return self;
    };
}
-(UILabel *(^)(NSTextAlignment))xy_textAlignment
{
    return ^UILabel *(NSTextAlignment textAlignment){
        self.textAlignment = textAlignment;
        return self;
    };
}


+(instancetype)xy_labelWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font
{
    UILabel *label = [[UILabel alloc] init];
    label.font = font;
    label.text = title;
    label.textColor = textColor;
    return label;
}

+(instancetype)xy_labelWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font textAligment:(NSTextAlignment)textAligment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor
{
    UILabel *label = [self xy_labelWithTitle:title textColor:textColor font:font];
    label.textAlignment = textAligment;
    label.numberOfLines = numberOfLines;
    label.backgroundColor = backgroundColor;
    return label;
}

#pragma mark 设置文字间距
-(void)xy_setTextSpace:(CGFloat)space
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    //调整间距
    [attributeString addAttribute:(__bridge NSString *)kCTKernAttributeName value:@(space) range:NSMakeRange(0, attributeString.length)];
    self.attributedText = attributeString;
}

#pragma mark 设置行间距
-(void)xy_setRowSpace:(CGFloat)space
{
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributeString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, attributeString.length)];
    self.attributedText = attributeString;
}
@end
