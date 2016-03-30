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

- (void)awakeFromNib {
    [super awakeFromNib];
    _viewModel = [[EditTaskViewModel alloc]initWithPresenter:self gateway:[TaskGatewayFactory create] andTask:_task];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    [_viewModel presentTaskForEditing];
}

- (void)presentEmptyTaskForEdition {
    _taskTitleTextField.text = @"";
}

- (void)presentTaskForEdition:(NSString*)taskTitle {
    _taskTitleTextField.text = taskTitle;
}

- (void)presentSuccesMessageForSavingTask {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)presentErrorMessageForSavingTask:(NSString *)message {
    
}

- (void)saveTask {
    Task *task = [[Task alloc]initWithTitle:_taskTitleTextField.text];
    [_viewModel saveTask:task];
}

- (IBAction)cancelEditTask:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveEditTask:(id)sender {
    [self saveTask];
}

@end
