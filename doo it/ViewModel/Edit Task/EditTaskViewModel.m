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
@property Task *task;

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

- (void)presentTaskForEditing {
    if(_task==nil) {
        [_presenter presentEmptyTaskForEdition];
    }else{
        [_presenter presentTaskForEdition:_task.taskTitle];
    }
}

@end
