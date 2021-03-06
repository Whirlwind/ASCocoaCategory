//
//  UIImage+ASResizable.h
//  AppScaffold Cocoa Category
//
//  Created by Whirlwind on 13-11-14.
//  Copyright 2013年 AppScaffold. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage (ASResizable)

/// Get a resizableImage based on center 1px.
- (UIImage *)as_resizableImage;

- (UIImage *)croppedImage:(CGRect)bounds;

- (UIImage *)resizedImage:(CGSize)newSize
              contentMode:(UIViewContentMode)contentMode;
- (UIImage *)resizedImage:(CGSize)newSize
              contentMode:(UIViewContentMode)contentMode
     interpolationQuality:(CGInterpolationQuality)quality;
- (UIImage *)resizedImage:(CGSize)newSize
                transform:(CGAffineTransform)transform
           drawTransposed:(BOOL)transpose
     interpolationQuality:(CGInterpolationQuality)quality;

@end
