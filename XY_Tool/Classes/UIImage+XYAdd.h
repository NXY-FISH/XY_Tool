//
//  UIImage+Render.h
//
//  Created by niexiaoyun on 16/6/26.
//  Copyright © 2016年 niexiaoyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XYAdd)

/**
 返回一张不被渲染的图片
 */
+(instancetype)xy_imageWithRnederName:(NSString *)name;

/**
 生成一张水印图片
 text  水印文字
 textPoint  文字位置
 attribute  文字属性
 */
+(UIImage *)xy_imageWithWatermarkText:(NSString *)text textPoint:(CGPoint)textPoint attribute:(NSDictionary *)attribute image:(UIImage *)image;
-(UIImage *)xy_imageWithWatermarkText:(NSString *)text textPoint:(CGPoint)textPoint attribute:(NSDictionary *)attribute;

/**
 image 水印图片
 imagePoint 水印位置
 */
+(UIImage *)xy_imageWithWatermarkImage:(UIImage *)waterMarketImage imagePoint:(CGPoint)imagePoint image:(UIImage *)image;
-(UIImage *)xy_imageWithWatermarkImage:(UIImage *)waterMarketImage imagePoint:(CGPoint)imagePoint;

/**
 裁剪圆形图片
 传入一张正方行图片
 */
+(UIImage *)xy_cutCricularImageWithImage:(UIImage *)image;
-(UIImage *)xy_cutCricularImage;

/**
 裁剪带有边框的圆形图片(正方形图片)
 borderWidth 边框的宽度
 borderColor 边框的颜色
 */
+(UIImage *)xy_cutCricularImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor image:(UIImage *)image;
-(UIImage *)xy_cutCricularImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 裁剪图片圆角(四个角全部裁剪)
 radius 圆角半径
 */
+(UIImage *)xy_cutCornerRadiusWithRadius:(CGFloat)radius image:(UIImage *)image;
-(UIImage *)xy_cutCornerRadiusWithRadius:(CGFloat)radius;

/**
 裁剪图片圆角(指定角)
 rectCorner 圆角的方位
 cornerRadii 用来指定水平和垂直方向的半径大小
 */
+(UIImage *)xy_cutSelectedCorderRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii image:(UIImage *)image;
-(UIImage *)xy_cutSelectedCorderRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii;

/**
 生成纯色图片
 */
+(UIImage *)xy_generateImageWithColor:(UIColor *)color;

@end
