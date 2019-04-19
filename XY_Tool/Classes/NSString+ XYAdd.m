//
//  NSString+tool.m
//  tool
//
//  Created by 聂晓昀 on 2019/3/26.
//  Copyright © 2019 聂晓昀. All rights reserved.
//

#import "NSString+XYAdd.h"
@implementation NSString (XYAdd)

#pragma mark 字符串反转
+(NSString *)xy_reverseString:(NSString *)string
{
    return [string xy_reverseString];
}
-(NSString *)xy_reverseString
{
    
    NSMutableString *reverseString = [NSMutableString stringWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString * _Nullable substring, NSRange substringRange, NSRange enclosingRange, BOOL * _Nonnull stop) {
        [reverseString appendString:substring];
    }];
    return reverseString;
}

#pragma mark 判断字符是否包含中文
+(BOOL)xy_isStringContainChinese:(NSString *)string
{
    return [string xy_isStringContainChinese];
}
-(BOOL)xy_isStringContainChinese
{
    NSUInteger length = self.length;
    for (NSUInteger i = 0; i < length; i ++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

#pragma mark 身份证有效性校验
+(BOOL)xy_isAccurateIDCardNumber:(NSString *)cardNumber
{
    return [cardNumber xy_isAccurateIDCardNumber];
}
-(BOOL)xy_isAccurateIDCardNumber
{
    NSString * value = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    int length =0;
    if (!value) {
        return NO;
    }else {
        length = (int)value.length;
        
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray =@[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                NSString *test = [value substringWithRange:NSMakeRange(17,1)];
                if ([[M lowercaseString] isEqualToString:[test lowercaseString]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return NO;
    }
}


#pragma mark  银行卡有效性校验
+(BOOL)xy_isEffectiveBankCardNumber:(NSString *)bandCardNumber
{
    return [bandCardNumber xy_isEffectiveBankCardNumber];
}
-(BOOL)xy_isEffectiveBankCardNumber
{
    NSString * lastNum = [[self substringFromIndex:(self.length-1)] copy];//取出最后一位
    NSString * forwardNum = [[self substringToIndex:(self.length -1)] copy];//前15或18位
    
    NSMutableArray * forwardArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i=0; i<forwardNum.length; i++) {
        NSString * subStr = [forwardNum substringWithRange:NSMakeRange(i, 1)];
        [forwardArr addObject:subStr];
    }
    
    NSMutableArray * forwardDescArr = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = (int)(forwardArr.count-1); i> -1; i--) {//前15位或者前18位倒序存进数组
        [forwardDescArr addObject:forwardArr[i]];
    }
    
    NSMutableArray * arrOddNum = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 < 9
    NSMutableArray * arrOddNum2 = [[NSMutableArray alloc] initWithCapacity:0];//奇数位*2的积 > 9
    NSMutableArray * arrEvenNum = [[NSMutableArray alloc] initWithCapacity:0];//偶数位数组
    
    for (int i=0; i< forwardDescArr.count; i++) {
        NSInteger num = [forwardDescArr[i] intValue];
        if (i%2) {//偶数位
            [arrEvenNum addObject:[NSNumber numberWithInteger:num]];
        }else{//奇数位
            if (num * 2 < 9) {
                [arrOddNum addObject:[NSNumber numberWithInteger:num * 2]];
            }else{
                NSInteger decadeNum = (num * 2) / 10;
                NSInteger unitNum = (num * 2) % 10;
                [arrOddNum2 addObject:[NSNumber numberWithInteger:unitNum]];
                [arrOddNum2 addObject:[NSNumber numberWithInteger:decadeNum]];
            }
        }
    }
    
    __block  NSInteger sumOddNumTotal = 0;
    [arrOddNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNumTotal += [obj integerValue];
    }];
    
    __block NSInteger sumOddNum2Total = 0;
    [arrOddNum2 enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumOddNum2Total += [obj integerValue];
    }];
    
    __block NSInteger sumEvenNumTotal =0 ;
    [arrEvenNum enumerateObjectsUsingBlock:^(NSNumber * obj, NSUInteger idx, BOOL *stop) {
        sumEvenNumTotal += [obj integerValue];
    }];
    
    NSInteger lastNumber = [lastNum integerValue];
    NSInteger luhmTotal = lastNumber + sumEvenNumTotal + sumOddNum2Total + sumOddNumTotal;
    
    return (luhmTotal%10 ==0)?YES:NO;
}

#pragma mark  校验手机号格式是否正确
-(BOOL)xy_isValidateMobileNumber
{
    NSLog(@"%@",self);
    NSString *phoneNumberRegex = @"^1([3-8])\\d{9}$";
    NSPredicate *phoneNumberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneNumberRegex];
    return [phoneNumberTest evaluateWithObject:self];
}

#pragma mark  校验邮箱格式是否正确
-(BOOL)xy_isVaidateEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",emailRegex];
    return [emailTest evaluateWithObject:self];
}

#pragma mark  计算单行文字宽高
-(CGSize)xy_caculateSingleRowSizeFont:(UIFont *)font
{
     return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}
-(CGFloat)xy_calculateSingleRowWidthFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}].width;
}
-(CGFloat)xy_caculateSingleROwHeightFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}].height;
}

#pragma mark 计算多行文字宽高
-(CGSize)xy_caculateMultipleRowSizeFont:(UIFont *)font maxWidth:(CGFloat)maxWidth option:(NSStringDrawingOptions)option
{
     return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:option attributes:@{NSFontAttributeName:font} context:nil].size;
}
-(CGFloat)xy_caculateMultipleRowHeightFont:(UIFont *)font maxWidth:(CGFloat)maxWidth option:(NSStringDrawingOptions)option
{
    return [self boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:option attributes:@{NSFontAttributeName:font} context:nil].size.height;
}

#pragma mark json字符串转换为json
-(id)xy_jsonStringToJson
{
    if (self == nil) {
        return nil;
    }
    NSData *jsonData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    id dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                             options:NSJSONReadingMutableContainers
                                               error:&err];
    if(err) {
        return nil;
    }
    return dic;
}

#pragma mark  校验字符串是否为空
-(BOOL)xy_isEmpytString
{
    NSString *string = self;
    if ([string isKindOfClass:[NSNumber class]]) {
        string = [NSString stringWithFormat:@"%@",string];
    }
    return string == nil || [string isKindOfClass:[NSNull class]] || [string isEqualToString:@""]  || string.length == 0;
}

#pragma mark  校验字符串是否为整形
-(BOOL)xy_isPureInt
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}

#pragma mark 校验字符串是否为浮点型
-(BOOL)xy_isPureFloat
{
    NSScanner* scan = [NSScanner scannerWithString:self];
    float val;
    return[scan scanFloat:&val] && [scan isAtEnd];
}

#pragma mark 时间戳转时间
-(instancetype)xy_timeStampToTimeStingDateFormat:(NSString *)dateFormat;
{
    NSTimeInterval timeSp1 = (NSTimeInterval)[self longLongValue]/1000;
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timeSp1];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if ([dateFormat xy_isEmpytString]) {
        dateFormat = @"yyyy年MM月dd日 HH:mm:ss";
    }
    [formatter setDateFormat:dateFormat];
    NSString *string = [formatter stringFromDate:confromTimesp];
    return string;
}

#pragma mark  NSDate转字符串
+(instancetype)xy_StringWithDate:(NSDate *)date dateFormat:(NSString *)dateFormat;
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (dateFormat == nil || [dateFormat isEqual:@""]) {
        dateFormat = @"yyyy-MM-dd";
    }
    [formatter setDateFormat:dateFormat];
    NSString *string = [formatter stringFromDate:date];
    return string;
}
@end
