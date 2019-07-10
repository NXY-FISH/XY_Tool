//
//  NSObject+XYPrint.h
//  NXYKVO
//
//  Created by 聂晓昀 on 2019/7/9.
//  Copyright © 2019 HP. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (XYPrint)
/**
 对象方法名
 */
+(void)MethodNamesPrint;

/**
 属性名
 */
+(void)propertyNamesPrint;

/*
 成员变量名
 */
+(void)ivarNamePrint;

/**
 遵守的协议名
 */
+(void)protocolNamesPrint;
@end

NS_ASSUME_NONNULL_END
