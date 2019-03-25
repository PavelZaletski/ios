#import "Diagonal.h"

@implementation Diagonal

- (NSNumber *) diagonalDifference:(NSArray *)array {
    NSUInteger index = 0;
    NSNumber *sum1 = @0;
    NSNumber *sum2 = @0;
    NSUInteger count = [array count];

    for (NSString *str in array) {
        NSArray *chunks = [str componentsSeparatedByString: @" "];
        NSNumber *number1 = [chunks objectAtIndex:index];
        NSNumber *number2 = [chunks objectAtIndex:(count - index - 1)];
        
        if (![self isInRange:number1] || ![self isInRange:number2]) {
            NSLog(@"Numbers must be in range (-100, 100)");
        }
        
        sum1 = @([sum1 intValue] + [number1 intValue]);
        sum2 = @([sum2 intValue] + [number2 intValue]);
        index = index + 1;
    }
    
    NSNumber *result = @([sum1 integerValue] - [sum2 integerValue]);
    return [self absoluteValue:result];
}

-(NSNumber *)absoluteValue:(NSNumber *)input {
    return [NSNumber numberWithInteger:abs([input intValue])];
}

-(BOOL)isInRange:(NSNumber *)value {
    if ([value intValue] >= -100 || [value intValue] <= 100) {
        return YES;
    } else {
        return NO;
    }
}

@end
