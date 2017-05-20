//
//  VMUpcomingDisplaySection.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMUpcomingDisplaySection : NSObject

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, copy) NSArray  *items;

+ (instancetype)upcomingDisplaySectionsWithName:(NSString *)name
                                          items:(NSArray *)items;

@end
