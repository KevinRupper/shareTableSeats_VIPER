//
//  VMTableListNetworkDataManager.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VMCoreDataStore;
@class VMTableItem;

@interface VMTableListNetworkDataManager : NSObject

@property (nonatomic, strong) VMCoreDataStore *dataStore;

- (void) addNewTable:(VMTableItem *)table;

@end
