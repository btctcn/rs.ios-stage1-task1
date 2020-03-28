#import <XCTest/XCTest.h>
#import "PalindromeSolver.h"

@interface HighestPalindromeTests : XCTestCase
@end

@implementation HighestPalindromeTests

- (void)testHighestValuePalindrome1 {
    XCTAssertEqualObjects([[[PalindromeSolver alloc] init] highestValuePalindrome:@"2842" n:@4 k:@1], @"2882");
}

- (void)testHighestValuePalindrome2 {
    XCTAssertEqualObjects([[[PalindromeSolver alloc] init] highestValuePalindrome:@"092282" n:@6 k:@3], @"992299");
}

- (void)testHighestValuePalindrome4 {
    XCTAssertEqualObjects([[[PalindromeSolver alloc] init] highestValuePalindrome:@"123456" n:@6 k:@3], @"654456");
}



- (void)testHighestValuePalindrome3_NoLuckToFindPalindrome {
    XCTAssertEqualObjects([[[PalindromeSolver alloc] init] highestValuePalindrome:@"58346739679" n:@11 k:@2], @"-1");
}
@end
