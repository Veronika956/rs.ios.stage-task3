#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableArray *mutString1 = [[NSMutableArray alloc] init];
    NSMutableArray *mutString2 = [[NSMutableArray alloc] init];
    [string1 enumerateSubstringsInRange:[string1 rangeOfString:string1]
                                options:NSStringEnumerationByComposedCharacterSequences
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [mutString1 addObject:substring] ;
    }] ;
    [string2 enumerateSubstringsInRange:[string2 rangeOfString:string2]
                                options:NSStringEnumerationByComposedCharacterSequences
                             usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [mutString2 addObject:substring] ;
    }] ;
    NSMutableString *result =[NSMutableString new];
    
    
    while ((mutString1.count > 0) && (mutString2.count > 0)){
        
        if (([mutString1[0] compare:mutString2[0]] == NSOrderedAscending) || ([mutString1[0] compare:mutString2[0]] == NSOrderedSame)){
            [result appendString:mutString1[0]];
            [mutString1 removeObjectAtIndex:0];
        }else {
            [result appendString:mutString2[0]];
            [mutString2 removeObjectAtIndex:0];
        }
    }
    
    if (mutString1.count == 0){
        for (id object in mutString2){[result appendString: object];}
        
    }else{
        for (id object in mutString1){[result appendString: object];}
        
        
    }
    NSLog (@"result contains  %@", result);
    
    
    return result;
}
@end
