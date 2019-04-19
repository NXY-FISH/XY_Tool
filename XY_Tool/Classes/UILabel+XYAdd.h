//
//  UILabel+XYAdd.h
//  block
//
//  Created by 聂晓昀 on 2019/4/2.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (XYAdd)

-(UILabel *(^)(UIColor *))xy_color;
-(UILabel *(^)(UIColor *))xy_backgroundColor;
-(UILabel *(^)(NSString *))xy_text;
-(UILabel *(^)(UIFont *))xy_font;
-(UILabel *(^)(NSInteger))xy_numberOfLines;
-(UILabel *(^)(NSTextAlignment))xy_textAlignment;


+(instancetype)xy_labelWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font;
+(instancetype)xy_labelWithTitle:(NSString *)title textColor:(UIColor *)textColor font:(UIFont *)font textAligment:(NSTextAlignment)textAligment numberOfLines:(NSInteger)numberOfLines backgroundColor:(UIColor *)backgroundColor;

/**
 设置文字间距
 */
-(void)xy_setTextSpace:(CGFloat)space;

/**
 设置行间距
 */
-(void)xy_setRowSpace:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
