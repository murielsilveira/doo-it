//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskViewController.h"
#import "EditTaskViewController.h"

@interface DetailTaskViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;

@end

@implementation DetailTaskViewController

- (void)prepareViewModelWithTask:(Task *)task {
    self.viewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel showDetailTask];
}

- (void)presentBlankState {
    self.taskTitleLabel.text = @"";
}

- (void)presentDetailsForTask {
    self.taskTitleLabel.text = self.viewModel.task.taskTitle;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"editTask"]){
        EditTaskViewController *editTaskViewController = (EditTaskViewController*)[[segue destinationViewController] topViewController];
        [editTaskViewController prepareViewModelWithTask:self.viewModel.task];
    }
}

@end
