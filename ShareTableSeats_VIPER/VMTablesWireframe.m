//
//  VMTablesWireframe.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTablesWireframe.h"
#import <UIKit/UIKit.h>

#import "VMTablesPresenter.h"
#import "VMTablesViewController.h"
#import "VMRootWireframe.h"

static NSString *TablesViewControllerIdentifier = @"VMTablesViewController";

@interface VMTablesWireframe ()

@property (nonatomic, strong) VMTablesViewController *tablesViewController;

@end

@implementation VMTablesWireframe

- (void)presentTablesInterfaceFromWindow:(UIWindow *)window
{
    VMTablesViewController *viewController = [self tablesViewControllerFromStoryBoard];
    viewController.eventHandler            = self.tablesPresenter;
    self.tablesPresenter.userInterface     = viewController;
    self.tablesViewController              = viewController;
    
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.rootWireFrame showRootViewController:nc inWindow:window];
}

- (VMTablesViewController *)tablesViewControllerFromStoryBoard
{
    UIStoryboard *storyBoard = [self mainStoryBoard];
    VMTablesViewController *viewController = [storyBoard instantiateViewControllerWithIdentifier:TablesViewControllerIdentifier];
    return viewController;
}

- (UIStoryboard *)mainStoryBoard
{
    return [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
}

@end
