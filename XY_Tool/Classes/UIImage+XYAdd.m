//
//  UIImage+Render.m
//  百思不得姐
//
//  Created by niexiaoyun on 16/6/26.
//  Copyright © 2016年 niexiaoyun. All rights reserved.
//

#import "UIImage+XYAdd.h"

@implementation UIImage (XYAdd)
#pragma mark 返回一张不被渲染的图片
+(instancetype)xy_imageWithRnederName:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    image = [image  imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

#pragma mark 生成水印图片(文字)
-(UIImage *)xy_imageWithWatermarkText:(NSString *)text textPoint:(CGPoint)textPoint attribute:(nonnull NSDictionary *)attribute
{
    //开启位图上下文
    UIGraphicsBeginImageContext(self.size);
    //把图片绘制到上下文当中
    [self drawAtPoint:CGPointZero];
    //把文字绘制到上下文当中
    [text drawAtPoint:textPoint withAttributes:attribute];
    //从上下文中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_imageWithWatermarkText:(NSString *)text textPoint:(CGPoint)textPoint attribute:(NSDictionary *)attribute image:(UIImage *)image
{
    return  [image xy_imageWithWatermarkText:text textPoint:textPoint attribute:attribute];
}

#pragma mark 生成水印图片(图片)
-(UIImage *)xy_imageWithWatermarkImage:(UIImage *)waterMarketImage imagePoint:(CGPoint)imagePoint
{
    //开启位图上下文
    UIGraphicsBeginImageContext(self.size);
    //把图片绘制到上下文当中
    [self drawAtPoint:CGPointZero];
    //把图片绘制到上下文当中
    [waterMarketImage drawAtPoint:imagePoint];
    //从上下文中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_imageWithWatermarkImage:(UIImage *)waterMarketImage imagePoint:(CGPoint)imagePoint image:(UIImage *)image
{
    return [image xy_imageWithWatermarkImage:waterMarketImage imagePoint:imagePoint];
}

#pragma mark 裁剪圆形图片
-(UIImage *)xy_cutCricularImage
{
    //开启位图上下文
    UIGraphicsBeginImageContext(self.size);
    //设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    //把路径设置为裁剪区域
    [path addClip];
    //把图片绘制到上下文中
    [self drawAtPoint:CGPointZero];
    //从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_cutCricularImageWithImage:(UIImage *)image
{
    return [image xy_cutCricularImage];
}


#pragma mark 裁剪带有边框的圆形图片
-(UIImage *)xy_cutCricularImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    //开启位图上下文
    CGSize size = CGSizeMake(self.size.width + 2 * borderWidth, self.size.height + 2 * borderWidth);
    UIGraphicsBeginImageContext(size);
    //绘制一个大圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    //设置裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderWidth, borderWidth, self.size.width, self.size.height)];
    [clipPath addClip];
    //把图片绘制到上下文当中
    [self drawAtPoint:CGPointMake(borderWidth, borderWidth)];
    //从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_cutCricularImageWithBorderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor image:(UIImage *)image
{
    return  [image xy_cutCricularImageWithBorderWidth:borderWidth borderColor:borderColor];
}

#pragma mark 裁剪图片圆角(四个角)
-(UIImage *)xy_cutCornerRadiusWithRadius:(CGFloat)radius
{
    //开启位图上下文
    UIGraphicsBeginImageContext(self.size);
    //设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) cornerRadius:radius];
    //把路径设置为裁剪区域
    [path addClip];
    //把图片绘制到上下文中
    [self drawAtPoint:CGPointZero];
    //从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_cutCornerRadiusWithRadius:(CGFloat)radius image:(UIImage *)image
{
    return [image xy_cutCornerRadiusWithRadius:radius];
}

#pragma mark 裁剪圆角(指定角)
-(UIImage *)xy_cutSelectedCorderRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii
{
    //开启位图上下文
    UIGraphicsBeginImageContext(self.size);
    //设置裁剪区域
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, self.size.width, self.size.height) byRoundingCorners:rectCorner cornerRadii:cornerRadii];
    //把路径设置为裁剪区域
    [path addClip];
    //把图片绘制到上下文中
    [self drawAtPoint:CGPointZero];
    //从上下文当中生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //关闭位图上下文
    UIGraphicsEndImageContext();
    return newImage;
}
+(UIImage *)xy_cutSelectedCorderRadiusWithRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGSize)cornerRadii image:(UIImage *)image
{
    return [image xy_cutSelectedCorderRadiusWithRectCorner:rectCorner cornerRadii:cornerRadii];
}

#pragma mark 生成纯色图片
+(UIImage *)xy_generateImageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}
@end
