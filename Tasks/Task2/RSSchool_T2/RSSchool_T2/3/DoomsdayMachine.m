#import "DoomsdayMachine.h"

@interface AssimilationInfoClass : NSObject<AssimilationInfo>
@property (nonatomic, readonly) NSInteger years;
@property (nonatomic, readonly) NSInteger months;
@property (nonatomic, readonly) NSInteger weeks;
@property (nonatomic, readonly) NSInteger days;
@property (nonatomic, readonly) NSInteger hours;
@property (nonatomic, readonly) NSInteger minutes;
@property (nonatomic, readonly) NSInteger seconds;
@end

@interface AssimilationInfoClass ()
@property (nonatomic) NSInteger years;
@property (nonatomic) NSInteger months;
@property (nonatomic) NSInteger weeks;
@property (nonatomic) NSInteger days;
@property (nonatomic) NSInteger hours;
@property (nonatomic) NSInteger minutes;
@property (nonatomic) NSInteger seconds;
@end

@implementation AssimilationInfoClass
-(AssimilationInfoClass *)initWithYears:(NSInteger)years
                                 months:(NSInteger)months
                                   days:(NSInteger)days
                                  hours:(NSInteger)hours
                                minutes:(NSInteger)minutes
                                seconds:(NSInteger)seconds
{
    if (self = [super init]) {
        self.years = years;
        self.months = months;
        self.days = days;
        self.hours = hours;
        self.minutes = minutes;
        self.seconds = seconds;
    }
    
    return self;
}
@end

@interface DoomsdayMachine()
@property (nonatomic) NSDate *doomsdayDate;
@end

@implementation DoomsdayMachine
-(DoomsdayMachine *)init {
    if(self = [super init]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
        [dateFormatter setTimeZone:gmt];
        [dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];
        NSDate *assimilationDate = [dateFormatter dateFromString:@"2208:08:14 03:13:37"];
        self.doomsdayDate = assimilationDate;
    }
    return self;
}

- (NSString *)doomsdayString {
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:self.doomsdayDate];
    NSInteger year = [components year];
    NSInteger month = [components month];
    NSInteger day = [components day];
    NSString *monthStr = @"";
    
    switch (month) {
        case 1:
        monthStr = @"January";
            break;
        case 2:
            monthStr = @"February";
            break;
        case 3:
            monthStr = @"March";
            break;
        case 4:
            monthStr = @"April";
            break;
        case 5:
            monthStr = @"May";
            break;
        case 6:
            monthStr = @"June";
            break;
        case 7:
            monthStr = @"July";
            break;
        case 8:
            monthStr = @"August";
            break;
        case 9:
            monthStr = @"September";
            break;
        case 10:
            monthStr = @"October";
            break;
        case 11:
            monthStr = @"November";
            break;
        case 12:
            monthStr = @"December";
            break;
    }
    
    NSDateFormatter *dateFormatter = [[[NSDateFormatter alloc] init] autorelease];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dayOfWeek = [dateFormatter stringFromDate: self.doomsdayDate];
    NSString *str = [[NSString alloc] initWithFormat:@"%@, %@ %lu, %lu", dayOfWeek, monthStr, (unsigned long)day, (unsigned long)year];
    
    return str;
}

- (id<AssimilationInfo>)assimilationInfoForCurrentDateString:(NSString *)dateString {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *gmt = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [dateFormatter setTimeZone:gmt];
    [dateFormatter setDateFormat:@"yyyy:MM:dd HH:mm:ss"];

    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    NSTimeZone *gmt2 = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
    [dateFormatter2 setTimeZone:gmt2];
    [dateFormatter2 setDateFormat:@"yyyy:MM:dd@ss\\mm/HH"];
    NSDate *date = [dateFormatter2 dateFromString:dateString];
    
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSUInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *components = [gregorian components:unitFlags
                                                fromDate:date
                                                  toDate:self.doomsdayDate options:0];
    NSInteger months = [components month];
    NSInteger days = [components day];
    NSInteger years = [components year];
    NSInteger hours = [components hour];
    NSInteger minutes = [components minute];
    NSInteger seconds = [components second];
    
    AssimilationInfoClass *info =  [[AssimilationInfoClass alloc] initWithYears:years
                                                                         months:months
                                                                           days:days
                                                                          hours:hours
                                                                        minutes:minutes
                                                                        seconds:seconds];
    
    return info;
}
@end


