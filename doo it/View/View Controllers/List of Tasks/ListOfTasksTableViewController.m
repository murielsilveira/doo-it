//
//  ListOfTasksTableViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 25/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListOfTasksTableViewController.h"
#import "DetailTaskViewController.h"
#import "EditTaskViewController.h"
#import "ListOfTasksTableViewCell.h"
#import "ListTasksViewModel.h"
#import "TaskGatewayDouble.h"

@implementation ListOfTasksTableViewController

NSString *const CELL_IDENTIFIER = @"Task Cell";
ListTasksViewModel *viewModel;

- (instancetype)init
{
    self = [super init];
    if (self) {
        viewModel = [[ListTasksViewModel alloc] initWithPresenter:self andGateway:[[TaskGatewayDouble alloc] init]];
    }
    return self;
}

#pragma mark - View Controller Lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    [viewModel presentTasks];
}

#pragma mark - ListTasksPresenterProtocol

- (void) presentBlankState {
    
}

- (void) presentListOfTasks {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListOfTasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    NSMutableString *taskTitle = [NSMutableString stringWithFormat:@"Task %d", indexPath.row];
    cell.taskTitleLabel.text = taskTitle;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"Task Selected"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailTaskViewController *detailTaskViewController = (DetailTaskViewController *)[[segue destinationViewController] topViewController];
        detailTaskViewController.titleText = [NSMutableString stringWithFormat:@"Task %d", indexPath.row];
    }
}

@end
