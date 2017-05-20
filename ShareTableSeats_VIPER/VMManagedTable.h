//
//  VMManagedTable.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface VMManagedTable : NSManagedObject

@property (nonatomic, retain) NSString * fromStationName;
@property (nonatomic, retain) NSString * toStationName;
@property (nonatomic, retain) NSString * serverID;

@end
