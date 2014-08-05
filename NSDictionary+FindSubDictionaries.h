//
//  NSDictionary+FindSubDictionaries.h

#import <Foundation/Foundation.h>

@interface NSDictionary (FindSubDictionaries)
/**
 * Recursively find all entries with the specified key in this dictionary and all its children
 */
-(NSArray*)findSubDictionariesWithKey:(NSString*)key;
@end