//
//  VMUpcomingDisplayItem.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMUpcomingDisplayItem : NSObject

@property (nonatomic, readonly, copy) NSString *origin;
@property (nonatomic, readonly, copy) NSString *destination;

+ (instancetype)upcomingDisplayItemWithOrigin:(NSString *)origin
                                  destination:(NSString *)destination;

@end
