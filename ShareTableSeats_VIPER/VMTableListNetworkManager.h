//
//  TableListNetworkManager.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMTableListNetworkDelegateInterface.h"

@class VMTableListNetworkDataManager;

@interface VMTableListNetworkManager : NSObject

@property (nonatomic, weak) id<VMTableListNetworkDelegateInterface> networkDelegate;
@property (nonatomic, strong) VMTableListNetworkDataManager *networkDataManager;

- (void)getTables;

@end
