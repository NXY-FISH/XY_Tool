//
//  NSArray+nxy.m
//  test
//
//  Created by 聂晓昀 on 2019/3/18.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NSArray+XYAdd.h"

@implementation NSArray (XYAdd)
-(id)xy_saveObjectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    
    return nil;
}
@end
