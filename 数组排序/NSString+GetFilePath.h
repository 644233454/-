//
//  NSString+GetFilePath.h
//  asi上传和下载
//
//  Created by 索光传 on 15-7-8.
//  Copyright (c) 2015年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (GetFilePath)

//返回文件夹和文件名路径(得到路径可能存在，也可能不存在)
+ (NSString* )getFilePath:(NSString* )filePath withFileName:(NSString* )fileName;
//返回文件路径（必须存在）
+ (NSString* )getExistsFilePath:(NSString* )filePath withFileName:(NSString* )fileName;
//把汉字转化为拼音
- (NSString* )getTransformString;
@end
