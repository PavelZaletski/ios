#import "Sorted.h"

@implementation ResultObject
@end

@implementation Sorted

- (ResultObject*)sorted:(NSString*)string {
    ResultObject *value = [ResultObject new];
    
    NSArray *sourceArray = [string componentsSeparatedByString: @" "];
    for (NSString *key in sourceArray) {
        if([key intValue] < 0 || [key intValue] > 1000000) {
            NSLog(@"values must be within interval 0 <= value <= 1000000");
        }
    }
    NSArray *sortedArray = [sourceArray sortedArrayUsingComparator:
                            ^NSComparisonResult(NSString *obj1, NSString *obj2){
                                if ([obj1 intValue] < [obj2 intValue]) {
                                    return NSOrderedAscending;
                                }
                                
                                if ([obj1 intValue] > [obj2 intValue]) {
                                    return NSOrderedDescending;
                                }
                                return NSOrderedSame;
                            }];
    
    if ([sourceArray isEqualToArray:sortedArray]) {
        value.status = YES;
        value.detail = @"";
        return value;
    }
    
    value = [self findSwappedElements:sourceArray and:sortedArray];
    
    if (value.status == YES) {
        return value;
    }
    
    value = [self findReversedElements:sourceArray and:sortedArray];
    
    return value;
}

-(ResultObject *)findSwappedElements:(NSArray *)source and:(NSArray *)sorted {
    NSMutableArray *result = [NSMutableArray new];
    ResultObject *value = [ResultObject new];
    
    for(NSUInteger i = 0; i < [source count]; i++) {
        if ([source[i] isEqual:sorted[i]]){
            continue;
        }

        [result addObject:@(i + 1)];
    }
    
    if ([result count] == 2) {
        NSNumber *index1 = result[0];
        NSNumber *index2 = result[1];
        value.status = YES;
        value.detail = [[NSString alloc] initWithFormat:@"swap %@ %@", index1, index2];
    }

    return value;
}

-(ResultObject *)findReversedElements:(NSArray *)source and:(NSArray *)sorted {
    ResultObject *value = [ResultObject new];
    NSUInteger count = [source count];
    NSUInteger startIndex = 0;
    NSUInteger endIndex = count - 1;
    BOOL startIndexFound = NO;
    BOOL endIndexFound = NO;

    for(NSUInteger i = 0; i < count; i++) {
        if (!startIndexFound) {
            startIndex = i;
            
            if (![source[startIndex] isEqual:sorted[startIndex]] && !startIndexFound){
                startIndexFound = YES;
            }
        }
        
        if (!endIndexFound) {
            endIndex = count - 1 - i;
            
            if (![source[endIndex] isEqual:sorted[endIndex]] && !endIndexFound){
                endIndexFound = YES;
            }
        }
    }
    
    NSArray *sourceSubArray = [source subarrayWithRange:NSMakeRange(startIndex, endIndex - startIndex + 1)];
    NSArray *sortedSubArray = [sorted subarrayWithRange:NSMakeRange(startIndex, endIndex - startIndex + 1)];
    NSArray *reversedSourceSubArray = [[sourceSubArray reverseObjectEnumerator] allObjects];
    
    if ([reversedSourceSubArray isEqualToArray:sortedSubArray]) {
        value.status = YES;
        value.detail = [[NSString alloc] initWithFormat:@"reverse %ld %ld", startIndex + 1, endIndex + 1];
    }
    
    return value;
}

@end
