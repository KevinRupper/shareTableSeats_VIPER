//
//  VMUpcomingDisplayItem.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMUpcomingDisplayItem.h"

@interface VMUpcomingDisplayItem ()

@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *destination;

@end

@implementation VMUpcomingDisplayItem

+ (instancetype)upcomingDisplayItemWithOrigin:(NSString *)origin
                                  destination:(NSString *)destination
{
    VMUpcomingDisplayItem *item = [[VMUpcomingDisplayItem alloc] init];
    item.origin = origin;
    item.destination = destination;
    
    return item;
}

// TODO: NSHipster equality implementation

@end
