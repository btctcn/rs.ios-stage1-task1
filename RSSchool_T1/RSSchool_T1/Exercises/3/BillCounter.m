#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray<NSNumber*> *mutableBill = [NSMutableArray<NSNumber*> arrayWithArray:bill];
    if(index >= 0 && index < mutableBill.count)
    {
        [mutableBill removeObjectAtIndex:index];
    }
    
    NSNumber *actualSumAnna = [mutableBill valueForKeyPath: @"@sum.self"];
    
    NSInteger sumAnnaInt = sum.integerValue;
    NSInteger actualSumAnnaInt = actualSumAnna.integerValue / 2;
    
    if(actualSumAnnaInt == sumAnnaInt)
    {
        return @"Bon Appetit";
    }
    else
    {
        return [NSNumber numberWithLong:(sumAnnaInt - actualSumAnnaInt)].stringValue;
    }
}

@end
