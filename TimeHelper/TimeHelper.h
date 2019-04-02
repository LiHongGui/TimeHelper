//
//  TimeObject.h
//  KamunShangCheng
//
//  Created by Michael Li on 2018/7/26.
//  Copyright © 2018年 Michael Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeHelper : NSObject
+(NSString *)currentZeroTime;
+(NSString *)whichDayZeroTime:(NSInteger )yearTime withMonthTime:(NSInteger )monthTime withDayTime:(NSInteger )dayTime;
+(NSTimeInterval )whichTime:(NSString *)time;
+(NSString *)currentWeekZeroTime;
+(NSString *)currentMonthFirstDayTime;
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
+ (NSDate *)getCurrentTime;
@end
