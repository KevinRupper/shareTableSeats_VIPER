//
//  VMTablesViewInterface.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VMUpcomingDisplayData;

@protocol VMTablesViewInterface <NSObject>

- (void)showNoContentView;
- (void)showUpComingDisplayData:(VMUpcomingDisplayData *)data;
- (void)reloadEntries;

@end
