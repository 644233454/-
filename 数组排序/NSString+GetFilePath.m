//
//  NSString+GetFilePath.m
//  asi上传和下载
//
//  Created by 索光传 on 15-7-8.
//  Copyright (c) 2015年 . All rights reserved.
//

#import "NSString+GetFilePath.h"

@implementation NSString (GetFilePath)
//返回文件夹和文件名路径(得到路径可能存在，也可能不存在)
+ (NSString* )getFilePath:(NSString* )filePath withFileName:(NSString* )fileName
{
    //获取沙盒路径
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //拼接文件夹路径
    path = [path stringByAppendingPathComponent:filePath];
    //拼接文件名
    path = [path stringByAppendingPathComponent:fileName];
    return path;
}
//返回文件路径（必须存在）
+ (NSString* )getExistsFilePath:(NSString* )filePath withFileName:(NSString* )fileName
{
    //获取沙盒路径
    NSString* path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    //拼接文件夹路径
    path = [path stringByAppendingPathComponent:filePath];
    //判断这个文件夹路径path是否存在
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) {
        //创建
        [[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
    //拼接文件名
    path = [path stringByAppendingPathComponent:fileName];
//    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
//    {
//        //文件不存在
//        [[NSFileManager defaultManager] createFileAtPath:path contents:nil attributes:nil];
//    }
    return path;
}

//把汉字转化为拼音
- (NSString* )getTransformString
{
    CFStringRef theString = (CFStringRef)self;
    CFMutableStringRef mutableString = CFStringCreateMutableCopy(NULL, 0, theString);
    CFStringTransform(mutableString, 0, kCFStringTransformMandarinLatin, NO);
    CFStringTransform(mutableString, 0, kCFStringTransformStripDiacritics, NO);
    return [NSString stringWithFormat:@"%@",mutableString];
}
@end
