//
//  NSMutableArray+XYAdd.h
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (XYAdd)
-(id)xy_saveObjectAtIndex:(NSInteger)index;
-(void)xy_saveRemoveObjectAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
