//
//  HOTEDevicesUtil.m
//  testEGO
//
//  Created by HOTECH on 10/26/12.
//  Copyright (c) 2012 HOTECH. All rights reserved.
//

#import "HOTEDeviceUtils.h"
#import "Reachability.h"
@implementation HOTEDeviceUtils


+(NSInteger)getDeviceVersion{
    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone){
        if ([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) {
            CGSize result = [[UIScreen mainScreen] bounds].size;
            result = CGSizeMake(result.width * [UIScreen mainScreen].scale, result.height * [UIScreen mainScreen].scale);
            return ((result.height == 960 || result.height == 480)  ? UIDevice_iPhoneHiRes : UIDevice_iPhoneTallerHiRes);
        } else
            return UIDevice_iPhoneStandardRes;
    } else
        return (([[UIScreen mainScreen] respondsToSelector: @selector(scale)]) ? UIDevice_iPadHiRes : UIDevice_iPadStandardRes);
}


+(NSInteger)getOSVersion{
     
    float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    if(version >= 6.0f){
        return UIDevice_iOS6;
    }else if(version < 6.0f && version >=5.0f){
        return UIDevice_iOS5;
    
    }else{
        return UIDevice_iOS4;
    }
     
}

+(BOOL)checkNetwork{
    
    Reachability*  reachability = [Reachability reachabilityForInternetConnection];
    int status = [reachability currentReachabilityStatus];
    BOOL flag = status==NotReachable?YES:NO ;
    if (flag) {  //没有连接到网络就弹出提实况
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"亲爱的用户"
                              
                                                        message:@"网络连接失败"
                              
                                                       delegate:nil
                              
                                              cancelButtonTitle:@"知道了" otherButtonTitles:nil];
        
        [alert show];
        
        [alert release];
        
    }
    NSLog(@"%d",status);
    return flag;

    
}
@end
