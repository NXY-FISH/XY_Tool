//
//  NSString+tool.h
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (XYAdd)

/**
 字符串反转
 */
-(NSString *)xy_reverseString;
+(NSString *)xy_reverseString:(NSString *)string;

/**
 判断字符是否包含中文
 */
-(BOOL)xy_isStringContainChinese;
+(BOOL)xy_isStringContainChinese:(NSString *)string;

/**
 身份证有效性校验
 */
-(BOOL)xy_isAccurateIDCardNumber;
+(BOOL)xy_isAccurateIDCardNumber:(NSString *)cardNumber;

/**
 银行卡有效性校验
 */
-(BOOL)xy_isEffectiveBankCardNumber;
+(BOOL)xy_isEffectiveBankCardNumber:(NSString *)bandCardNumber;

/**
 校验手机号格式是否正确
 */
-(BOOL)xy_isValidateMobileNumber;

/**
 校验邮箱格式是否正确
 */
-(BOOL)xy_isVaidateEmail;

/**
 计算单行文字宽高
 font 字体大小
 */
-(CGSize)xy_caculateSingleRowSizeFont:(UIFont *)font;
-(CGFloat)xy_calculateSingleRowWidthFont:(UIFont *)font;
-(CGFloat)xy_caculateSingleROwHeightFont:(UIFont *)font;

/**
 计算多行文字宽高
 font 字体大小
 maxWidth 最大宽度
 option  附加选项
 */
-(CGSize)xy_caculateMultipleRowSizeFont:(UIFont *)font maxWidth:(CGFloat)maxWidth option:(NSStringDrawingOptions)option;
-(CGFloat)xy_caculateMultipleRowHeightFont:(UIFont *)font maxWidth:(CGFloat)maxWidth option:(NSStringDrawingOptions)option;

/**
 json字符串转换为json
 */
-(id)xy_jsonStringToJson;

/**
 校验字符串是否为空
 */
-(BOOL)xy_isEmpytString;

/**
 校验字符串是否为整形
 */
-(BOOL)xy_isPureInt;

/**
 校验字符串是否为浮点型
 */
-(BOOL)xy_isPureFloat;

/**
 时间戳转时间
 dateFormat 时间格式, 默认为 yyyy年MM月dd日 HH:mm:ss
 */
-(instancetype)xy_timeStampToTimeStingDateFormat:(NSString *)dateFormat;

/**
 NSDate转字符串
 dateFormat 时间格式, 默认为yyyy-MM-dd
 */
+(instancetype)xy_StringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
@end

NS_ASSUME_NONNULL_END
