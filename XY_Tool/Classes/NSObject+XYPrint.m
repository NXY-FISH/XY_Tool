//
//  NSObject+XYPrint.m
//  NXYKVO
//
//  Created by 聂晓昀 on 2019/7/9.
//  Copyright © 2019 HP. All rights reserved.
//

#import "NSObject+XYPrint.h"
#import "objc/runtime.h"
@implementation NSObject (XYPrint)
+(void)MethodNamesPrint
{
    unsigned int count;
    //获得方法名数组
    Method *methodList = class_copyMethodList([self class], &count);
    //    遍历所有的方法
    for (unsigned int i = 0; i < count; i ++) {
        //获得方法
        Method method = methodList[i];
        //获得方法名
        NSString *methodName = NSStringFromSelector(method_getName(method));
        NSLog(@"%@",methodName);
    }
    free(methodList);
}

+(void)propertyNamesPrint
{
    unsigned int count;
    //获取属性数组
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        objc_property_t property = propertyList[i];
        const char *name = property_getName(property);
        NSString *ocName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",ocName);
    }
    
    free(propertyList);
}

+(void)ivarNamePrint
{
    unsigned int count;
    Ivar *ivarList = class_copyIvarList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        Ivar ivar = ivarList[i];
        const char *name = ivar_getName(ivar);
        NSString *ocName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",ocName);
    }
    free(ivarList);
}

+(void)protocolNamesPrint
{
    unsigned int count;
 __unsafe_unretained Protocol **protocolList = class_copyProtocolList([self class], &count);
    for (unsigned int i = 0; i < count; i ++) {
        Protocol *protocolName = protocolList[i];
        const char *name = protocol_getName(protocolName);
        NSString *ocName = [NSString stringWithUTF8String:name];
        NSLog(@"%@",ocName);
    }
    free(protocolList);
}
@end
