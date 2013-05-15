//
//  UINavigationBar+LRHideElements.m
//  HideNavigationBarElementsExample
//
//  Created by Larry Ryan on 5/14/13.
//  Copyright (c) 2013 Thinkr LLC. All rights reserved.
//

/*

 UINavigationBar by default contains 2 subviews. Whether you add 1 right bar button or 1 left bar button to the navigation bar, its view index will be 2. If you add both the left and right bar buttons, the left will be index 2 and the right will be index 3;
 
 
 NavigationBarSubview Array:
 
 NavigationBarOptionHideBackground = Index 0
 NavigationBarOptionHideTitle = Index 1
 NavigationBarOptionHideLeftItems = Index 2
 NavigationBarOptionHideRightItems = Index 2 or 3
 
*/

#import "UINavigationBar+LRHideElements.h"
#import <QuartzCore/QuartzCore.h>

#define kAnimationDuration 0.3

@implementation UINavigationBar (LRHideElements)

#pragma mark - Methods (Public)

- (UIView *)navigationBarBackgroundView
{
    return (UIView *)self.subviews[0];
}

- (UIView *)navigationBarTitleView
{
    return (UIView *)self.subviews[1];
}

- (UIView *)navigationBarLeftBarButtonView
{
    // If both left and right items
    if (self.subviews.count == 4)
        return (UIView *)self.subviews[2];
    
    // If just left items
    return (UIView *)self.subviews[2];
}

- (UIView *)navigationBarRightButtonView
{
    // If both left and right items
    if (self.subviews.count == 4)
        return (UIView *)self.subviews[3];
    
    // If just right items
    return (UIView *)self.subviews[2];
}

- (void)hideNavigationBarSubviews:(BOOL)hide withOptions:(NavigationBarOption)navOptions animated:(BOOL)animated
{
    // Background = 1
    // Title = 2
    // Left items = 4
    // Right items = 8
    
    // 8² - 8 = 12 combinations + 1 for all together.
    
    switch ((NSUInteger)navOptions)
    {
        case 1: // Background
            [self hideBackground:hide animated:animated];
            break;
        case 2: // Title
            [self hideTitle:hide animated:animated];
            break;
        case 3:
            [self hideBackground:hide animated:animated];
            [self hideTitle:hide animated:animated];
            break;
        case 4: // Left Items
            [self hideLeftItems:hide animated:animated];
            break;
        case 5:
            [self hideBackground:hide animated:animated];
            [self hideLeftItems:hide animated:animated];
            break;
        case 6:
            [self hideTitle:hide animated:animated];
            [self hideLeftItems:hide animated:animated];
            break;
        case 7:
            [self hideLeftItems:hide animated:animated];
            [self hideBackground:hide animated:animated];
            [self hideTitle:hide animated:animated];
            break;
        case 8: // Right Items
            [self hideRightItems:hide animated:animated];
            break;
        case 9:
            [self hideBackground:hide animated:animated];
            [self hideRightItems:hide animated:animated];
            break;
        case 10:
            [self hideTitle:hide animated:animated];
            [self hideRightItems:hide animated:animated];
            break;
        case 11:
            [self hideBackground:hide animated:animated];
            [self hideTitle:hide animated:animated];
            [self hideRightItems:hide animated:animated];
            break;
        case 12:
            [self hideLeftItems:hide animated:animated];
            [self hideRightItems:hide animated:animated];
            break;
        default: // All Views
            [self hideBackground:hide animated:animated];
            [self hideTitle:hide animated:animated];
            [self hideLeftItems:hide animated:animated];
            [self hideRightItems:hide animated:animated];
            break;
    }
}

#pragma mark - Animation Methods (Private)

- (void)hideBackground:(BOOL)hide animated:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             [self hideBackground:hide animated:NO];
                         }];
        return;
    }
    
    UIView *view = (UIView *)self.subviews[0];
    view.layer.opacity = hide ? 0.0 : 1.0;
}

- (void)hideTitle:(BOOL)hide animated:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             [self hideTitle:hide animated:NO];
                         }];
        return;
    }
    
    UIView *view = (UIView *)self.subviews[1];
    view.layer.opacity = hide ? 0.0 : 1.0;
}

- (void)hideLeftItems:(BOOL)hide animated:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             [self hideLeftItems:hide animated:NO];
                         }];
        return;
    }
    
    UIView *view = (UIView *)self.subviews[self.subviews.count == 4 ? 2 : 2];
    view.layer.opacity = hide ? 0.0 : 1.0;
}

- (void)hideRightItems:(BOOL)hide animated:(BOOL)animated
{
    if (animated)
    {
        [UIView animateWithDuration:kAnimationDuration
                         animations:^{
                             [self hideRightItems:hide animated:NO];
                         }];
        return;
    }
    
    UIView *view = (UIView *)self.subviews[self.subviews.count == 4 ? 3 : 3];
    view.layer.opacity = hide ? 0.0 : 1.0;
}

@end
