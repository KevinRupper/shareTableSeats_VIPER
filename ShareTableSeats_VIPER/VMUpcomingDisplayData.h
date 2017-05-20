//
//  VMUpcomingDisplayData.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VMUpcomingDisplayData : NSObject

// Array of VMUpcomingDisplaySection
@property (nonatomic, readonly, copy) NSArray *sections;

+ (instancetype)upcomingDisplayDataWithSections:(NSArray *)sections;

@end
