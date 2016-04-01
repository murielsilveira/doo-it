//
//  EditTaskViewModel.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "EditTaskViewModel.h"

@interface EditTaskViewModel ()

@property id<EditTaskPresenterProtocol> presenter;
@property id<TaskGatewayProtocol> taskGateway;

@end

@implementation EditTaskViewModel

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)presenter gateway:(id<TaskGatewayProtocol>)taskGateway andTask:(Task *)task {
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.taskGateway = taskGateway;
        self.task = task;
    }
    return self;
}

- (void)prepareTaskFormForEditing {
    if(self.task==nil) {
        self.task = [[Task alloc]initWithTitle:@""];
        [self.presenter presentEmptyTaskForEdition];
    }else{
        [self.presenter presentEditionForTask];
    }
}

- (void)saveTask {
    if([self validateTaskForSaving]) {
        [self.taskGateway saveTask:self.task];
        [self.presenter presentSuccesMessageForSavingTask];
    }else{
        [self.presenter presentErrorMessageForSavingTask:@"Error saving task!"];
    }
}

- (bool)validateTaskForSaving {
    if([self.task.taskTitle isEqual:@""])
        return false;
    return true;
}

@end
