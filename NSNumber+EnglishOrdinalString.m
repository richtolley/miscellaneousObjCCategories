//
//  NSNumber+EnglishOrdinalString.m

#import "NSNumber+EnglishOrdinalString.h"

@implementation NSNumber (EnglishOrdinalString)
-(NSString*)englishOrdinalString
{
    
    NSMutableString *rVal = [[self stringValue]mutableCopy];
    int intValue = [self intValue];
    bool first = (intValue-1) % 10 == 0;
    bool second = (intValue-2) % 10 == 0;
    bool third = (intValue-3) % 10 == 0;
    if (first) {
        if (intValue % 10 == 1 && intValue % 100 != 11) {
            [rVal appendString:@"st"];
        }
        else [rVal appendString:@"th"];
    }
    else if (second) {
        if (intValue % 10 == 2 && intValue % 100 != 12) {
            [rVal appendString:@"nd"];
        }
        else [rVal appendString:@"th"];
    }
    else if (third) {
        if (intValue % 10 == 3 && intValue % 100 != 13) {
            [rVal appendString:@"rd"];
        }
        else [rVal appendString:@"th"];
    }
    else [rVal appendString:@"th"];
    return rVal;
}
@end
