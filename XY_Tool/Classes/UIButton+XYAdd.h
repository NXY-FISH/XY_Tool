//
//  UIButton+XYAdd.h
//  block
//
//  Created by 聂晓昀 on 2019/4/2.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (XYAdd)
+(instancetype)xy_btnWithTitle:(NSString *)title titleColor:(UIColor *)titleColor font:(UIFont *)font backgroundColor:(UIColor *)backgroundColor target:(id)target action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
