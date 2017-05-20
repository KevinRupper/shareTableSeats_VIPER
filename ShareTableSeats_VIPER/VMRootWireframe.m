//
//  VMRootWireframe.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMRootWireframe.h"
#import <UIKit/UIKit.h>

@implementation VMRootWireframe

- (void)showRootViewController:(UIViewController *)viewController inWindow:(UIWindow *)window
{
    UITabBarController *tabBarController = [self tabBarControllerFromWindow:window];
    tabBarController.viewControllers = @[viewController];
}

- (UITabBarController *) tabBarControllerFromWindow:(UIWindow *)window
{
    return (UITabBarController *)[window rootViewController];
}

@end
