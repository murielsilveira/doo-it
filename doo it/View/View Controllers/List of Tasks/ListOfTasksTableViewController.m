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

#import "TaskGatewayFactory.h"
#import "ListTasksViewModel.h"

@interface ListOfTasksTableViewController ()

@property ListTasksViewModel *viewModel;
@property NSArray *listOfTasks;

@end

@implementation ListOfTasksTableViewController

NSString *const CELL_IDENTIFIER = @"Task Cell";


- (void)awakeFromNib {
    [super awakeFromNib];
    id<TaskGatewayProtocol> gateway = [TaskGatewayFactory create];
    _viewModel = [[ListTasksViewModel alloc] initWithPresenter:self andGateway:gateway];
}

#pragma mark - View Controller Lifecycle

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_viewModel presentListOfTasks];
}

#pragma mark - ListTasksPresenterProtocol

- (void) presentBlankState {
    
}

- (void) presentListOfTasks:(NSArray*)listOfTasks {
    self.listOfTasks = listOfTasks;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listOfTasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListOfTasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    Task *task = self.listOfTasks[indexPath.row];
    cell.taskTitleLabel.text = task.taskTitle;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqual: @"detailTask"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailTaskViewController *detailTaskViewController = (DetailTaskViewController *)[[segue destinationViewController] topViewController];
        [detailTaskViewController createViewModelForTask:_listOfTasks[indexPath.row]];
    }
}

- (IBAction)unwindToListOfTasksTableViewController:(UIStoryboardSegue *)segue {
    [_viewModel presentListOfTasks];
}

@end
