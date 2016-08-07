//
//  UIView+ASBlurredImage.m
//

#import "UIView+ASBlurredImage.h"
#import "UIImage+ASImageEffects.h"
#import "CGAffineTransform+UIInterfaceOrientation.h"

@implementation UIView (ASBlurredImage)

- (UIImage *)as_snapshotImage {
  UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, self.window.screen.scale);
  [self drawViewHierarchyInRect:self.frame afterScreenUpdates:NO];
  UIImage *snapshotImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  if([self isKindOfClass:[UIWindow class]]) {
    snapshotImage = [snapshotImage as_rotateByDegrees:degreesForUIInterfaceOrientation([[UIApplication sharedApplication] statusBarOrientation])];
  }
  return snapshotImage;
}

-(UIImage *)as_blurredImage {
  return [[self as_snapshotImage] as_applyBlurWithRadius:5 tintColor:nil saturationDeltaFactor:0 maskImage:nil];
}

-(UIImage *)as_imageWithBlur {
  return [[self as_snapshotImage] as_applyBlurWithRadius:5 tintColor:nil saturationDeltaFactor:0 maskImage:nil];
}

-(UIImage *)imageWithDarkEffect {
  return [[self as_snapshotImage] as_applyDarkEffect];
}

-(UIImage *)imageWithLightEffect {
  return [[self as_snapshotImage] as_applyLightEffect];
}

-(UIImage *)imageWithExtraLightEffect {
  return [[self as_snapshotImage] as_applyExtraLightEffect];
}

-(UIImage *)imageWithTint:(UIColor*)color {
  return [[self as_snapshotImage] as_applyTintEffectWithColor:color];
}

@end
