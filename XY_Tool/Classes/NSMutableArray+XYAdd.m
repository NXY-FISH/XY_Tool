//
//  NSMutableArray+XYAdd.m
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NSMutableArray+XYAdd.h"

@implementation NSMutableArray (XYAdd)
-(id)xy_saveObjectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        return [self objectAtIndex:index];
    }
    return nil;
}
-(void)xy_saveRemoveObjectAtIndex:(NSInteger)index
{
    if (index < self.count) {
        [self removeObjectAtIndex:index];
    }
}
@end
