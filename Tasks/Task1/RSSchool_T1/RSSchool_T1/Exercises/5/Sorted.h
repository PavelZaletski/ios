#import <Foundation/Foundation.h>

@interface ResultObject : NSObject
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) BOOL status;
@end

@interface Sorted : NSObject
- (ResultObject*)sorted:(NSString*)string;
-(ResultObject *)findSwappedElements:(NSArray *)source and:(NSArray *)sorted;
-(ResultObject *)findReversedElements:(NSArray *)source and:(NSArray *)sorted;
@end
