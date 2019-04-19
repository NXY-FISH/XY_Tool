//
//  UITextField+XYAdd.m
//  nxy_category
//
//  Created by 聂晓昀 on 2018/9/14.
//  Copyright © 2018年 HP. All rights reserved.
//

#import "UITextField+XYAdd.h"

@implementation UITextField (XYAdd)
#pragma mark selectAllText
- (void)selectAllText {
    UITextRange *range = [self textRangeFromPosition:self.beginningOfDocument toPosition:self.endOfDocument];
    [self setSelectedTextRange:range];
}
#pragma mark setSelectedRange
- (void)setSelectedRange:(NSRange)range {
    UITextPosition *beginning = self.beginningOfDocument;
    UITextPosition *startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *endPosition = [self positionFromPosition:beginning offset:NSMaxRange(range)];
    UITextRange *selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    [self setSelectedTextRange:selectionRange];
}
@end
