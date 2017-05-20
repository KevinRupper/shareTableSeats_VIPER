//
//  VMTablesInteractor.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTablesInteractor.h"
#import "NSArray+HOM.h"

#import "VMTableListNetworkManager.h"
#import "VMTablesDataManager.h"
#import "VMUpcomingItem.h"
#import "VMTableItem.h"

@interface VMTablesInteractor ()

@property (nonatomic, strong) VMTablesDataManager *dataManager;
@property (nonatomic, strong) VMTableListNetworkManager *networkManager;

@end

@implementation VMTablesInteractor

- (instancetype)initWithDataManager:(VMTablesDataManager *)dataManager networkManager:(VMTableListNetworkManager *)networkManager
{
    self = [super init];
    
    if(self)
    {
        self.dataManager = dataManager;
        self.networkManager = networkManager;
    }
    
    return self;
}

- (void)findUpcomingItems
{
    __weak typeof (self) welf = self;
    
    [self.dataManager tableItemsWithCompletion:^(NSArray *tableItems) {
        [welf.output foundUpcomingItems:[welf upcomingItemsFromTables:tableItems]];
    }];
}

- (void)findUpcomingItemsFromServer
{
    [_networkManager getTables];
}

- (NSArray *) upcomingItemsFromTables:(NSArray *)tables
{
    NSArray *validItems = (tables != nil) ? tables : @[];
    
    return [validItems arrayFromObjectsCollectedWithBlock:^id(VMTableItem *table) {
        return [VMUpcomingItem upcomingItemWithOrigin:table.origin destination:table.destination];
    }];
}

#pragma mark - TableList network delegate

- (void)tableListError
{
    NSLog(@"#ERROR: network error");
}

- (void)tableListGetTablesSuccess
{
    NSLog(@"#INFO: network success");
    [self findUpcomingItems];
}


@end
