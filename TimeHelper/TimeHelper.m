

//
//  TimeObject.m
//  KamunShangCheng
//
//  Created by Michael Li on 2018/7/26.
//  Copyright © 2018年 Michael Li. All rights reserved.
//

#import "TimeHelper.h"

@implementation TimeHelper
/*当前0点0分*/
+(NSString *)currentZeroTime
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDate *currentDate = [NSDate date];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSDate *zeroDate = [calendar dateFromComponents:components];
    NSTimeInterval currentZeroTime = [zeroDate timeIntervalSince1970]*1000;
    NSString *currentZeroTimeStr = [NSString stringWithFormat:@"%.0f",currentZeroTime];
    return currentZeroTimeStr;
}
/*某一天0点0分*/
+(NSString *)whichDayZeroTime:(NSInteger )yearTime withMonthTime:(NSInteger )monthTime withDayTime:(NSInteger )dayTime
{
    NSString *dataTime = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)yearTime,(long)monthTime,(long)dayTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString* beginStr = [NSString stringWithFormat:@"%@ 00:00:00",dataTime];
    NSDate *beginDate=[formatter dateFromString:beginStr];
    NSTimeInterval dayZeroTime = [beginDate timeIntervalSince1970]*1000;
    NSString *dayZeroTimeStr = [NSString stringWithFormat:@"%.0f",dayZeroTime];
    return dayZeroTimeStr;
}
/*当前时间毫秒*/
+(NSTimeInterval )whichTime:(NSString *)time
{
//    NSString *dataTime = [NSString stringWithFormat:@"%ld-%ld-%ld",(long)yearTime,(long)monthTime,(long)dayTime];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY/MM/dd"];
//    NSString* beginStr = [NSString stringWithFormat:@"%@ 00:00:00",dataTime];
    NSDate *beginDate=[formatter dateFromString:time];
    NSTimeInterval dayZeroTime = [beginDate timeIntervalSince1970]*1000;
    return dayZeroTime;
}
/*本周日0点0分*/
+(NSString *)currentWeekZeroTime
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
    // 得到星期几
    // 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
    NSInteger weekDay = [comp weekday];
    //XLog(@"weekDay:%ld",(long)weekDay);//5
    // 得到几号
    NSInteger day = [comp day];
    //XLog(@"day:%ld",(long)day);//2
//    //XLog(@"weekDay:%ld  day:%ld",weekDay,day);
    
    // 计算当前日期和这周的星期一和星期天差的天数
    long firstDiff,lastDiff;
    if (weekDay == 1) {
        firstDiff = 1;
        lastDiff = 0;
    }else{
        firstDiff = [calendar firstWeekday] - weekDay;
        lastDiff = 7 - weekDay;
    }
    
    // 在当前日期(去掉了时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek= [calendar dateFromComponents:firstDayComp];
    
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek= [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    //XLog(@"一周开始 %@",[formater stringFromDate:firstDayOfWeek]);
    NSString *sundayString = [NSString stringWithFormat:@"%@",[formater stringFromDate:firstDayOfWeek]];
    NSDate *lastDate = [formater dateFromString:sundayString];
    long firstStamp = [lastDate timeIntervalSince1970]*1000;
    //XLog(@"firstStamp:%ld",firstStamp);
    //XLog(@"当前 %@",[formater stringFromDate:now]);
    //XLog(@"一周结束 %@",[formater stringFromDate:lastDayOfWeek]);
    NSString *timeStr = [NSString stringWithFormat:@"%ld",firstStamp];
    //XLog(@"timeStr:%@",timeStr);
    return timeStr;
}
//当月第一天
+(NSString *)currentMonthFirstDayTime
{
    NSDate*currentDate = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];NSInteger year=[components year];
    NSInteger month=[components month];
    //构造当月的1号时间
    NSDateComponents *firstDayCurrentMonth = [[NSDateComponents alloc] init];
    [firstDayCurrentMonth setYear:year];
    [firstDayCurrentMonth setMonth:month];
    [firstDayCurrentMonth setDay:1];
    //当月1号
    NSDate *firstDayOfCurrentMonth = [calendar dateFromComponents:firstDayCurrentMonth];
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[firstDayOfCurrentMonth timeIntervalSince1970]*1000];
    return timeStr;
}

- (void)getCurrentWeek
{
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitWeekday
                                         fromDate:now];
    // 得到星期几
    // 1(星期天) 2(星期二) 3(星期三) 4(星期四) 5(星期五) 6(星期六) 7(星期天)
    NSInteger weekDay = [comp weekday];
    // 得到几号
    NSInteger day = [comp day];
    
//    //XLog(@"weekDay:%ld  day:%ld",weekDay,day);
    
    // 计算当前日期和这周的星期一和星期天差的天数
    long firstDiff,lastDiff;
    if (weekDay == 1) {
        firstDiff = 1;
        lastDiff = 0;
    }else{
        firstDiff = [calendar firstWeekday] - weekDay;
        lastDiff = 7 - weekDay;
    }
    
    // 在当前日期(去掉了时分秒)基础上加上差的天数
    NSDateComponents *firstDayComp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [firstDayComp setDay:day + firstDiff];
    NSDate *firstDayOfWeek= [calendar dateFromComponents:firstDayComp];
    
    NSDateComponents *lastDayComp = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:now];
    [lastDayComp setDay:day + lastDiff];
    NSDate *lastDayOfWeek= [calendar dateFromComponents:lastDayComp];
    
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd"];
    //XLog(@"一周开始 %@",[formater stringFromDate:firstDayOfWeek]);
    NSString *sundayString = [NSString stringWithFormat:@"%@",[formater stringFromDate:firstDayOfWeek]];
    NSDate *lastDate = [formater dateFromString:sundayString];
    long firstStamp = [lastDate timeIntervalSince1970]*1000;
    //XLog(@"firstStamp:%ld",firstStamp);
    //XLog(@"当前 %@",[formater stringFromDate:now]);
    //XLog(@"一周结束 %@",[formater stringFromDate:lastDayOfWeek]);
    
    /**
     2018-08-02 11:05:51.836838+0800 KamunShangCheng[916:169288] 一周开始 2018-07-29
     2018-08-02 11:05:51.837603+0800 KamunShangCheng[916:169288] 当前 2018-08-02
     2018-08-02 11:06:07.599108+0800 KamunShangCheng[916:169288] 一周结束
     */
    
}
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *oneDayStr = [dateFormatter stringFromDate:oneDay];
    NSString *anotherDayStr = [dateFormatter stringFromDate:anotherDay];
    NSDate *dateA = [dateFormatter dateFromString:oneDayStr];
    NSDate *dateB = [dateFormatter dateFromString:anotherDayStr];
    NSComparisonResult result = [dateA compare:dateB];
    //XLog(@"oneDay : %@, anotherDay : %@", oneDay, anotherDay);
    /**
     //该方法用于排序时调用:
     . 当实例保存的日期值与anotherDate相同时返回NSOrderedSame
     . 当实例保存的日期值晚于anotherDate时返回NSOrderedDescending
     . 当实例保存的日期值早于anotherDate时返回NSOrderedAscending
     */
    if (result == NSOrderedDescending) {
        //在指定时间前面 过了指定时间 过期
        //XLog(@"oneDay  is in the future");
        return 1;
    }
    else if (result == NSOrderedAscending){
        //没过指定时间 没过期
        ////XLog(@"Date1 is in the past");
        return -1;
    }else {
        return 0;
        
    }
    //刚好时间一样.
    ////XLog(@"Both dates are the same");
    
}
+ (NSDate *)getCurrentTime{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd hh:mm:ss"];
    NSString *dateTime=[formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:dateTime];
    return date;
}
@end
