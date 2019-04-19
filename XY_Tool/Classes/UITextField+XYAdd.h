//
//  UITextField+XYAdd.h
//  nxy_category
//
//  Created by 聂晓昀 on 2018/9/14.
//  Copyright © 2018年 HP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (XYAdd)
//下面的方法 UITextField必须为第一响应者才有效
/**
 * 选中全部内容
 */
- (void)selectAllText;
/**
 * 选中 NSRange内容
 */
- (void)setSelectedRange:(NSRange)range;
@end
