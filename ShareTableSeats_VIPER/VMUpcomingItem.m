//
//  VMUpcomingItem.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMUpcomingItem.h"

@interface VMUpcomingItem ()

@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *destination;

@end

@implementation VMUpcomingItem

+ (instancetype) upcomingItemWithOrigin:(NSString *)origin destination:(NSString *)destination
{
    VMUpcomingItem *item = [[VMUpcomingItem alloc] init];
    item.origin = origin;
    item.destination = destination;
    
    return item;
}

- (BOOL) isEqualToUpcomingItem:(VMUpcomingItem *)item
{
    if(!item)
        return NO;
    
    BOOL hasEqualsOrigin = [self.origin isEqualToString:item.origin];
    BOOL hasEqualsDestination = [self.destination isEqualToString:item.destination];
    
    return hasEqualsOrigin && hasEqualsDestination;
}

- (BOOL) isEqual:(id)object
{
    if(self == object)
        return YES;
    
    if(![object isKindOfClass:[VMUpcomingItem class]])
        return NO;
    
    return [self isEqualToUpcomingItem:object];
}

- (NSUInteger)hash
{
    return [self.origin hash] ^ [self.destination hash];
}

@end
