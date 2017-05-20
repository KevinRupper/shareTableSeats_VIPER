//
//  VMTablesViewController.m
//  ShareTableSeats_VIPER
//
//  Created by Kevin Rupper on 1/3/15.
//  Copyright (c) 2015 Guerrilla Dev SWAT. All rights reserved.
//

#import "VMTablesViewController.h"

#import "VMTableItem.h"
#import "VMUpcomingDisplayData.h"
#import "VMUpcomingDisplaySection.h"
#import "VMUpcomingDisplayItem.h"

static NSString *const VMTableCellIdentifier = @"VMTableCell";

@interface VMTablesViewController ()

@property (nonatomic, strong) VMUpcomingDisplayData *data;

@end

@implementation VMTablesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    // Presenter
    [self.eventHandler updateView];
}

- (void) configureView
{
    self.navigationItem.title = @"Mesas";
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    
    [refreshControl addTarget:self action:@selector(refresh:) forControlEvents:UIControlEventValueChanged];
    
    self.refreshControl = refreshControl;
    
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(didTapAddButton:)];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                                                target:self
                                                                                action:@selector(didTapSearchButton:)];
    
    self.navigationItem.leftBarButtonItem = addItem;
    self.navigationItem.rightBarButtonItem = searchItem;
}

- (void)didTapAddButton:(id)sender
{
}

- (void)didTapSearchButton:(id)sender
{
}

- (void)refresh:(UIRefreshControl *)sender
{
    [self.eventHandler refresh];
}

#pragma mark - VMTablesViewInterface protocol

- (void)showNoContentView
{
    // Show no content view
//    self.view = self.noContentView;
}

- (void)showUpComingDisplayData:(VMUpcomingDisplayData *)data
{
    self.data = data;
    [self reloadEntries];
}

- (void)reloadEntries
{
    [self.tableView reloadData];
}

#pragma mark - TableView datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.data.sections count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    VMUpcomingDisplaySection *upcomingSection = self.data.sections[section];
    
    return upcomingSection.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:VMTableCellIdentifier forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%li", (long)indexPath.row];
    
    return cell;
}

-(void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    VMUpcomingDisplaySection *section = self.data.sections[indexPath.section];
    VMUpcomingDisplayItem *item = section.items[indexPath.row];
    cell.textLabel.text = item.origin;
}

@end
