//
//  NSNumber+EnglishOrdinalString.h

#import <Foundation/Foundation.h>

@interface NSNumber (EnglishOrdinalString)
/**
 * Returns the number as a string followed by 'st','nd',or 'th', as appropriate
 * @return NSString Number as a standard English ordinal string
 */
-(NSString*)englishOrdinalString;
@end
