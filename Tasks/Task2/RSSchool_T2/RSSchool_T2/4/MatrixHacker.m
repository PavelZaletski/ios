#import "MatrixHacker.h"

@interface CharacterClass : NSObject <Character>
@property (nonatomic, strong) NSString *name;
@property (nonatomic) BOOL clone;
- (NSString *)name;
- (BOOL)isClone;
+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone;
@end

@implementation CharacterClass
+ (instancetype)createWithName:(NSString *)name isClone:(BOOL)clone {
    CharacterClass *character = [[CharacterClass alloc] init];
    character.name = name;
    character.clone = clone;
    return character;
}

- (NSString *)name {
    return self.name;
}

- (BOOL)isClone {
    return self.isClone;
}
@end

typedef id<Character> (^myBlock)(NSString *name);

@interface MatrixHacker()
@property (nonatomic) myBlock theBlock;
@end

@implementation MatrixHacker
- (void)injectCode:(id<Character> (^)(NSString *name))theBlock {
    self.theBlock = theBlock;
}

- (NSArray<id<Character>> *)runCodeWithData:(NSArray<NSString *> *)names {
    NSMutableArray <id<Character>> *arr = [NSMutableArray new];
    
    for (NSString *str in names) {
        CharacterClass *character;
        if ([str isEqualToString:@"Neo"]) {
            character = [CharacterClass createWithName:str isClone:NO];
        } else {
            character = [CharacterClass createWithName:@"Agent Smith" isClone:NO];
        }
        [arr addObject:character];
        self.theBlock(str);
    }
    
    return arr;
}
@end
