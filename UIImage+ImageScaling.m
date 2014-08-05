//
//  UIImage+ImageScaling.m

#import "UIImage+ImageScaling.h"

@implementation UIImage (ImageScaling)

-(UIImage*)scaledCopyOfImage:(CGSize)newSize
{
    UIGraphicsBeginImageContext(newSize);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *rVal = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return rVal;
}

-(UIImage*)scaledCopyOfImageForWidth:(CGFloat)newWidth
{
    CGFloat newHeight = newWidth * self.size.width/self.size.height;
    return [self scaledCopyOfImage:CGSizeMake(newWidth, newHeight)];
}

@end
