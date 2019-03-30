#import "RomanTranslator.h"

@implementation RomanTranslator
-(id)init {
    if (self = [super init])  {
        self.romanArabicArray = [[NSArray alloc] initWithObjects:
                                 @[@"M", @"1000"],
                                 @[@"CM", @"900"],
                                 @[@"D", @"500"],
                                 @[@"CD", @"400"],
                                 @[@"C", @"100"],
                                 @[@"XC", @"90"],
                                 @[@"L", @"50"],
                                 @[@"XL", @"40"],
                                 @[@"X", @"10"],
                                 @[@"IX", @"9"],
                                 @[@"V", @"5"],
                                 @[@"IV", @"4"],
                                 @[@"I", @"1"], nil];;
    }
    return self;
}

- (NSString *)arabicFromRoman:(NSString *)romanString {
    NSUInteger sum = 0;
    
    for (NSArray *obj in self.romanArabicArray) {
        NSString *key = obj[0];
        
        
        while ([romanString hasPrefix:key] == YES) {
            romanString = [romanString substringFromIndex:[key length]];
            NSString *value = obj[1];
            sum += [value integerValue];
        }
    }
    
    return [NSString stringWithFormat:@"%lu", (unsigned long)sum];
}

- (NSString *)romanFromArabic:(NSString *)arabicString {
    NSUInteger srcArabicValue = [arabicString integerValue];
    NSString *resultRomanString = @"";
    NSUInteger i = 0;

    while (srcArabicValue > 1) {
        NSArray *obj = self.romanArabicArray[i];
        NSUInteger arabicValue = [obj[1] integerValue];
        NSString *romanValue = obj[0];
        NSUInteger result = srcArabicValue / arabicValue;
        NSUInteger modulo = srcArabicValue % arabicValue;
        
        if (result > 0) {
            for(NSUInteger i = 0; i < result; i++) {
                resultRomanString = [resultRomanString stringByAppendingString: romanValue];
            }
        }
        
        srcArabicValue = modulo;
        i++;
    }
    
    return resultRomanString;
}
@end
