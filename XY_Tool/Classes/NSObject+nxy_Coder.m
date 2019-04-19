//
//  NSObject+nxy_Coder.m
//  touches
//
//  Created by 聂晓昀 on 2019/1/14.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NSObject+nxy_Coder.h"
#import <objc/runtime.h>
@implementation NSObject (nxy_Coder)

-(void)nxy_decoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //  需要忽略的归档属性
        if ([self respondsToSelector:@selector(ignoredNames)]) {
            if ([[self ignoredNames] containsObject:key]) continue;
        }
        
        id value = [coder decodeObjectForKey:key];
        [self setValue:value forKey:key];
    }
    free(ivars);
}

-(void)nxy_encoder:(NSCoder *)coder
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([self class], &count);
    for (int i = 0; i < count; i ++) {
        Ivar ivar = ivars[i];
        NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        //需要忽略的归档属性
        if ([self respondsToSelector:@selector(ignoredNames)]) {
            if ([[self ignoredNames] containsObject:key]) continue;
        }
        
        id value = [self valueForKey:key];
        [coder encodeObject:value forKey:key];
    }
    
    free(ivars);
}


#pragma mark 包含父类的归档结档
-(void)nxy_superEncoder:(NSCoder *)coder
{
    Class cls = self.class;
    while (cls && cls != [NSObject class])
    {
        
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(cls, &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            NSString *type = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
            NSLog(@"%@",type);
            //需要忽略的归档属性
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }

            id value = [self valueForKey:key];
            [coder encodeObject:value forKey:key];
        }
        free(ivars);
        cls = [cls superclass];
    }
}
-(void)nxy_superDecoder:(NSCoder *)coder
{
    Class cls = [self class];
    while (cls && cls != [NSObject class])
    {
        unsigned int count = 0;
        Ivar *ivars = class_copyIvarList(cls, &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            NSString *key = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            //  需要忽略的归档属性
            if ([self respondsToSelector:@selector(ignoredNames)]) {
                if ([[self ignoredNames] containsObject:key]) continue;
            }
            
            id value = [coder decodeObjectForKey:key];
            [self setValue:value forKey:key];
        }
        free(ivars);
        
        cls = [cls superclass];
    }
}
@end
