#import "Pangrams.h"

@implementation Pangrams

- (BOOL)pangrams:(NSString *)string {
    
    NSDictionary *dict = @{ @"a": @0,
                            @"b": @0,
                            @"c": @0,
                            @"d": @0,
                            @"e": @0,
                            @"f": @0,
                            @"g": @0,
                            @"h": @0,
                            @"i": @0,
                            @"j": @0,
                            @"k": @0,
                            @"l": @0,
                            @"m": @0,
                            @"n": @0,
                            @"o": @0,
                            @"p": @0,
                            @"q": @0,
                            @"r": @0,
                            @"s": @0,
                            @"t": @0,
                            @"u": @0,
                            @"v": @0,
                            @"w": @0,
                            @"x": @0,
                            @"y": @0,
                            @"z": @0};
    
    NSMutableDictionary *mDict = [dict mutableCopy];
    
    NSUInteger count = [string length];
    
    if (count > 1000) {
        NSLog(@"string must be less that 1000 letters");
        return NO;
    }

    for(NSUInteger i = 0; i < count; i++) {
        NSString *key = [string substringWithRange:NSMakeRange(i, 1)];
        key = [key lowercaseString];
        if (mDict[key]) {
            [mDict setValue:@1 forKey:key];
        }
    }
    
    for(NSString *key in dict) {
        if([@0 isEqual:[mDict objectForKey:key]]) {
            return NO;
        }
    }
    
    return YES;
}

@end
