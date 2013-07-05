//
//  HOTEDateUtil.h
//  Hotech-iOS
//
//  Created by HOTECH on 10/11/12.
//  Copyright (c) 2012 HOTECH. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DisplayDateFormat @"yyyy.MM.dd  HH:mm:ss"

#define ChineseDateFormat @"yyyy年MM月dd日 HH时mm分ss秒" //默认中文日期格式
#define ChineseDateFormatWithWeek @"yyyy年MM月dd日 E HH时mm分ss秒"//默认中文日期格式带星期几

#define SimpleDateToDay @"yyyy-MM-dd"//默认格式 具体到日
#define TheDayFormat @"dd" //只获取天数
#define MMdd @"MM-dd"
#define headerFormat @"MM月dd日 HH时mm分"

@interface HOTEDateUtil : NSObject{
    
    

}

//通过特定格式获取当前时间
+(NSString*)stringCurrentDateWithFormat:(NSString*)dateFormat;

//获取当前时间(当前时区)
+(NSDate*)currentDate;
//根据指定格式 NSDate时间转换成NSString
//define ChineseDateFormat @"yyyy年MM月dd日 HH时mm分ss秒"
+(NSString*)stringWithDateFormat:(NSString*)dateFormat FromDate:(NSDate*)date;

//获取当前时间毫秒
+(long long)currentTimeMillis;

//计算与当前时间的差距 以字符串格式返回 （格式   n分钟 n小时 n天 前/后）
+(NSString*)stringWithFormatByCountingTimeSinceNow:(NSDate*)date;

//获取当前日期天数(号数)
+(NSString*)currentDay;


@end
