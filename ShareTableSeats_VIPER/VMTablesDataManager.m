//
//  VMTablesDataManager.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTablesDataManager.h"
#import "NSArray+HOM.h"
#import "VMCoreDataStore.h"
#import "VMManagedTable.h"
#import "VMTableItem.h"

@implementation VMTablesDataManager

- (void)tableItemsWithCompletion:(void (^)(NSArray *))completion
{
    __weak typeof (self) welf = self;
    
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"fromStationName" ascending:YES];
    [self.dataStore fetchEntriesWithPredicate:nil
                              sortDescriptors:@[sort]
                                   entityName:@"VMManagedTable"
                                   completion:^(NSArray *results)
     {
         if(completion)
             completion([welf tableItemsFromDataStoreEntries:results]);
    }];
}

- (void)tableItemsFromServerWithCompletion:(void (^) (NSArray *tableItems))completion
{
    
}

- (NSArray *)tableItemsFromDataStoreEntries:(NSArray *)entries
{
    return [entries arrayFromObjectsCollectedWithBlock:^id(VMManagedTable *table) {
        
        return [VMTableItem initTableWithOrigin:table.toStationName
                                    destination:table.fromStationName
                                       serverID:table.serverID];
    }];
}

@end
