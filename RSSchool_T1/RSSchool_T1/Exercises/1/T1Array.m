#import <Foundation/Foundation.h>
#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if(!sadArray)
        return @[];
    
    if(sadArray.count < 3)
        return sadArray;
    
    NSMutableArray *mutableSadArray = [NSMutableArray arrayWithArray:sadArray];
    NSMutableArray *indiciesToRemove = [NSMutableArray new];
    NSUInteger currentArrayLen = sadArray.count;
    NSUInteger reducedArrayLen = 0;
    while(reducedArrayLen != currentArrayLen)
    {
        currentArrayLen = mutableSadArray.count;
        for(int i = 1; i < currentArrayLen - 1; i++)
        {
            NSNumber *prev = mutableSadArray[i-1];
            NSNumber *curr = mutableSadArray[i];
            NSNumber *next = mutableSadArray[i+1];
            if((prev.intValue + next.intValue) < curr.intValue)
            {
                [indiciesToRemove addObject:[NSNumber numberWithInt:i]];
            }
        }
        
        for(NSInteger i = indiciesToRemove.count - 1; i >=0; i--)
        {
            [mutableSadArray removeObjectAtIndex:(((NSNumber *)indiciesToRemove[i]).intValue)];
        }
        
        [indiciesToRemove removeAllObjects];
        
        reducedArrayLen = mutableSadArray.count;
    }
    
    return mutableSadArray;
}

@end
