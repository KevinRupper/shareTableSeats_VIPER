//
//  VMTablesDataManager.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^VMTablesDataManagerFetchEntriesBlock)(NSArray *entries);

@class VMCoreDataStore;
@class VMTableItem;

@interface VMTablesDataManager : NSObject

@property (nonatomic, strong) VMCoreDataStore *dataStore;

- (void)tableItemsWithCompletion:(void (^) (NSArray *tableItems))completion;
- (void)tableItemsFromServerWithCompletion:(void (^) (NSArray *tableItems))completion;

@end
