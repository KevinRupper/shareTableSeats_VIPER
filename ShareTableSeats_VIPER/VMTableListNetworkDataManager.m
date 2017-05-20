//
//  VMTableListNetworkDataManager.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTableListNetworkDataManager.h"

#import "VMCoreDataStore.h"
#import "VMManagedTable.h"
#import "VMTableItem.h"

@implementation VMTableListNetworkDataManager

- (void) addNewTable:(VMTableItem *)table
{
    VMManagedTable *newTable = [self.dataStore newTableWithID:table.serverID];
    
    newTable.fromStationName = table.origin;
    newTable.toStationName = table.destination;
    
    [self.dataStore saveContext];
}

@end
