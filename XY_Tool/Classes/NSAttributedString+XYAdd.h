//
//  NSAttributedString+NXYAdd.h
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (XYAdd)
/**
 两个字符串生成 富文本字符串
 firstContent 第一个字符文字
 firstAttrbute 第一个字符属性
 secondContent 第二个字符文字
 secondAttribute 第二个字符属性
 */
+(instancetype)xy_attributeStringFirstContent:(NSString *)firstContent firstAttribute:(NSDictionary *)firstAttribute secondContent:(NSString *)secondContent  secondAttribute:(NSDictionary *)secondAttribute;
@end

NS_ASSUME_NONNULL_END
