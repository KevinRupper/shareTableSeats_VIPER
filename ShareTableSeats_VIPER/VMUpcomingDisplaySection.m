//
//  VMUpcomingDisplaySection.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMUpcomingDisplaySection.h"

@interface VMUpcomingDisplaySection ()

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSArray  *items;

@end

@implementation VMUpcomingDisplaySection

+ (instancetype)upcomingDisplaySectionsWithName:(NSString *)name
                                          items:(NSArray *)items
{
    VMUpcomingDisplaySection *section = [[VMUpcomingDisplaySection alloc] init];
    section.name = name;
    section.items = items;
    
    return section;
}

// TODO: NSHipster equality implementation

@end
