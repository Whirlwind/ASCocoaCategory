//
//  PHAsset+ASImage.h
//  Pods
//
//  Created by Whirlwind on 2016/11/5.
//
//

#import <Photos/Photos.h>

@interface PHAsset (ASImage)

- (UIImage *)as_requestImage:(NSDictionary **)info;

- (void)as_requestImageWithResultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

- (void)as_requestImageWithOptions:(PHImageRequestOptions *)requestOptions
                     resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

#pragma mark - thumb
- (UIImage *)as_requestThumbImageWithSize:(CGSize)size info:(NSDictionary **)info;
- (void)as_requestThumbImageWithSize:(CGSize)size
                       resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;
- (void)as_requestThumbImageWithOptions:(PHImageRequestOptions *)requestOptions
                                   size:(CGSize)size
                          resultHandler:(void (^)(UIImage *result, NSDictionary *info))resultHandler;

@end
