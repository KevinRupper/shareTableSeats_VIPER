//
//  VMCoreDataStore.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMCoreDataStore.h"

@interface VMCoreDataStore ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@end

@implementation VMCoreDataStore

- (id) init
{
    self = [super init];
    
    if(self)
    {
        _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
        _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.managedObjectModel];
        
        NSError *error = nil;
        NSURL *applicationDocumentsDirectory = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption: @(YES),
                                  NSInferMappingModelAutomaticallyOption: @(YES)};
        NSURL *storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:@"VMESAS-AVE.sqlite"];
        
        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil
                                                            URL:storeURL
                                                        options:options
                                                          error:&error];
        
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        _managedObjectContext.persistentStoreCoordinator = self.persistentStoreCoordinator;
        _managedObjectContext.undoManager = nil;
    }
    
    return self;
}

- (void) save
{
    NSError *error;
    [self.managedObjectContext save:&error];
    
    if(error)
        NSLog(@"#ERROR# %@", error.localizedDescription);
}

- (void) saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *moc = self.managedObjectContext;
    
    if(moc != nil)
    {
        if([moc hasChanges] && ![moc save:&error])
        {
            NSLog(@"#ERROR: Unresolved error %@, %@", error, [error userInfo]);
            return;
        }
    }
}

- (BOOL) saveContext:(NSManagedObjectContext *)moc
{
    NSError *error = nil;
    
    return [self saveContext:moc error:&error];
}

- (BOOL) saveContext:(NSManagedObjectContext *)moc error:(NSError **)error
{
    if(!moc)
        return NO;
    
    BOOL success = YES;
    
    @try
    {
        if ([moc hasChanges])
        {
            if(![moc save:error])
            {
                [moc rollback];
                success = NO;
                
                if (error)
                    NSLog(@"#ERROR: %@", *error);
            }
            else
            {
                if(moc.parentContext == nil)
                    NSLog(@"Did save context");
                else
                    NSLog(@"Did save child context");
            }
        }
    }
    @catch (NSException *exception)
    {
        NSString *errorString = [NSString stringWithFormat:@"Exception while saving context:\n %@", exception.description];
        NSLog(@"#ERROR: %@", errorString);
        [moc rollback];
        success = NO;
    }
    
    return success;
}

#pragma mark - Methods

- (void) fetchEntriesWithPredicate:(NSPredicate *)predicate
                   sortDescriptors:(NSArray *)sortDescriptors
                        entityName:(NSString *)entityName
                        completion:(VMDataStoreFetchCompletionBlock)completion
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:entityName];
    fetchRequest.predicate = predicate;
    fetchRequest.sortDescriptors = sortDescriptors;
    
    [self.managedObjectContext performBlock:^{
        
        NSError *error;
        NSArray *results = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if(error)
            NSLog(@"#ERROR# %@", error.localizedDescription);
        else
            if (completion)
                completion(results);
    }];
}

- (id) queryOneObjectWithEntityName:(NSString *)entityName predicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)moc
{
    id object = nil;
    if(entityName && moc)
    {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
        
        if(predicate)
            request.predicate = predicate;
        
        NSError *error = nil;
        request.fetchLimit = 1;
        
        NSArray *result = [moc executeFetchRequest:request error:&error];
        
        if (error)
            NSLog(@"#ERROR: queryOneObjectWithEntity name error, %@", error.localizedDescription);
        else if(result.count > 0)
            object = result.firstObject;
    }
    
    return object;
}

#pragma mark - Entities

- (VMManagedTable *)newTableWithID:(NSString *)tableID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"serverID == %@", tableID];
    
    VMManagedTable *table = [self queryOneObjectWithEntityName:@"VMManagedTable"
                                                     predicate:predicate
                                                     inContext:self.managedObjectContext];
    
    if(table == nil)
        table = [NSEntityDescription insertNewObjectForEntityForName:@"VMManagedTable"
                                              inManagedObjectContext:self.managedObjectContext];
    
    return table;
}

@end
