//
//  UIView+Frame.m
//  HSYMethodsToolsKit
//
//  Created by anmin on 2019/9/27.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - Init

- (instancetype)initWithSize:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero, size};
    return [self initWithFrame:rect];
}

- (instancetype)initWithWidth:(CGFloat)width
{
    CGRect rect = (CGRect){CGPointZero, width, 0.0f};
    return [self initWithFrame:rect];
}

- (instancetype)initWithHeight:(CGFloat)height
{
    CGRect rect = (CGRect){CGPointZero, 0.0f, height};
    return [self initWithFrame:rect];
}

#pragma mark - Get Property

- (CGPoint)hsy_origin
{
    return self.frame.origin;
}

- (CGFloat)hsy_x
{
    return self.hsy_origin.x;
}

- (CGFloat)hsy_y
{
    return self.hsy_origin.y;
}

- (CGFloat)hsy_right
{
    return self.hsy_x + self.hsy_width;
}

- (CGFloat)hsy_bottom
{
    return self.hsy_y + self.hsy_height;
}

- (CGSize)hsy_size
{
    return self.frame.size;
}

- (CGFloat)hsy_height
{
    return self.hsy_size.height;
}

- (CGFloat)hsy_width
{
    return self.hsy_size.width;
}

- (CGFloat)hsy_mid_x
{
    return (self.hsy_x + (self.hsy_width / 2));
}

- (CGFloat)hsy_mid_y
{
    return (self.hsy_y + (self.hsy_height / 2));
}

- (CGSize)hsy_ceilSize
{
    return CGSizeMake(self.hsy_ceilWidth, self.hsy_ceilHeight);
}

- (CGFloat)hsy_ceilWidth
{
    return ceil(self.hsy_width);
}

- (CGFloat)hsy_ceilHeight
{
    return ceil(self.hsy_height);
}

#pragma mark - Set Origin

- (void)hsy_setOrigin:(CGPoint)origin
{
    self.frame = (CGRect){origin, self.hsy_size};
}

- (void)hsy_setX:(CGFloat)x
{
    [self hsy_setOrigin:CGPointMake(x, self.hsy_y)];
}

- (void)hsy_setY:(CGFloat)y
{
    [self hsy_setOrigin:CGPointMake(self.hsy_x, y)];
}

#pragma mark - Set Size

- (void)hsy_setSize:(CGSize)size
{
    self.frame = (CGRect){self.hsy_origin, size};
}

- (void)hsy_setWidth:(CGFloat)width
{
    [self hsy_setSize:CGSizeMake(width, self.hsy_height)];
}

- (void)hsy_setHeight:(CGFloat)height
{
    [self hsy_setSize:CGSizeMake(self.hsy_width, height)];
}

@end
