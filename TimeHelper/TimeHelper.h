//
//  TimeObject.h
//  KamunShangCheng
//
//  Created by Michael Li on 2018/7/26.
//  Copyright © 2018年 Michael Li. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  弹出日期类型
 */
typedef enum{
    /**
     *年月日时分
     */
    YMDMinS  = 0,
    /**
     *年月日时分
     */
    YMD,
    /**
     *年月
     */
    YM,
    MD,//月日
    HM,//时分
    Y,//年
    M,//月
    DMinS,//日时分
}YMDMS;
@interface TimeHelper : NSObject
/**
 *当前月多少天
 */
+(NSUInteger)numberOfDaysInMonthWithDate:(NSDate *)date;
+(NSString *)currentZeroTime;
+(NSString *)WhichDayZeroTime:(NSInteger )yearTime withMonthTime:(NSInteger )monthTime withDayTime:(NSInteger )dayTime;
+(NSString *)currentWeekZeroTime;
+(NSString *)currentMonthFirstDayTime;
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (NSString *)getCurrentTime;
+(NSInteger)getNowTimestamp;
/**
 *时间戳(毫秒转时间格式)
 */
+(NSString *)backGroundWith:(NSInteger)timestamp withYMDMS:(YMDMS)yMinDMSStyle;
/*当前时间毫秒*/
+(NSTimeInterval )whichTime:(NSString *)time;
/**
 *当前时间
 */
+ (NSString *)getCurrentYMDMS:(YMDMS)yMinDMSStyle;
+ (NSString *)getCurrentWeekDay;
+ (NSInteger )getCurrentDayDate;

+ (NSString *)getWhichYMDDate:(YMDMS)yMinDMSStyle withDate:(NSDate *)date;
+ (NSInteger )getSelectWhichNumberForSelectDate:(NSDate *)selectDate;
+ (NSString *)getSelectWhichweekDayForSelectWhichData:(NSDate *)selectDate;
/**
 *字符串转时间
 */
+(NSDate *)nsstringConversionNSDate:(NSString *)dateStr;
@end
