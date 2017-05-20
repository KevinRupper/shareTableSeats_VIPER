//
//  Table.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTableItem.h"

@implementation VMTableItem

+ (instancetype) initTableWithOrigin:(NSString *)origin destination:(NSString *)destination serverID:(NSString *)serverID
{
    VMTableItem *table = [[self alloc] init];
    
    table.serverID = serverID;
    table.origin = origin;
    table.destination = destination;
    
    return table;
}

@end
