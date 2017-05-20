//
//  NSArray+HOM.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (HOM)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block;

@end
