//
//  UITextField+XYPlaceholder.m
//  new_hb
//
//  Created by 聂晓昀 on 2019/7/10.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "UITextField+XYPlaceholder.h"

@implementation UITextField (XYPlaceholder)

-(void)placeholderColor:(UIColor *)color
{
    color = color == nil ? [self valueForKeyPath:@"_placeholderLabel.textColor"] : color;
    [self setValue:color forKeyPath:@"_placeholderLabel.textColor"];
}


-(void)attributedPlaceholderWithColor:(UIColor *)color font:(UIFont *)font
{
    color = color == nil ? [self valueForKeyPath:@"_placeholderLabel.textColor"] : color;
    font = font == nil ? self.font : font;
    NSDictionary *attribute = @{
                                    NSForegroundColorAttributeName : color,
                                               NSFontAttributeName : font
                                    };
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attribute];
    self.attributedPlaceholder = attrString;
}
@end
