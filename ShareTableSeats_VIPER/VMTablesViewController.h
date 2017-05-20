//
//  VMTablesViewController.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VMTablesViewInterface.h"
#import "VMTablesModuleInterface.h"

@interface VMTablesViewController : UITableViewController <VMTablesViewInterface>

@property (nonatomic, strong) id<VMTablesModuleInterface> eventHandler;

@end
