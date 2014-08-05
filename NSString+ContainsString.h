//
//  NSString+ContainsString.h

#import <Foundation/Foundation.h>

@interface NSString (ContainsString)
/**
 * Determines whether the receiver contains the argument as a substring
 */
-(bool)containsString:(NSString*)testString;
@end
