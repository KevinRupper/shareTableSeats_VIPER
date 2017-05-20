//
//  VMUpcomingDisplayData.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMUpcomingDisplayData.h"

@interface VMUpcomingDisplayData ()

@property (nonatomic, copy) NSArray *sections;

@end

@implementation VMUpcomingDisplayData

+ (instancetype)upcomingDisplayDataWithSections:(NSArray *)sections
{
    VMUpcomingDisplayData *data = [[VMUpcomingDisplayData alloc] init];
    data.sections = sections;
    
    return data;
}

#pragma mark - Default equality implementation (NSHipster --> http://nshipster.com/equality/)

- (BOOL)isEqualToUpcomingDisplayData:(VMUpcomingDisplayData *)data
{
    if(!data)
        return NO;
    
    return [self.sections isEqualToArray:data.sections];
}

- (BOOL)isEqual:(id)object
{
    if(self == object)
        return YES;
    
    if(![object isKindOfClass:[VMUpcomingDisplayData class]])
         return NO;
    
    return [self isEqualToUpcomingDisplayData:object];
}

- (NSUInteger)hash
{
    return [self.sections hash];
}

@end
