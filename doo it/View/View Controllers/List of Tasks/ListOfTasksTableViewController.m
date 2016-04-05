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

#import "MarkdownGatewayFactory.h"
#import "ListTasksViewModel.h"

@interface ListOfTasksTableViewController ()

@property ListTasksViewModel *viewModel;

@end

@implementation ListOfTasksTableViewController

NSString *const CELL_IDENTIFIER = @"Task Cell";
NSString *const SECTION_IDENTIFIER = @"Task Cell Section";

- (void)awakeFromNib {
    [super awakeFromNib];
    id<MarkdownGatewayProtocol> gateway = [MarkdownGatewayFactory create];
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
    Markdown *task = [self.viewModel taskForRowAtIndex:indexPath.row];
    cell.taskTitleLabel.text = task.markdownString;
    [cell setColor: [UIColor colorWithHexString:task.markdownColor ]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"showMarkdown"]){
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Markdown *task = [self.viewModel taskForRowAtIndex:indexPath.row];
        TaskViewController *detailTaskViewController = (TaskViewController*)[segue destinationViewController];
        [detailTaskViewController prepareViewModelWithTask:task];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sectionCell"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}

@end
