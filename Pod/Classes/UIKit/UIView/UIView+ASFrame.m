//
//  UIView+ASFrame.m
//  AppScaffold Cocoa Category
//
//  Created by Square on 03/02/16.
//  Copyright (c) 2016-2017 AppScaffold
//

#import "UIView+ASFrame.h"

@implementation UIView (ASFrame)


///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_left {
    return self.frame.origin.x;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame     = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_top {
    return self.frame.origin.y;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame     = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_right {
    return self.frame.origin.x + self.frame.size.width;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame     = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame     = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_centerX {
    return self.center.x;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_centerY {
    return self.center.y;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_width {
    return self.frame.size.width;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame       = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_height {
    return self.frame.size.height;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame        = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_ScreenX {
    return [self as_frameToView:nil].origin.x;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_ScreenY {
    return [self as_frameToView:nil].origin.y;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_screenViewX {
    CGFloat x = 0.0f;
    for (UIView *view = self; view; view = view.superview) {
        x += view.as_left;

        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            x -= scrollView.contentOffset.x;
        }
    }

    return x;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGFloat)as_screenViewY {
    CGFloat y = 0;
    for (UIView *view = self; view; view = view.superview) {
        y += view.as_top;

        if ([view isKindOfClass:[UIScrollView class]]) {
            UIScrollView *scrollView = (UIScrollView *)view;
            y -= scrollView.contentOffset.y;
        }
    }
    return y;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)as_screenFrame {
    return CGRectMake(self.as_screenViewX, self.as_screenViewY, self.as_width, self.as_height);
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)as_origin {
    return self.frame.origin;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame   = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGSize)as_size {
    return self.frame.size;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGPoint)as_offsetFromView:(UIView *)otherView {
    CGFloat x = 0.0f, y = 0.0f;
    for (UIView *view = self; view && view != otherView; view = view.superview) {
        x += view.as_left;
        y += view.as_top;
    }
    return CGPointMake(x, y);
}

#pragma mark - frame convert
///////////////////////////////////////////////////////////////////////////////////////////////////
- (CGRect)as_frameToView:(UIView *)view {
    return [self.superview convertRect:self.frame toView:view];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
- (void)as_setFrame:(CGRect)frame fromView:(UIView *)view {
    self.frame = [view convertRect:frame toView:self.superview];
}

@end
