//
//  NSString+ContainsString.m

#import "NSString+ContainsString.h"

@implementation NSString (ContainsString)

-(bool)containsString:(NSString*)testString
{
	rVal = NO;

	if(testString && testString.length > 0 && self.length > 0)
	{
		NSError *error;
	    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:testString options:0 error:&error];
	    if(!error)
	    {
	    	rval = [regex numberOfMatchesInString:self options:NSMatchingReportCompletion range:NSMakeRange(0, self.length)] > 0;
	    }
	}

	return rVal;  
}
@end
