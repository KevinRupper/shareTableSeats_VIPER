//
//  VMCoreDataStore.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

typedef void (^VMDataStoreFetchCompletionBlock)(NSArray *results);

@class VMManagedTable;

@interface VMCoreDataStore : NSObject

- (void) fetchEntriesWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
                        entityName:(NSString *)entityName
                        completion:(VMDataStoreFetchCompletionBlock)completion;

- (id) queryOneObjectWithEntityName:(NSString *)entityName
                          predicate:(NSPredicate *)predicate
                          inContext:(NSManagedObjectContext *)moc;

- (void) save;
- (void) saveContext;

- (VMManagedTable *)newTableWithID:(NSString *)tableID;

@end
