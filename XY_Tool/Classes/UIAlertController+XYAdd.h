//
//  UIAlertController+XYAdd.h
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^confirmBlock)(void);
typedef void(^cancelBlock)(void);

@interface UIAlertController (XYAdd)
/**
 title  alertController 标题
 message alertController 信息
 preferredStyle alertController样式
 confirmBlcok 确认按钮点击block
 cancelBlock 取消按钮点击blcok
 UIAlertAction 默认样式为 UIAlertActionStyleDefault, 按钮标题默认为"取消, 确认"
 */
+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle confirmBlok:(confirmBlock)confirmBlcok cancelBlock:(cancelBlock)cancelBlock;


/**
 title  alertController 标题
 message alertController 信息
 preferredStyle alertController样式
 actionTitlte action标题
 actionStyle action样式
 actionBlock 按钮点击block
 */
+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle actionTitlte:(NSString *)actionTitle actionStyle:(UIAlertActionStyle)actionStyle actionBlock:(confirmBlock)actionBlock;


/**
 title  alertController 标题
 message alertController 信息
 preferredStyle alertController样式
 leftActionTitle action标题
 leftActionStyle action样式
 rightActionTitle  action标题
 rightActionStyle  action样式
 leftBlok 按钮点击block
 rightBlock 按钮点击blcok
 */
+(instancetype)xy_alertWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle leftActionTitle:(NSString *)leftActionTitle leftActionStyle:(UIAlertActionStyle)leftActionStyle rightActionTitle:(NSString *)rightActionTitle rightActionStyle:(UIAlertActionStyle)rightActionStyle leftBlok:(confirmBlock)leftBlok rightBlock:(cancelBlock)rightBlock;

@end
NS_ASSUME_NONNULL_END
