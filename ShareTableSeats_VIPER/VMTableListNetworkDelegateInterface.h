//
//  VMTableListNetworkDelegateInterface.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VMTableListNetworkDelegateInterface <NSObject>

- (void)tableListError;
- (void)tableListGetTablesSuccess;

@end
