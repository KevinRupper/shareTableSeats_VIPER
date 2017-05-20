//
//  VMTablesInteractor.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VMTablesInteractorIO.h"
#import "VMTableListNetworkDelegateInterface.h"

@class VMTablesDataManager;
@class VMTableListNetworkManager;

@interface VMTablesInteractor : NSObject <VMTablesInteractorInput, VMTableListNetworkDelegateInterface>

@property (nonatomic, weak) id <VMTablesInteractorOutput> output;

- (instancetype)initWithDataManager:(VMTablesDataManager *)dataManager
                     networkManager:(VMTableListNetworkManager *)networkManager;

@end
