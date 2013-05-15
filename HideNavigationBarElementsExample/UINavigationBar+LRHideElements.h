//
//  UINavigationBar+LRHideElements.h
//  HideNavigationBarElementsExample
//
//  Created by Larry Ryan on 5/14/13.
//  Copyright (c) 2013 Thinkr LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, NavigationBarOption)
{
    NavigationBarOptionHideBackground = (1 << 0),
    NavigationBarOptionHideTitle = (1 << 1),
    NavigationBarOptionHideLeftItems = (1 << 2),
    NavigationBarOptionHideRightItems = (1 << 3)
};

@interface UINavigationBar (LRHideElements)

- (UIView *)navigationBarBackgroundView;
- (UIView *)navigationBarTitleView;
- (UIView *)navigationBarLeftBarButtonView;
- (UIView *)navigationBarRightButtonView;

- (void)hideNavigationBarSubviews:(BOOL)hide withOptions:(NavigationBarOption)navOptions animated:(BOOL)animated;

@end
