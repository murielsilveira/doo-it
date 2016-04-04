//
//  ListOfTasksTableViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 25/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListOfTasksTableViewController.h"
#import "DetailTaskTableViewController.h"
#import "EditTaskViewController.h"
#import "ListOfTasksTableViewCell.h"
#import "Colors.h"

#import "TaskGatewayFactory.h"
#import "ListTasksViewModel.h"

@interface ListOfTasksTableViewController ()

@property ListTasksViewModel *viewModel;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation ListOfTasksTableViewController

NSString *const CELL_IDENTIFIER = @"Task Cell";
NSString *const SECTION_IDENTIFIER = @"Task Cell Section";

- (void)awakeFromNib {
    [super awakeFromNib];
    id<TaskGatewayProtocol> gateway = [TaskGatewayFactory create];
    self.viewModel = [[ListTasksViewModel alloc] initWithPresenter:self andGateway:gateway];
}

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.searchBar.layer.borderWidth = 1;
    self.searchBar.layer.borderColor = [[Colors grayBlueColor] CGColor];
//    self.view.backgroundColor = [Colors grayBlueColor];
}

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
        DetailTaskTableViewController *detailTaskViewController = (DetailTaskTableViewController*)[[segue destinationViewController] topViewController];
        [detailTaskViewController prepareViewModelWithTask:task];
    }else if([segue.identifier isEqualToString:@"newTask"]){
        EditTaskViewController *editTaskViewController = (EditTaskViewController*)[[segue destinationViewController] topViewController];
        [editTaskViewController prepareViewModelWithNoTask];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SECTION_IDENTIFIER];
    cell.layer.borderWidth = 1;
    cell.layer.borderColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    return cell;
}

@end
