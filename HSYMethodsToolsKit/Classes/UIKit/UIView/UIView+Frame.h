//
//  UIView+Frame.h
//  HSYMethodsToolsKit
//
//  Created by anmin on 2019/9/27.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

- (CGPoint)hsy_origin;                                      //[x, y]坐标
- (CGFloat)hsy_x;                                           //x坐标
- (CGFloat)hsy_y;                                           //y坐标
- (CGFloat)hsy_right;                                       //x + w
- (CGFloat)hsy_bottom;                                      //y + h
- (CGFloat)hsy_mid_x;                                       //x + w/2
- (CGFloat)hsy_mid_y;                                       //y + h/2

- (CGSize)hsy_size;                                         //视图size
- (CGFloat)hsy_height;                                      //高度
- (CGFloat)hsy_width;                                       //宽度
- (CGSize)hsy_ceilSize;                                     //向下取整的视图size

- (void)hsy_setSize:(CGSize)size;                           //设置size
- (void)hsy_setWidth:(CGFloat)width;                        //设置宽度
- (void)hsy_setHeight:(CGFloat)height;                      //设置高度

- (void)hsy_setOrigin:(CGPoint)origin;                      //设置[x, y]坐标
- (void)hsy_setX:(CGFloat)x;                                //设置x坐标
- (void)hsy_setY:(CGFloat)y;                                //设置y坐标

/**
 origin为CGPointZero的初始化
 
 @param size size
 @return self
 */
- (instancetype)initWithSize:(CGSize)size;

/**
 origin为CGPointZero，height为0.0f的初始化
 
 @param width 宽度
 @return self
 */
- (instancetype)initWithWidth:(CGFloat)width;

/**
 origin为CGPointZero，width为0.0f的初始化
 
 @param height 高度
 @return self
 */
- (instancetype)initWithHeight:(CGFloat)height;


@end

NS_ASSUME_NONNULL_END
