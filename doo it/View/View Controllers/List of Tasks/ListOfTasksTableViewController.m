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

@end

@implementation ListOfTasksTableViewController

NSString *const CELL_IDENTIFIER = @"Task Cell";

- (void)awakeFromNib {
    [super awakeFromNib];
    id<TaskGatewayProtocol> gateway = [TaskGatewayFactory create];
    self.viewModel = [[ListTasksViewModel alloc] initWithPresenter:self andGateway:gateway];
}

#pragma mark - View Controller Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel presentListOfTasks];
}

#pragma mark - ListTasksPresenterProtocol

- (void) presentBlankState {
    
}

- (void) presentListOfTasks {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfTasksToPresent];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListOfTasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    Task *task = [self.viewModel taskForRowAtIndex:indexPath.row];
    cell.taskTitleLabel.text = task.taskTitle;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"detailTask"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Task *task = [self.viewModel taskForRowAtIndex:indexPath.row];
        DetailTaskViewController *detailTaskViewController = (DetailTaskViewController*)[[segue destinationViewController] topViewController];
        [detailTaskViewController prepareViewModelWithTask:task];
    }else if([segue.identifier isEqualToString:@"newTask"]){
        EditTaskViewController *editTaskViewController = (EditTaskViewController*)[[segue destinationViewController] topViewController];
        [editTaskViewController prepareViewModelWithNoTask];
    }
}

@end
