//
//  NSDictionary+FindSubDictionaries.m

#import "NSDictionary+FindSubDictionaries.h"

@implementation NSDictionary (FindSubDictionaries)

-(NSArray*)findSubDictionariesWithKey:(NSString*)key
{
    NSMutableArray *rVal = [[NSMutableArray alloc]init];
    
    for(id k in self.allKeys)
    {
        if([k isKindOfClass:[NSString class]])
        {
            NSString *testKey = (NSString*)k;
            
            if([testKey isEqualToString:key])
            {
                NSDictionary *dictCandidate = self[testKey];
                if ([dictCandidate isKindOfClass:[NSDictionary class]]) {
                    [rVal addObject:dictCandidate];
                    NSArray *subDicts = [dictCandidate findSubDictionariesWithKey:key];
                    [rVal addObjectsFromArray:subDicts];
                }
            }
            else if([testKey isEqualToString:@"subitems"])
            {
                NSArray *arrayCandidate = self[testKey];
                if([arrayCandidate isKindOfClass:[NSArray class]])
                {
                    for(id obj in arrayCandidate)
                    {
                        if([obj isKindOfClass:[NSDictionary class]])
                        {
                            NSDictionary *innerDict = (NSDictionary*)obj;
                            [rVal addObjectsFromArray:[innerDict findSubDictionariesWithKey:key]];
                        }
                    }
                }
            }
        }
        
    }
    return rVal;
}

@end