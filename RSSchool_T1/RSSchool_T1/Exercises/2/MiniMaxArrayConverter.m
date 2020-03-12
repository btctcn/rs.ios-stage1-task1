#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    if(!array)
        return @[@0];
    
    NSNumber *sum = [array valueForKeyPath: @"@sum.self"];
    int sumInt = sum.intValue;
    int min = sumInt;
    int max = 0;
    
    for(NSNumber *currentNum in array)
    {
        int currentSum = sumInt - currentNum.intValue;
        if(currentSum < min)
            min = currentSum;
        if(currentSum > max)
            max = currentSum;
    }
    
    return @[[NSNumber numberWithInt:min], [NSNumber numberWithInt:max]];
}

@end
