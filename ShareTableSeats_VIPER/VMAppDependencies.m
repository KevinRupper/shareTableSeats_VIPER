//
//  VMAppDependencies.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMAppDependencies.h"
#import <UIKit/UIKit.h>

// Base classes
#import "VMCoreDataStore.h"
#import "VMRootWireframe.h"

// Network classes
#import "VMTableListNetworkManager.h"
#import "VMTableListNetworkDataManager.h"

// Use case classes
#import "VMTablesDataManager.h"
#import "VMTablesInteractor.h"
#import "VMTablesPresenter.h"
#import "VMTablesWireframe.h"

@interface VMAppDependencies ()

@property (nonatomic, strong) VMTablesWireframe *tablesWireframe;

@end

@implementation VMAppDependencies

- (id)init
{
    self = [super init];
    
    if(self)
        [self configureDependencies];
    
    return self;
}


- (void)installRootViewControllerIntoWindow:(UIWindow *)window
{
    [self.tablesWireframe presentTablesInterfaceFromWindow:window];
}

- (void)configureDependencies
{
    // Root level
    VMCoreDataStore *dataStore     = [[VMCoreDataStore alloc] init];
    VMRootWireframe *rootWireFrame = [[VMRootWireframe alloc] init];
    
    // Network classes
    VMTableListNetworkManager *networkManager = [[VMTableListNetworkManager alloc] init];
    VMTableListNetworkDataManager *networkDataManager = [[VMTableListNetworkDataManager alloc] init];
    
    // Tables Module classes
    VMTablesWireframe   *tablesWireFrame   = [[VMTablesWireframe alloc] init];
    VMTablesPresenter   *tablesPresenter   = [[VMTablesPresenter alloc] init];
    VMTablesDataManager *tablesDataManager = [[VMTablesDataManager alloc] init];
    
    VMTablesInteractor  *tablesInteractor  = [[VMTablesInteractor alloc] initWithDataManager:tablesDataManager
                                                                              networkManager:networkManager];
    
    tablesInteractor.output          = tablesPresenter;
    tablesPresenter.tablesInteractor = tablesInteractor;
    tablesPresenter.tablesWireframe  = tablesWireFrame;
    tablesWireFrame.tablesPresenter  = tablesPresenter;
    tablesWireFrame.rootWireFrame    = rootWireFrame;
    tablesDataManager.dataStore      = dataStore;
    
    self.tablesWireframe = tablesWireFrame;
    
    // Network classes
    networkManager.networkDataManager = networkDataManager;
    networkManager.networkDelegate    = tablesInteractor;
    
    networkDataManager.dataStore = dataStore;
    
}

@end
