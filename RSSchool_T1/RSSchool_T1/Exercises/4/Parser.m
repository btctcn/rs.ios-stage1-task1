#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSArray *openBrackets = @[@"<", @"[", @"("];
    NSArray *closeBrackets = @[@">", @"]", @")"];
    NSMutableArray *returnArray = [NSMutableArray new];
    NSMutableDictionary *bracketsPairs = [NSMutableDictionary new];
    
    for (int i = 0; i < openBrackets.count; i++)
    {
        NSString *currentOpenBracket = openBrackets[i];
        NSString *currentCloseBracket = closeBrackets[i];
        NSMutableArray *openBracketPositions = [NSMutableArray new];
        NSMutableArray *closeBracketPositions = [NSMutableArray new];

        NSRange range = NSMakeRange(0, string.length);
        while (1)
        {
            int rangeLocation = range.location > 0 ? range.location + 1 : 0;
            int rangeLen = string.length - rangeLocation;
            range = [string rangeOfString:currentOpenBracket
                                  options:NSCaseInsensitiveSearch
                                    range:NSMakeRange(rangeLocation, rangeLen)];
    
            if(range.location == NSNotFound)
                break;
            [openBracketPositions addObject:[NSNumber numberWithLong:range.location]];
        }
        
        range = NSMakeRange(0, string.length);
        while (1)
        {
            int rangeLocation = range.location > 0 ? range.location + 1 : 0;
            int rangeLen = string.length - rangeLocation;
            range = [string rangeOfString:currentCloseBracket
                                  options:NSCaseInsensitiveSearch
                                    range:NSMakeRange(rangeLocation, rangeLen)];
            
            if(range.location == NSNotFound)
                break;
            [closeBracketPositions addObject:[NSNumber numberWithLong:range.location]];
        }
        
        while (openBracketPositions.lastObject)
        {
            int currentOpenPos = ((NSNumber*)openBracketPositions.lastObject).intValue;
            for(NSNumber *closePos in closeBracketPositions)
            {
                if(closePos.intValue < currentOpenPos) continue;
                bracketsPairs[openBracketPositions.lastObject] = closePos;
                [closeBracketPositions removeObject:closePos];
                break;
            }
            [openBracketPositions removeLastObject];
        }
        
        [closeBracketPositions removeAllObjects];
    }
    
    NSLog(@"brackets: %@", bracketsPairs);
    for(NSNumber *key in [[bracketsPairs allKeys] sortedArrayUsingSelector: @selector(compare:)])
    {
        NSString *subStr = [string substringWithRange:NSMakeRange(key.intValue + 1 , ((NSNumber *)bracketsPairs[key]).intValue - key.intValue - 1)];
        [returnArray addObject:subStr];
        NSLog(@"%@", subStr);
    }
    
    return returnArray;
}

@end
