//
//  ListOfTasksTableViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 25/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListOfTasksTableViewController.h"
#import "TaskViewController.h"
#import "ListOfTasksTableViewCell.h"
#import "Colors.h"
#import "UIColor+Tools.h"

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
    [cell setColor: [UIColor colorWithHexString:task.color ]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"detailTask"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Task *task = [self.viewModel taskForRowAtIndex:indexPath.row];
        TaskViewController *detailTaskViewController = (TaskViewController*)[[segue destinationViewController] topViewController];
        [detailTaskViewController prepareViewModelWithTask:task];
    }
}

@end
