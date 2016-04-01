//
//  EditTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "EditTaskViewController.h"
#import "TaskGatewayFactory.h"
#import "EditTaskViewModel.h"

@interface EditTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskTitleTextField;
@property EditTaskViewModel *viewModel;

@end

@implementation EditTaskViewController

- (void)prepareViewModelWithNoTask {
    self.viewModel = [[EditTaskViewModel alloc]initWithPresenter:self gateway:[TaskGatewayFactory create] andTask:nil];
}

- (void)prepareViewModelWithTask:(Task*)task {
    self.viewModel = [[EditTaskViewModel alloc]initWithPresenter:self gateway:[TaskGatewayFactory create] andTask:task];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.viewModel prepareTaskFormForEditing];
}

- (void)presentEmptyTaskForEdition {
    self.taskTitleTextField.text = @"";
}

- (void)presentEditionForTask {
    self.taskTitleTextField.text = self.viewModel.task.taskTitle;
}

- (void)presentSuccesMessageForSavingTask {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentErrorMessageForSavingTask:(NSString *)message {
    
}

- (void)saveTask {
    Task *task = self.viewModel.task;
    task.taskTitle = self.taskTitleTextField.text;
    [self.viewModel saveTask];
}

- (IBAction)cancelEditTask:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveEditTask:(id)sender {
    [self saveTask];
}

@end
