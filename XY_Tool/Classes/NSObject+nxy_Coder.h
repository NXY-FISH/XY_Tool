//
//  NSObject+nxy_Coder.h
//  touches
//
//  Created by 聂晓昀 on 2019/1/14.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (nxy_Coder)
/*
 *不包含父类的属性
 */
-(void)nxy_encoder:(NSCoder *)coder;
-(void)nxy_decoder:(NSCoder *)coder;


/*
 *包含父类的属性
 */
-(void)nxy_superEncoder:(NSCoder *)coder;
-(void)nxy_superDecoder:(NSCoder *)coder;


-(NSArray *)ignoredNames;
@end

NS_ASSUME_NONNULL_END
