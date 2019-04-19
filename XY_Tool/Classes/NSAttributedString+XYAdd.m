//
//  NSAttributedString+NXYAdd.m
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "NSAttributedString+XYAdd.h"

@implementation NSAttributedString (XYAdd)
+(instancetype)xy_attributeStringFirstContent:(NSString *)firstContent firstAttribute:(NSDictionary *)firstAttribute secondContent:(NSString *)secondContent  secondAttribute:(NSDictionary *)secondAttribute
{
    NSString *string = [NSString stringWithFormat:@"%@%@",firstContent, secondContent];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange firstRange = NSMakeRange(0, firstContent.length);
    UIFont *firstFont = [firstAttribute objectForKey:NSFontAttributeName] ? [firstAttribute objectForKey:NSFontAttributeName] : [UIFont systemFontOfSize:14];
    UIColor *firstColor = [firstAttribute objectForKey:NSForegroundColorAttributeName] ? [firstAttribute objectForKey:NSForegroundColorAttributeName] : [UIColor blackColor];
    [attributeString addAttribute:NSForegroundColorAttributeName value:firstColor range:firstRange];
    [attributeString addAttribute:NSFontAttributeName value:firstFont range:firstRange];
    
    NSRange secondRange = NSMakeRange(firstContent.length, secondContent.length);
    UIFont *secondFont = [secondAttribute objectForKey:NSFontAttributeName] ? [secondAttribute objectForKey:NSFontAttributeName] : [UIFont systemFontOfSize:14];
    UIColor *secondColor = [secondAttribute objectForKey:NSForegroundColorAttributeName] ? [secondAttribute objectForKey:NSForegroundColorAttributeName] : [UIColor blackColor];
    [attributeString addAttribute:NSForegroundColorAttributeName value:secondColor range:secondRange];
    [attributeString addAttribute:NSFontAttributeName value:secondFont range:secondRange];
    return attributeString;
}
@end
