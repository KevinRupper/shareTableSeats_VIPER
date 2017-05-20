//
//  VMTablesPresenter.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTablesPresenter.h"

#import "VMUpcomingDisplayDataCollector.h"

@implementation VMTablesPresenter

#pragma mark - VMTablesModuleInterface protocol

- (void)updateView
{
    [self.tablesInteractor findUpcomingItems];
}

#pragma mark - List interactor output

- (void)foundUpcomingItems:(NSArray *)upcomingItems
{
    if(upcomingItems.count == 0)
        [self.userInterface showNoContentView];
    else
        [self updateUserInterfaceWithUpcomingItems:upcomingItems];
}

- (void)updateUserInterfaceWithUpcomingItems:(NSArray *)upcomingItems
{
    [self.userInterface showUpComingDisplayData:[self upcomingDisplayDataWithItems:upcomingItems]];
}

- (VMUpcomingDisplayData *)upcomingDisplayDataWithItems:(NSArray *)upcomingItems
{
    VMUpcomingDisplayDataCollector *collector = [[VMUpcomingDisplayDataCollector alloc] init];
    [collector addUpcomingItems:upcomingItems];
    
    return [collector collectedDisplayData];
}

// TODO: add new entry and search actions

- (void)refresh
{
    [self.tablesInteractor findUpcomingItemsFromServer];
}

@end
