
//使用该分类的时候不需要导入头文件,因为该分类中都是重写的系统的方法;
//该分类的作用: 在解析JSON数据的时候,一般是把JSON数据转化为字典或者是数组,直接输出字典或者是数组,不会显示中文;有了这个分类,输出的时候就是中文了
/*
 使用该分类前
 {
 weathers =     (
 {
 city = Beijing;
 status = "\U6674\U8f6c\U591a\U4e91";
 },
 {
 city = Guangzhou;
 status = "\U6674\U8f6c\U591a\U4e91";
 }
 );
 }
使用后
 {
	weathers:[
 {
	status:晴转多云,
	city:Beijing
 },{
	status:晴转多云,
	city:Guangzhou
 }]
 }
 */


#import <Foundation/Foundation.h>

@implementation NSDictionary (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    //该方法用来控制字典的输出
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"{\n"];
    
    //拼接字典中的键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [string appendFormat:@"\t%@:",key];
        [string appendFormat:@"%@,\n",obj];
    }];
    
    [string appendString:@"}"];
    
    //删除最后的逗号
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    
    return string;
}
@end

@implementation NSArray (Log)

-(NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level
{
    //该方法用来控制字典的输出
    NSMutableString *string = [NSMutableString string];
    [string appendString:@"[\n"];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [string appendFormat:@"%@,",obj];
    }];
    
    [string appendString:@"]"];
    
    NSRange range = [string rangeOfString:@"," options:NSBackwardsSearch];
    if (range.location != NSNotFound) {
        [string deleteCharactersInRange:range];
    }
    
    return string;
}
@end
