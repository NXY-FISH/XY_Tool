//
//  UIView+XYAdd.h
//  nxy_category
//
//  Created by 聂晓昀 on 2018/9/14.
//  Copyright © 2018年 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYAdd)
/**
  生成一张图片
 */
- (nullable UIImage *)snapshotImage;
/**
  生成一张图片, 效率比snapshotImage高
 */
-(nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates;
/**
  返回view的 viewController 可能为nil
 */
@property (nullable,nonatomic,readonly) UIViewController *viewController;
/**
 *设置圆角
 */
-(void)setLayerRadius:(CGFloat)radius;
/**
 *移除所有的subViews
 */
-(void)removeAllSubviews;
@end
