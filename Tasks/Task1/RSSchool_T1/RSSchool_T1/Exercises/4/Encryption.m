#import "Encryption.h"

@implementation Encryption

- (NSString *)encryption:(NSString *)string {
    string = [string stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if ([string length] > 81) {
        NSLog(@"The maximum message length can be characters.");
    }

    NSUInteger count = [string length];
    float a = sqrt(count);
    int columnsCount = ceil(a);
    NSString *tempStr = @"";
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    
    for(NSUInteger i = 0; i < count; i++) {
        NSString *key = [string substringWithRange:NSMakeRange(i, 1)];
        tempStr = [tempStr stringByAppendingString:key];
        
        if ([tempStr length] == columnsCount) {
            [arr addObject:tempStr];
            tempStr = @"";
        }
    }
    
    if (![tempStr isEqual:@""]){
        [arr addObject:tempStr];
    }
    
    NSString *result = @"";
    
    for(NSUInteger i = 0; i < columnsCount; i++) {
        if (i > 0) {
            result = [result stringByAppendingString:@" "];
        }
        
        for(NSUInteger j = 0; j < [arr count]; j++) {
            NSString *row = arr[j];
            
            if ([row length] > i) {
                NSString *letter = [row substringWithRange:NSMakeRange(i, 1)];
                result = [result stringByAppendingString:letter];
            }
        }
    }
    return result;
}

@end
