#import "SummArray.h"

@implementation SummArray

- (NSNumber *)summArray:(NSArray *)array {
    NSNumber *sum = @0;
    for (NSNumber *n in array) {
        sum = @([sum intValue] + [n intValue]);
    }
    return sum;
}

@end
