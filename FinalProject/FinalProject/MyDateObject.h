//
//  MyDateObject.h
//  FinalProject
//
//  Created by 472 on 2017/1/2.
//  Copyright © 2017年 student. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyDateObject : NSObject {
@private
    NSInteger todayYear;
    NSInteger todayMonth;
    NSInteger todayDay;
    
    NSInteger selectYaer;
    NSInteger selectMonth;
    NSInteger selectDay;
}

+ (MyDateObject *)sharedMyDateObject;

- (void)setYear:(NSInteger)sYear;
- (void)setMonth:(NSInteger)sMonth;
- (void)setDay:(NSInteger)sDay;
- (void)addMonth;
- (void)unaddMonth;
- (void)todayMonth;
- (NSString *)getTodayYear;
- (NSString *)getTodayMonth;
- (NSString *)getTodayDay;
- (NSString *)getYear;
- (NSString *)getMonth;
- (NSString *)getDay;
- (BOOL)isToday;
- (NSString *)getLongDate;
- (NSString *)getShortDate;
- (NSString *)getFirstDayInMonth;

+ (NSDate *)stringToDate:(NSString *)dateString;
+ (NSInteger)numberOfDaysInMonth:(NSDate *)selectDate;
+ (NSInteger)weekdayWithDate:(NSDate *)selectDate;

@end
