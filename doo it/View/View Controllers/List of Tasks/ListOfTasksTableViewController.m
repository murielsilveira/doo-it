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
    _viewModel = [[ListTasksViewModel alloc] initWithPresenter:self andGateway:gateway];
}

#pragma mark - View Controller Lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    [_viewModel presentTasks];
}

#pragma mark - ListTasksPresenterProtocol

- (void) presentBlankState {
    
}

- (void) presentListOfTasks {
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_viewModel numberOfTasksToPresent];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListOfTasksTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER forIndexPath:indexPath];
    Task *task = [_viewModel taskForRow:indexPath.row inSection:indexPath.section];
    cell.taskTitleLabel.text = task.taskTitle;
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier  isEqual: @"Task Selected"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Task *task = [_viewModel taskForRow:indexPath.row inSection:indexPath.section];
        DetailTaskViewController *detailTaskViewController = (DetailTaskViewController *)[[segue destinationViewController] topViewController];
        detailTaskViewController.titleText = task.taskTitle;
    }
}

- (IBAction)unwindToListOfTasksTableViewController:(UIStoryboardSegue *)segue {
    [_viewModel presentTasks];
}

@end
