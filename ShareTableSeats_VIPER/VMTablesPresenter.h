//
//  VMTablesPresenter.h
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "VMTablesModuleInterface.h"
#import "VMTablesInteractorIO.h"
#import "VMTablesWireframe.h"
#import "VMTablesViewInterface.h"

@interface VMTablesPresenter : NSObject <VMTablesInteractorOutput, VMTablesModuleInterface>

@property (nonatomic, strong) id <VMTablesInteractorInput> tablesInteractor;
@property (nonatomic, strong) VMTablesWireframe *tablesWireframe;
@property (nonatomic, strong) UIViewController<VMTablesViewInterface> *userInterface;

@end
