//
//  HOTEDevicesUtil.h
//  testEGO
//
//  Created by HOTECH on 10/26/12.
//  Copyright (c) 2012 HOTECH. All rights reserved.
//
 


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//设备版本参数枚举
typedef enum {
    UIDevice_iPhoneStandardRes      = 1,    // iPhone 1,3,3GS Standard Resolution   (320x480px)
    UIDevice_iPhoneHiRes            = 2,    // iPhone 4,4S High Resolution          (640x960px)
    UIDevice_iPhoneTallerHiRes      = 3,    // iPhone 5 High Resolution             (640x1136px)
    UIDevice_iPadStandardRes        = 4,    // iPad 1,2 Standard Resolution         (1024x768px)
    UIDevice_iPadHiRes              = 5     // iPad 3 High Resolution               (2048x1536px)

}UIDeviceResolution;

typedef enum {
    UIDevice_iOS4 = 1, // iOS 4 以下
    UIDevice_iOS5 = 2, // iOS 5
    UIDevice_iOS6 = 3  // iOS 6
}UIDeviceOSVersionEnum;

 
 

@interface HOTEDeviceUtils : NSObject

//获取版本设备
+(NSInteger) getDeviceVersion;

//获取OS版本
+(NSInteger) getOSVersion;

+(BOOL) checkNetwork;
@end
