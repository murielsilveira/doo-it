//
//  ListTasksViewModel.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListTasksViewModel.h"

@implementation ListTasksViewModel

id<ListTasksPresenterProtocol> presenter;
id<TaskGatewayProtocol> taskGateway;

- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)_presenter andGateway:(id<TaskGatewayProtocol>)_taskGateway
{
    self = [super init];
    if (self) {
        presenter = _presenter;
        taskGateway = _taskGateway;
    }
    return self;
}

-(void) presentTasks {
    if([taskGateway tasks].count == 0) {
        [presenter presentBlankState];
    }else{
        [presenter presentListOfTasks];
    }
}

- (int)numberOfTasksToPresent{
    return [taskGateway tasks].count;
}

- (Task*)taskForRow:(NSInteger)row inSection:(NSInteger)section; {
    NSArray *tasksArray = [taskGateway tasks];
    return tasksArray[row];
}

@end
