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
id<TaskGatewayProtocol> gateway;


- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)_presenter andGateway:(id<TaskGatewayProtocol>)_gateway
{
    self = [super init];
    if (self) {
        presenter = _presenter;
        gateway = _gateway;
    }
    return self;
}

-(void) presentListOfTasks {
    if([gateway numberOfTasks] == 0) {
        [presenter presentBlankState];
    }else{
        [presenter presentListOfTasks:[gateway tasks]];
    }
}

@end
