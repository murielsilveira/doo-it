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

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)presenter andGateway:(id<TaskGatewayProtocol>)taskGateway
{
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.taskGateway = taskGateway;
    }
    return self;
}

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)_presenter gateway:(id<TaskGatewayProtocol>)_gateway andTask:(Task *)task {
    self = [super init];
    if (self) {
        //        presenter = _presenter;
        //        taskGateway = _taskGateway;
    }
    return self;
}



@end
