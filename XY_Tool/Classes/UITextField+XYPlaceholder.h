//
//  UITextField+XYPlaceholder.h
//  new_hb
//
//  Created by 聂晓昀 on 2019/7/10.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (XYPlaceholder)

/**
 * color 站位文字颜色
 */
-(void)placeholderColor:(nullable UIColor *)color;


/**
 * color 站位文字颜色
 * font  站位文字大小
 */
-(void)attributedPlaceholderWithColor:(nullable UIColor *)color font:(nullable UIFont *)font;
@end

NS_ASSUME_NONNULL_END
