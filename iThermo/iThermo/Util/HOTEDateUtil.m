//
//  HOTEDateUtil.m
//  Hotech-iOS
//
//  Created by HOTECH Angus on 10/11/12.
//  Copyright (c) 2012 HOTECH. All rights reserved.
//

#import "HOTEDateUtil.h"

@implementation HOTEDateUtil

+(NSString *)stringCurrentDateWithFormat:(NSString *)dateFormat{
    return [self stringWithDateFormat:dateFormat FromDate:[self currentDate]];
}

//获取当前时间(当前时区)
+(NSDate *)currentDate{
    NSDate* currentDate = nil;
    
    //通过计算时区的秒差 计算当前时区
    NSDate* englishDate =[NSDate date];
    // NSLog(@" timezone %@",[[NSTimeZone systemTimeZone]description ]);
    NSTimeInterval timeZoneOffset=[[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate* newDate=[englishDate dateByAddingTimeInterval:timeZoneOffset];
    currentDate = newDate;
    
    return currentDate;
}

//根据指定格式 NSDate时间转换成NSString
//define ChineseDateFormat @"yyyy年MM月dd日 HH时mm分ss秒"
+(NSString*)stringWithDateFormat:(NSString*)dateFormat FromDate:(NSDate*)date{
    
    
    //设置时区 locale 确保能在真机上显示
    NSTimeZone* localzone = [NSTimeZone localTimeZone];
    NSDateFormatter* formatter =[[[NSDateFormatter alloc]init]autorelease];
    [formatter setDateFormat:dateFormat];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    [formatter setLocale:locale];
    [locale release];
    [formatter setTimeZone:localzone];
    //时区修复
    NSTimeInterval timeZoneOffset = [[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate* newDate = [date dateByAddingTimeInterval:-timeZoneOffset];
    
    NSString* formattedString = [formatter stringFromDate:newDate];
    
    //英文星期几 转换为中文
    if([formattedString rangeOfString:@"Mon"].length > 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Mon" withString:@"周一"];
    }
    if([formattedString rangeOfString:@"Tue"].length > 0){
        formattedString =  [formattedString stringByReplacingOccurrencesOfString:@"Tue" withString:@"周二"];
    }
    if([formattedString rangeOfString:@"Web"].length > 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Web" withString:@"周三"];
    }
    if([formattedString rangeOfString:@"Thu"].length > 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Thu" withString:@"周四"];
    }
    if([formattedString rangeOfString:@"Fri"].length> 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Fri" withString:@"周五"];
    }
    if([formattedString rangeOfString:@"Sat"].length> 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Sat" withString:@"周六"];
    }
    if([formattedString rangeOfString:@"Sun"].length> 0){
        formattedString = [formattedString stringByReplacingOccurrencesOfString:@"Sun" withString:@"周日"];
    }
    
    return formattedString;
    
}

//获取当前时间毫秒
+(long long)currentTimeMillis{
    NSDate* now = [[[NSDate alloc]init]autorelease];
    NSTimeInterval timeInterval = [now timeIntervalSince1970];
    return (long long)timeInterval*1000;//毫秒
}

//计算与当前时间的差距 以字符串格式返回 （格式   n分钟 n小时 n天 前）
+(NSString *)stringWithFormatByCountingTimeSinceNow:(NSDate *)date{
    //使用可变的字符串类 方便处理日期信息显示
    NSMutableString* result = [[NSMutableString alloc]init];
    
    //时区修复
    NSTimeInterval timeZoneOffset=[[NSTimeZone systemTimeZone] secondsFromGMT];
    NSDate* date_new=[date dateByAddingTimeInterval:-timeZoneOffset];
    
    NSDate* nowDate = [NSDate date];
    double now = [nowDate timeIntervalSince1970];
    double beforeTime =[date_new timeIntervalSince1970];
    int interval = now - beforeTime;
    int intervalOrignal = now - beforeTime;
    if(interval < 0) interval = -intervalOrignal;
    
    // NSLog(@" interval %d",interval);
    int dms = interval/(24*60*60);
    
    //NSLog(@" dms %d",dms);
    //记录 时间差的 日 时 分 秒
    int day  = 0;
    int hours = 0;
    int minutes = 0;
    int seconds = 0;
    //判断差距的时长 超过1天 / 1 小时 /1 分钟
    if(dms > 0){
        day  = dms;
        hours = (interval -day*(24*60*60))/(60*60);
        minutes = (interval - day*(24*60*60) - hours*(60*60))/60;
        seconds = (interval - day*(24*60*60) - hours*(60*60) - minutes*60);
        
    }else if( (dms = interval/(60*60))>0){
        hours = dms;
        minutes = (interval-hours*(60*60))/60;
        seconds = interval - hours*(60*60) - minutes*60;
        
    }else if((dms = interval/60)>0){
        minutes = dms;
        seconds = interval - minutes*60;
        
    }else{
        seconds = interval;
    }
    
    //返回 N天 N小时 N 分 N秒 前
    //若 N = 0 则不显示 时间单位
    
    if(day!=0){
        [result appendString:[NSString stringWithFormat:@" %d天",day]];
        
    }
    
    if(hours!=0){
        [result appendString:[NSString stringWithFormat:@" %d小时",hours]];
    }
    
    if(minutes !=0){
        [result appendString:[NSString stringWithFormat:@" %d分",minutes]];
    }
    
    if(seconds !=0){
        [result appendString:[NSString stringWithFormat:@" %d秒",seconds]];
    }
    
    if(intervalOrignal > 0){
        [result appendString:@" 前"];
    }else{
        [result appendString:@" 后"];
    }
    
    return  [result autorelease];
}


+(NSString *)currentDay{
    NSDate* currentDate = [self currentDate];
    return [self stringWithDateFormat:TheDayFormat FromDate:currentDate];

}
@end
