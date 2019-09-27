//
//  UIApplication+AppDelegates.m
//  HSYMethodsToolsKit
//
//  Created by anmin on 2019/9/27.
//

#import "UIApplication+AppDelegates.h"

@implementation UIApplication (AppDelegates)

+ (UIWindow *)hsy_keyWindows
{
    return [[UIApplication sharedApplication] keyWindow];
}

+ (CGSize)hsy_iPhoneStatusBarSize
{
    return [[UIApplication sharedApplication] statusBarFrame].size;
}

+ (CGFloat)hsy_statusBarHeight
{
    CGFloat height = [UIApplication hsy_iPhoneStatusBarSize].height;
//    if (height == 0.0f) {
//        height = (IPHONE_HEIGHT == ((CGFloat)kHSYCocoaKitLaunchScreenSize_5_8_Inch) ? 44.0f : 20.0f);
//    }
    return height;
}

+ (id<UIApplicationDelegate>)hsy_appDelegate
{
    return [UIApplication sharedApplication].delegate;
}

+ (CGRect)hsy_iPhoneScreenBounds
{
    return [UIScreen mainScreen].bounds;
}


@end
