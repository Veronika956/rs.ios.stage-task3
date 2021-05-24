#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    switch (monthNumber) {
        case 1: return @"January";
        case 2: return @"February";
        case 3: return @"March";
        case 4: return @"April";
        case 5: return @"May";
        case 6: return @"June";
        case 7: return @"July";
        case 8: return @"August";
        case 9: return @"September";
        case 10: return @"October";
        case 11: return @"November";
        case 12: return @"December";
        default:
            return nil;
    };
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {

    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    
    NSDate *dateFromString = [formatter dateFromString: date];
    long day = [calendar component: NSCalendarUnitDay fromDate: dateFromString];
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"EEE";
    formatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_Ru"];
    NSLog(@"The day of the week: %@", [formatter stringFromDate: date]);
    
    return [formatter stringFromDate: date];

}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    unsigned int weekOfYear = (unsigned int)[calender component:NSCalendarUnitWeekOfYear fromDate: date];
    
    if (weekOfYear == 21){
        return YES;
    }else{
        return NO;
    }
}

@end
