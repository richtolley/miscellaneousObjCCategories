//
//  NSString+ContainsString.m

#import "NSString+ContainsString.h"

@implementation NSString (ContainsString)

-(bool)containsString:(NSString*)testString
{
    NSError *error;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:testString options:0 error:&error];
    if(error)
        return NO;
    return [regex numberOfMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)] > 0;
    
}
@end
