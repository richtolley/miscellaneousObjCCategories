//
//  UIColor+ColorWithRGBString.m

#import "UIColor+ColorWithRGBString.h"

@implementation UIColor (ColorWithRGBString)
+(UIColor*)colorWithRGBString:(NSString*)rgbString
{
    if(rgbString == nil || rgbString.length == 0)
    {
        return [UIColor clearColor];
    }

    UIColor *rVal = nil;
    NSArray *numbers = [rgbString componentsSeparatedByString:@","];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier: @"en_US"];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setLocale:locale];
    
    bool numbersValid = YES;
    
    for(NSString *numberString in numbers)
    {
        NSNumber* num = nil;
        num = [numberFormatter numberFromString:numberString];
        
        if(num == nil)
        {
            numbersValid = NO;
            break;
        }
        
    }
    
    if(!numbersValid)
    {
        rVal = [UIColor clearColor];
    }
    else
    {
        NSMutableDictionary *colorDict = [[NSMutableDictionary alloc]init];

        NSArray *colorNames = @[@"red",@"green",@"blue"];
        
        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc]init];
        numberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        
        for(NSUInteger i = 0;i<numbers.count;i++)
        {
            NSString *numberString = numbers[i];
            NSNumber *n = [numberFormatter numberFromString:numberString];
            
            NSString* key = colorNames[i];
            colorDict[key] = n;
            
        }
        
        double r = [colorDict[@"red"]doubleValue]/255.0f;
        double g = [colorDict[@"green"]doubleValue]/255.0f;
        double b = [colorDict[@"blue"]doubleValue]/255.0f;
        
        //NSLog(@"creating color with rgb values r : %f g : %f b : %f",r,g,b);
        
        
        rVal = [UIColor colorWithRed:r
                               green:g
                                blue:b
                               alpha:1.0];
    }
    return rVal;
}


@end
