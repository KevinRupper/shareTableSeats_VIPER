//
//  VMTablesWireframe.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIWindow;
@class VMTablesPresenter;
@class VMTableViewController;
@class VMRootWireframe;

@interface VMTablesWireframe : NSObject

@property (nonatomic, strong) VMTablesPresenter *tablesPresenter;
@property (nonatomic, strong) VMRootWireframe *rootWireFrame;

- (void)presentTablesInterfaceFromWindow:(UIWindow *)window;

@end
