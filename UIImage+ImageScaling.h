//
//  UIImage+ImageScaling.h

#import <UIKit/UIKit.h>

@interface UIImage (ImageScaling)
/**
 * Scales the image to the specified width, preserving aspect ratio
 * @param newWidth. The width the image will be, after scaling, in pixels
 */
-(UIImage*)scaledCopyOfImageForWidth:(CGFloat)newWidth;

/**
* Scales the image to the specified size
* @param newSize. The size the image will be, after scaling
*/
-(UIImage*)scaledCopyOfImage:(CGSize)newSize;
@end

