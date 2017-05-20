//
//  TableListNetworkManager.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 3/5/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTableListNetworkManager.h"

#import "VMTableListNetworkDataManager.h"
#import "WebService.h"
#import "VMTableItem.h"

@implementation VMTableListNetworkManager

- (void)getTables
{
    [[WebService sharedInstance] getTablesWithCompletion:^(BOOL ok, NSArray *tables, NSString *errorMessage) {
        
        if(!ok)
            [self.networkDelegate tableListError];
        
        if(errorMessage.length > 0)
            [self.networkDelegate tableListError];
        
        for (NSDictionary *tableDic in tables)
        {
            NSDictionary *fromStationDic = tableDic[@"_fromStation"];
            NSDictionary *toStationDic = tableDic[@"_toStation"];
            
            [self saveNewTableWithServerID:tableDic[@"_id"]
                           fromStationName:fromStationDic[@"name"]
                             toStationName:toStationDic[@"name"]];
        }
        
        [self.networkDelegate tableListGetTablesSuccess];
    }];
}

- (void)saveNewTableWithServerID:(NSString *)serverID
                 fromStationName:(NSString *)fromStationName
                   toStationName:(NSString *)toStationName
{
    VMTableItem *newTable = [VMTableItem initTableWithOrigin:fromStationName
                                                 destination:toStationName
                                                    serverID:serverID];
    [self.networkDataManager addNewTable:newTable];
}

@end
