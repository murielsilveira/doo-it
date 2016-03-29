//
//  ListTasksViewModelTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskGatewayDouble.h"
#import "ListTasksViewModel.h"
#import "ListTasksPresenterProtocol.h"
#import "ListTasksPresenterDouble.h"

@interface ListTasksViewModelTests : XCTestCase
@end

@implementation ListTasksViewModelTests

ListTasksViewModel *viewModel;
ListTasksPresenterDouble *presenterDouble;
TaskGatewayDouble *taskGateway;

- (void)setUp {
    [super setUp];
    presenterDouble = [[ListTasksPresenterDouble alloc] init];
    taskGateway = [[TaskGatewayDouble alloc] init];
    viewModel = [[ListTasksViewModel alloc] initWithPresenter:presenterDouble andGateway:taskGateway];
}

- (void)testViewModelPresentedBlankState {
    [viewModel presentListOfTasks];
    XCTAssertTrue(presenterDouble.presentBlankStateCalled);
}

- (void)testViewModelPresentedListOfTasks {
    Task *task = [[Task alloc] initWithTitle:@"Task"];
    [taskGateway addTask:task];
    [viewModel presentListOfTasks];
    XCTAssertTrue(presenterDouble.presentListOfTasksCalled);
}

@end
