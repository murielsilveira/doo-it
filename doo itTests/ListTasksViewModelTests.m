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
#import "ListTasksPresenterSpy.h"

@interface ListTasksViewModelTests : XCTestCase
@end

@implementation ListTasksViewModelTests

ListTasksViewModel *viewModel;
ListTasksPresenterSpy *presenterSpy;
TaskGatewayDouble *taskGateway;

- (void)setUp {
    [super setUp];
    presenterSpy = [[ListTasksPresenterSpy alloc] init];
    taskGateway = [[TaskGatewayDouble alloc] init];
    viewModel = [[ListTasksViewModel alloc] initWithPresenter:presenterSpy andGateway:taskGateway];
}

- (void)addOneTaskToGatewayHelper {
    Task *task1 = [[Task alloc] initWithTitle:@"Task"];
    [taskGateway addTask:task1];
}

- (void)addTwoTasksToGatewayHelper {
    Task *task1 = [[Task alloc] initWithTitle:@"Task1"];
    [taskGateway addTask:task1];
    Task *task2 = [[Task alloc] initWithTitle:@"Task2"];
    [taskGateway addTask:task2];
}

- (void)testViewModelPresentedBlankState {
    [viewModel presentTasks];
    XCTAssertTrue(presenterSpy.presentBlankStateCalled);
}

- (void)testViewModelPresentedOneTask {
    [self addOneTaskToGatewayHelper];
    [viewModel presentTasks];
    XCTAssertTrue(presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([viewModel numberOfTasksToPresent], 1);
}

- (void)testViewModelPresentedTwoTasks {
    [self addTwoTasksToGatewayHelper];
    [viewModel presentTasks];
    XCTAssertTrue(presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([viewModel numberOfTasksToPresent], 2);
}

- (void)testViewModelReturnsFirstTaskForPositionZero {
    [self addTwoTasksToGatewayHelper];
    Task *task = [viewModel taskForRow:0 inSection:0];
    XCTAssertEqual(task.taskTitle, @"Task1");
}

- (void)testViewModelReturnsSecondTaskForPositionOne {
    [self addTwoTasksToGatewayHelper];
    Task *task = [viewModel taskForRow:1 inSection:0];
    XCTAssertEqual(task.taskTitle, @"Task2");
}

@end
