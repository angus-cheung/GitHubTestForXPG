//
//  iPhoneTools.m
//  Model
//
//  Created by chenggk on 13-4-5.
//  Copyright (c) 2013年 21cn. All rights reserved.
//

#import "iPhoneTools.h"
#import <UIKit/UIKit.h>
#include <sys/sysctl.h>
#include <mach/mach.h>
#include <mach/mach_init.h>
#include <mach/task.h>
#include <mach/task_info.h>
#include <sys/socket.h>
#include <sys/sysctl.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <uuid/uuid.h>
#include <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>
#import <dirent.h>
#import <sys/stat.h>
#import <sys/types.h>

 


 
 


@implementation iPhoneTools

+ (NSString*)getIMEI
{
    
    /*
    char buffer[128] = {0};
    getIMEI(buffer);
    */
    return @"NULL";
}


+ (NSString *)documentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}


+ (NSString *)cachePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}


+ (BOOL)isFileExists:(NSString*)filePath
{
	return [[NSFileManager defaultManager] fileExistsAtPath:filePath];
}


+ (bool)isDirExists:(NSString*)dirPath
{
    if(!dirPath)
    {
        return false;
    }
    
	DIR* dir;
	dir= opendir([dirPath UTF8String]);
	if(dir == NULL)
	{
		return false;
	}
	closedir(dir);
	return true;
}

+ (bool)createDir:(NSString*)dir
{
	return [[NSFileManager defaultManager] createDirectoryAtPath:dir withIntermediateDirectories:YES attributes:nil error:nil];
}


+ (bool)createDirIfNoExists:(NSString*)dir
{
    if ([self isDirExists:dir])
    {
        return NO;
    }
    
    return [self createDir:dir];
}


+ (NSString*)getCacheSize
{
    NSString* cachePath = [self cachePath];
    NSString* fullPath = [NSString stringWithFormat:@"%@/com.news.21cn.-1CNNews/EGOCache", cachePath];
    uint64_t size = [self fileSizeOnDisk:fullPath];
    
    if (size >= 102)
    {
        size -= 102;
    }
    
    if (size >= 1024)
    {
        return [NSString stringWithFormat:@"%lldM", size / 1024];
    }
    
        
    return [NSString stringWithFormat:@"%lldK", size];
}


+ (NSString*)getCurrentVersion
{
    return @"v1.0版本";
 }


+ (uint64_t)fileSizeOnDisk:(NSString*)path
{
    if (path && [path length] > 0)
    {
        NSFileManager *manager = [[NSFileManager alloc] init];
        NSDictionary *attributes = [manager attributesOfItemAtPath:path error:NULL];
        [manager release];
        if (attributes)
        {
            return [attributes fileSize];
        }
        else
        {
            return 0;
        }
    }
    else
    {
        return 0;
    }
}


+ (UIColor *) colorWithHexString: (NSString *)color
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+(BOOL)isUnderWIFIConnect{
    
    return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
    

}

+ (BOOL) isUnder3GConnect{
    
    return([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
    
}

+(BOOL)isPhone4{
    return [HOTEDeviceUtils getDeviceVersion] == UIDevice_iPhoneHiRes;
}

+(BOOL)isPhone5{
    return [HOTEDeviceUtils getDeviceVersion] == UIDevice_iPhoneTallerHiRes;
}

+(void)ShowFontFromIOS{
    NSArray *familyNames =[[NSArray alloc]initWithArray:[UIFont familyNames]];
    NSArray *fontNames;
    NSInteger indFamily, indFont;
    for(indFamily=0;indFamily<[familyNames count];++indFamily){
        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
        fontNames =[[NSArray alloc]initWithArray:[UIFont fontNamesForFamilyName:[familyNames objectAtIndex:indFamily]]];
        for(indFont=0; indFont<[fontNames count]; ++indFont){
            NSLog(@"    Font name: %@",[fontNames objectAtIndex:indFont]);
        }
        [fontNames release];
        
	}
    
	[familyNames release];
}

 

@end
