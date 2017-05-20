//
//  Table.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMTableItem : NSObject

@property (nonatomic, copy) NSString *origin;
@property (nonatomic, copy) NSString *destination;
@property (nonatomic, copy) NSString *serverID;

+ (instancetype) initTableWithOrigin:(NSString *)origin destination:(NSString *)destination serverID:(NSString *)serverID;

@end
