//
//  VMTablesInteractorIO.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VMTablesInteractorInput <NSObject>

- (void) findUpcomingItems;
- (void) findUpcomingItemsFromServer;

@end

@protocol VMTablesInteractorOutput <NSObject>

- (void) foundUpcomingItems:(NSArray *)upcomingItems;

@end
