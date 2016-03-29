//
//  ListTasksViewModel.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListTasksViewModel.h"

@interface ListTasksViewModel ()

@property id<ListTasksPresenterProtocol> presenter;
@property id<TaskGatewayProtocol> taskGateway;

@end

@implementation ListTasksViewModel


- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)presenter andGateway:(id<TaskGatewayProtocol>)taskGateway
{
    self = [super init];
    if (self) {
        self.presenter = presenter;
        self.taskGateway = taskGateway;
    }
    return self;
}

-(void) presentTasks {
    if([self.taskGateway tasks].count == 0) {
        [self.presenter presentBlankState];
    }else{
        [self.presenter presentListOfTasks];
    }
}

- (int)numberOfTasksToPresent{
    return [self.taskGateway tasks].count;
}

- (Task*)taskForRow:(NSInteger)row inSection:(NSInteger)section; {
    NSArray *tasksArray = [self.taskGateway tasks];
    return tasksArray[row];
}

@end
