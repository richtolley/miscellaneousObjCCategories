//
//  NSDictionary+URLStrings.m

#import "NSDictionary+URLStrings.h"

@implementation NSDictionary (URLStrings)
-(NSArray*)allURLStrings
{
    NSMutableArray *rVal = [[NSMutableArray alloc]init];
    
    
    for(NSString *k in self.allKeys)
    {
        id obj = self[k];
        
        if([obj isKindOfClass:[NSString class]])
        {
            NSString *stringVal = (NSString*)obj;
            NSError *error;
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"http.*" options:NSRegularExpressionCaseInsensitive error:&error];
            
            NSRange rangeOfFirstMatch = [regex rangeOfFirstMatchInString:stringVal options:NSMatchingAnchored range:NSMakeRange(0, stringVal.length)];
            
            if(rangeOfFirstMatch.location != NSNotFound)
            {
                NSString *resultString = [stringVal substringWithRange:rangeOfFirstMatch];
                [rVal addObject:resultString];
            }
            
        }
        else if([obj isKindOfClass:[NSDictionary class]])
        {
            NSDictionary *nested = (NSDictionary*)obj;
            [rVal addObjectsFromArray:[nested allURLStrings]];
        }
        
    }
    
    return rVal;
}

-(NSArray*)uniqueURLStrings
{
    NSMutableDictionary *itemCountDict = [[NSMutableDictionary alloc]init];
    NSMutableArray *rVal = [[NSMutableArray alloc]init];
    
    NSArray *urlStrings = [self allURLStrings];
    for(NSString *url in urlStrings)
    {
        if(!itemCountDict[url])
        {
            [rVal addObject:url];
        }
        itemCountDict[url] = @TRUE;
    }
    return rVal;
}
@end
