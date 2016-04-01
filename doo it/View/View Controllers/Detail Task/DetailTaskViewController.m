//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskViewController.h"
#import "DetailTaskViewModel.h"

@interface DetailTaskViewController ()

@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;

@property DetailTaskViewModel *viewModel;

@end

@implementation DetailTaskViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    [self createViewModelForTask:nil];
}

- (void)createViewModelForTask:(Task*)task {
    _viewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [_viewModel showDetailTask];
}

- (void)presentBlankState {
    _taskTitleLabel.text = @"";
}

- (void)presentDetailsForTask:(Task *)task {
    _taskTitleLabel.text = task.taskTitle;
}

@end
