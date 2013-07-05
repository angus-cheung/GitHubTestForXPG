//
//  iPhoneTools.h
//  Model
//
//  Created by chenggk on 13-4-5.
//  Copyright (c) 2013年 21cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "iThermoAppKeys.h"
#import "HOTEDeviceUtils.h"
#import "HOTEDateUtil.h"

@interface iPhoneTools : NSObject

 
//SandBox Document
+ (NSString *)documentPath;
//SandBox Cache
+ (NSString *)cachePath;

//File Manager
+ (BOOL)isFileExists:(NSString*)filePath;

+ (bool)isDirExists:(NSString*)dirPath;

+ (bool)createDir:(NSString*)dir;

+ (bool)createDirIfNoExists:(NSString*)dir;

+ (NSString*)getCacheSize;

+ (uint64_t)fileSizeOnDisk:(NSString*)path;
//16进制颜色转换RGB格式
+(UIColor *)colorWithHexString: (NSString *)color;

//NetWork Reachablility 网络判断
+(BOOL)isUnderWIFIConnect;
+(BOOL)isUnder3GConnect;

//iPhone Version
+(BOOL)isPhone5;
+(BOOL)isPhone4;

+(void)ShowFontFromIOS;


@end
