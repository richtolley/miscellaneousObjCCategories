//
//  NSMutableDictionary+Overwriter.m

#import "NSMutableDictionary+Overwriter.h"

@implementation NSMutableDictionary (Overwriter)

-(void)overwriteWithDictionary:(NSDictionary*)dict
{
    for(NSString *key in dict.allKeys)
    {
        id selfObject = self[key];
        id overwriterObject = dict[key];
        
        if([selfObject isKindOfClass:[NSNull class]] && ![overwriterObject isKindOfClass:[NSNull class]])
        {
            
        }
        
        bool selfObjectIsNullOrZeroLengthString = !selfObject || [selfObject isKindOfClass:[NSNull class]] || ([selfObject isKindOfClass:[NSString class]] && [(NSString*)selfObject length]);
        bool overWriterObjectIsNotNull = overwriterObject && ![overwriterObject isKindOfClass:[NSNull class]];
        
        if (selfObjectIsNullOrZeroLengthString && overWriterObjectIsNotNull) {
            
            if([overwriterObject isKindOfClass:[NSNumber class]]
               )
            {
                double n = [(NSNumber*) overwriterObject doubleValue];
                self[key] = @(n);
            }
            else self[key] = [overwriterObject mutableCopy];
            
        }
        else if([selfObject isKindOfClass:[NSDictionary class]] && [overwriterObject isKindOfClass:[NSDictionary class]])
        {
            NSMutableDictionary *selfDict = (NSMutableDictionary*)[selfObject mutableCopy];
            NSMutableDictionary *overwriterDict = (NSMutableDictionary*)[overwriterObject mutableCopy];
            [selfDict overwriteWithDictionary:overwriterDict];
            self[key] = selfDict;
        }
    }
}

@end
