//
//  MyDateObject.m
//  FinalProject
//
//  Created by 472 on 2017/1/2.
//  Copyright © 2017年 student. All rights reserved.
//

#import "MyDateObject.h"

@implementation MyDateObject

static MyDateObject *_myDateObject = nil;

- (id)init {
    self = [super init];
    
    if(self) {
        NSCalendar *nowCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
        NSDateComponents *nowTime = [nowCalendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSDate date]];
        
        todayYear = nowTime.year;
        todayMonth = nowTime.month;
        todayDay = nowTime.day;
        
        selectYaer = nowTime.year;
        selectMonth = nowTime.month;
        selectDay = nowTime.day;
    }
    
    return self;
}

+ (id)alloc {
    @synchronized ([MyDateObject class]) {
        NSCAssert(_myDateObject == nil, @"_myDateObject have");
        _myDateObject = [super alloc];
        
        return _myDateObject;
    }
    return nil;
}

+ (MyDateObject *)sharedMyDateObject {
    @synchronized ([MyDateObject class]) {
        
        if (!_myDateObject)
            [[self alloc] init];
        
        return _myDateObject;
    }
    return nil;
}

- (void)setYear:(NSInteger)sYear {
    selectYaer = sYear;
}

- (void)setMonth:(NSInteger)sMonth {
    selectMonth = sMonth;
}

- (void)setDay:(NSInteger)sDay {
    selectDay = sDay;
}

- (void)addMonth {
    selectMonth++;
    if( selectMonth == 13 ){
        selectYaer++;
        selectMonth = 1;
    }
}

- (void)unaddMonth {
    selectMonth--;
    if( selectMonth == 0 ){
        selectYaer--;
        selectMonth = 12;
    }
}

- (void)todayMonth {
    selectYaer = todayYear;
    selectMonth = todayMonth;
    selectDay = todayDay;
}

- (NSString *)getTodayYear {
    return [@(todayYear) stringValue];
}

- (NSString *)getTodayMonth {
    return [@(todayMonth) stringValue];
}

- (NSString *)getTodayDay {
    return [@(todayDay) stringValue];
}

- (NSString *)getYear {
    return [@(selectYaer) stringValue];
}

- (NSString *)getMonth {
    return [@(selectMonth) stringValue];
}

- (NSString *)getDay {
    return [@(selectDay) stringValue];
}

- (BOOL)isToday {
    if( selectYaer == todayYear
       && selectMonth == todayMonth
       && selectDay == todayDay ) return YES;
    else return NO;
}

- (NSString *)getLongDate {
    
    NSString *temp = [ NSString stringWithFormat:@"%ld/%ld/%ld", (long)selectYaer, (long)selectMonth, (long)selectDay ];
    
    return temp;
}

- (NSString *)getShortDate {
    
    NSString *temp = [ NSString stringWithFormat:@"%ld %ld", (long)selectYaer, (long)selectMonth ];
    
    return temp;
}

- (NSString *)getFirstDayInMonth {
    
    NSString *temp = [NSString stringWithFormat:@"%ld/%ld/%@", (long)selectYaer, (long)selectMonth, @"1"];
    
    return temp;
}

+ (NSDate *)stringToDate:(NSString *)dateString {
    
    NSDateFormatter *tempFormatter = [[NSDateFormatter alloc] init];
    [tempFormatter setDateFormat:@"yyyy/MM/dd"];
    
    NSDate *tempDate = [[NSDate alloc] init];
    tempDate = [tempFormatter dateFromString:dateString];
    
    return tempDate;
}

+ (NSInteger)numberOfDaysInMonth:(NSDate *)selectDate {
    
    NSCalendar *tempCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSRange tempRange = [tempCalendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:selectDate];
    
    return tempRange.length;
}

+ (NSInteger)weekdayWithDate:(NSDate *)selectDate {
    
    NSCalendar *tempCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    return [tempCalendar component:NSCalendarUnitWeekday fromDate:selectDate];
}

@end
