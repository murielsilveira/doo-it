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

@property ListTasksViewModel *viewModel;
@property ListTasksPresenterSpy *presenterSpy;
@property TaskGatewayDouble *taskGateway;

@end

@implementation ListTasksViewModelTests

- (void)setUp {
    [super setUp];
    _presenterSpy = [[ListTasksPresenterSpy alloc] init];
    _taskGateway = [[TaskGatewayDouble alloc] init];
    _viewModel = [[ListTasksViewModel alloc] initWithPresenter:_presenterSpy andGateway:_taskGateway];
}

- (void)addOneTaskToGatewayHelper {
    Task *task1 = [[Task alloc] initWithTitle:@"Task"];
    [_taskGateway addTask:task1];
}

- (void)addTwoTasksToGatewayHelper {
    Task *task1 = [[Task alloc] initWithTitle:@"Task1"];
    [_taskGateway addTask:task1];
    Task *task2 = [[Task alloc] initWithTitle:@"Task2"];
    [_taskGateway addTask:task2];
}

- (void)testViewModelPresentedBlankState {
    [_viewModel presentTasks];
    XCTAssertTrue(_presenterSpy.presentBlankStateCalled);
}

- (void)testViewModelPresentedOneTask {
    [self addOneTaskToGatewayHelper];
    [_viewModel presentTasks];
    XCTAssertTrue(_presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([_viewModel numberOfTasksToPresent], 1);
}

- (void)testViewModelPresentedTwoTasks {
    [self addTwoTasksToGatewayHelper];
    [_viewModel presentTasks];
    XCTAssertTrue(_presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([_viewModel numberOfTasksToPresent], 2);
}

- (void)testViewModelReturnsFirstTaskForPositionZero {
    [self addTwoTasksToGatewayHelper];
    Task *task = [_viewModel taskForRow:0 inSection:0];
    XCTAssertEqual(task.taskTitle, @"Task1");
}

- (void)testViewModelReturnsSecondTaskForPositionOne {
    [self addTwoTasksToGatewayHelper];
    Task *task = [_viewModel taskForRow:1 inSection:0];
    XCTAssertEqual(task.taskTitle, @"Task2");
}

@end
