//
//  UIView+XYAdd.m
//  nxy_category
//
//  Created by 聂晓昀 on 2018/9/14.
//  Copyright © 2018年 HP. All rights reserved.
//

#import "UIView+XYAdd.h"

@implementation UIView (XYAdd)
#pragma mark snapshotImage
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *snap = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return snap;
}
#pragma mark snapshotImageAfterScreenUpdates
-(nullable UIImage *)snapshotImageAfterScreenUpdates:(BOOL)afterUpdates
{
    if (![self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]) {
        [self snapshotImage];
    }
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:afterUpdates];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
#pragma mark viewController
-(UIViewController *)viewController
{
    for (UIView *view = self; view; view=view.superview) {
        UIResponder *nextResponder = [view nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)nextResponder;
        }
    }
    return nil;
}
#pragma mark setLayerRadius
-(void)setLayerRadius:(CGFloat)radius
{
    self.layer.cornerRadius = radius;
    //下面的两行代码,在设置圆角时能提升性能
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}
#pragma mark removeAllSubviews
-(void)removeAllSubviews
{
//    for (UIView *view in self.subviews) {
//        [view removeFromSuperview];
//    }
    while (self.subviews.count) {
        [self.subviews.lastObject removeFromSuperview];
    }
}
@end
