//
//  VMUpcomingDisplayDataCollector.m
//  MShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMUpcomingDisplayDataCollector.h"
#import "NSArray+HOM.h"

#import "VMUpcomingDisplaySection.h"
#import "VMUpcomingDisplayData.h"
#import "VMUpcomingDisplayItem.h"
#import "VMUpcomingItem.h"

@interface VMUpcomingDisplayDataCollector ()

@property (nonatomic, strong) NSMutableDictionary *sections;

@end

@implementation VMUpcomingDisplayDataCollector

/*
 * Transform VMUpcomingItems to VMUpcomingDisplayItems
 * and add items to section
 */

- (void)addUpcomingItems:(NSArray *)upcomingItems
{
    for (VMUpcomingItem *item in upcomingItems)
    {
        [self addUpcomingItem:item];
    }
}

- (void)addUpcomingItem:(VMUpcomingItem *)upcomingItem
{
    VMUpcomingDisplayItem *displayItem = [self displayItemForUpcomingItem:upcomingItem];
    [self addDisplayItem:displayItem];
}

- (void)addDisplayItem:(VMUpcomingDisplayItem *)displayItem
{
    NSMutableArray *sectionItems = [self sectionItems];
    [sectionItems addObject:displayItem];
}

- (VMUpcomingDisplayItem *)displayItemForUpcomingItem:(VMUpcomingItem *)upcomingItem
{
    return [VMUpcomingDisplayItem upcomingDisplayItemWithOrigin:upcomingItem.origin destination:upcomingItem.destination];
}

// Collect data

- (VMUpcomingDisplayData *)collectedDisplayData
{
    NSArray *displaySections = [[self collectecSectionKeys] arrayFromObjectsCollectedWithBlock:^id(id object) {
        return [self displaySectionForKey:@"Tables"];
    }];
    
    return [VMUpcomingDisplayData upcomingDisplayDataWithSections:displaySections];
}

- (VMUpcomingDisplaySection *)displaySectionForKey:(NSString *)sectionKey
{
    return [VMUpcomingDisplaySection upcomingDisplaySectionsWithName:sectionKey items:self.sections[sectionKey]];
}

- (NSMutableArray *)sectionItems
{
    NSMutableDictionary *sections = self.sections;
    NSMutableArray *section = sections[@"Tables"];
    
    if(section == nil)
    {
        section = [NSMutableArray array];
        sections[@"Tables"] = section;
    }
    
    return section;
}

- (NSArray *)collectecSectionKeys
{
    return [self.sections allKeys];
}

#pragma mark - Setters

- (NSMutableDictionary *)sections
{
    if(_sections == nil)
        _sections = [NSMutableDictionary dictionary];
    
    return _sections;
}

@end
