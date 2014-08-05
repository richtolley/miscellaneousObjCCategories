//
//  NSDictionary+URLStrings.h
//

#import <Foundation/Foundation.h>

/**
 * Category used to find URL strings in an NSDictionary
 */
@interface NSDictionary (URLStrings)

/**
 * Find all URL strings stored in this dictionary and its children (recursive)
 */
-(NSArray*)allURLStrings;

/**
 * Find unique URL strings stored in this dictionary and its children (recursvie)
 */
-(NSArray*)uniqueURLStrings;
@end