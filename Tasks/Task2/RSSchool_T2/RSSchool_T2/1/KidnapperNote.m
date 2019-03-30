#import "KidnapperNote.h"

@implementation KidnapperNote
- (BOOL)checkMagazine:(NSString *)magazine note:(NSString *)note {
    magazine = [magazine lowercaseString];
    note = [note lowercaseString];
    
    NSArray *arr = [note componentsSeparatedByString: @" "];
    NSMutableArray *arr2 = [[magazine componentsSeparatedByString: @" "] mutableCopy];
    NSUInteger count = 0;
    
    for(NSUInteger i = 0; i < [arr2 count]; i++) {
        for(NSString *key in arr) {
            if ([key isEqualToString:arr2[i]] == YES) {
                [arr2 replaceObjectAtIndex:i withObject:@""];
                count++;
                break;
            }
        }
        
        if([arr count] == count) {
            return YES;
        }
    }
    
    return NO;
}
@end
