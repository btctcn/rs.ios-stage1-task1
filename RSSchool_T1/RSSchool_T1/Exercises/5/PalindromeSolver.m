#import <Foundation/Foundation.h>
#import "PalindromeSolver.h"

@implementation PalindromeSolver


// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    NSString *const TheInvalidPalindrome = @"-1";
    NSNumber *const MinNumber = @0;
    NSNumber *const MaxNumber = @10000;
    
    if(!s || s.length == 0) return TheInvalidPalindrome;
    int nInt = n.intValue;
    int kInt = k.intValue;
    int minNumberInt = MinNumber.intValue;
    int maxNumberInt = MaxNumber.intValue;
    if(nInt < minNumberInt || nInt > maxNumberInt || kInt < minNumberInt || kInt > maxNumberInt) return TheInvalidPalindrome;
    
    NSUInteger len = s.length;
    NSMutableString *left;
    NSMutableString *right;
    NSString *middle;
    bool odd = len % 2 != 0;
    left = [NSMutableString stringWithString: [s substringWithRange:NSMakeRange(0, len/2)]];
    right = [NSMutableString stringWithString: [s substringWithRange:NSMakeRange(len/2 + odd, len - (len/2 + odd))]];
    middle = (odd) ? [s substringWithRange:NSMakeRange(len/2,  1)] : @"";
    
    int diffCount = 0;
    
    for(NSInteger i = 0, j = right.length - 1;  i < left.length && j >= 0 && kInt > 0; i++, j--)
    {
        NSString *leftChar = [left substringWithRange:NSMakeRange(i, 1)];
        NSString *rightChar = [right substringWithRange:NSMakeRange(j, 1)];
        
        if(![leftChar isEqualToString:rightChar])
        {
            diffCount++;

            int leftInt = [leftChar intValue];
            int rightInt = [rightChar intValue];
            if(leftInt != 9 && rightInt != 9 && kInt >= 2)
            {
                [right replaceCharactersInRange:NSMakeRange(j, 1) withString:@"9"];
                [left replaceCharactersInRange:NSMakeRange(i, 1) withString:@"9"];
                kInt-=2;
            }
            else
            {
                if(leftInt > rightInt)
                {
                    [right replaceCharactersInRange:NSMakeRange(j, 1) withString:leftChar];
                }
                else
                {
                    [left replaceCharactersInRange:NSMakeRange(i, 1) withString:rightChar];
                }
                kInt--;
            }
        }
    }
    
    for(NSInteger i = 0, j = right.length - 1;  i < left.length && j >= 0; i++, j--)
    {
        if([left characterAtIndex:i] != [right characterAtIndex:j])
            return TheInvalidPalindrome;
    }
        
    [left appendString:middle];
    [left appendString:right];
    
    return left;
}
@end
