//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskTableViewController.h"
#import "EditTaskViewController.h"
#import "ColorView.h"
#import "Colors.h"
#import "UIColor+Tools.h"

@interface DetailTaskTableViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UITextView *taskTitleTextView;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;

@end

@implementation DetailTaskTableViewController

- (void)prepareViewModelWithTask:(Task *)task {
    self.viewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel showDetailTask];
}

- (void)presentBlankState {
    self.taskTitleLabel.text = @"";
}

- (void)presentDetailsForTask {
    self.taskTitleLabel.textColor = [UIColor colorWithHexString:self.viewModel.task.color];
    self.taskDescriptionLabel.textColor = [UIColor colorWithHexString:self.viewModel.task.color];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:self.viewModel.task.color];
    self.taskTitleLabel.text = self.viewModel.task.taskTitle;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"editTask"]){
        EditTaskViewController *editTaskViewController = (EditTaskViewController*)[[segue destinationViewController] topViewController];
        [editTaskViewController prepareViewModelWithTask:self.viewModel.task];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
    {
        CGFloat maxLabelWidth = self.tableView.frame.size.width - 16;
        CGSize neededSize = [self.taskTitleLabel sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
        NSLog(@"w:%f h:%f", neededSize.width, neededSize.height);
        return neededSize.height + 8;
    }else{
        CGFloat maxLabelWidth = self.tableView.frame.size.width - 16;
        CGSize neededSize = [self.taskDescriptionLabel sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
        NSLog(@"w:%f h:%f", neededSize.width, neededSize.height);
        return neededSize.height + 8;
    }
}

@end
