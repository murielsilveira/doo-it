//
//  ListTasksViewModel.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListTasksPresenterProtocol.h"
#import "TaskGatewayProtocol.h"

@interface ListTasksViewModel : NSObject

- (instancetype)initWithPresenter:(id<ListTasksPresenterProtocol>)_presenter andGateway:(id<TaskGatewayProtocol>)_gateway;
- (void)presentListOfTasks;

@end