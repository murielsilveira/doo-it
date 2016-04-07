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
    self.presenterSpy = [[ListTasksPresenterSpy alloc] init];
    self.taskGateway = [[TaskGatewayDouble alloc] init];
    self.viewModel = [[ListTasksViewModel alloc] initWithPresenter:self.presenterSpy andGateway:self.taskGateway];
}

- (void)addOneTaskToGatewayHelper {
    Markdown *task1 = [[Markdown alloc] init];
    [_taskGateway saveTask:task1];
}

- (void)addTwoTasksToGatewayHelper {
    Markdown *task1 = [[Markdown alloc] init];
    [_taskGateway saveTask:task1];
    Markdown *task2 = [[Markdown alloc] init];
    [_taskGateway saveTask:task2];
}

- (void)testViewModelPresentedBlankState {
    [self.viewModel presentListOfTasks];
    XCTAssertTrue(_presenterSpy.presentBlankStateCalled);
}

- (void)testViewModelPresentedOneTask {
    [self addOneTaskToGatewayHelper];
    [self.viewModel presentListOfTasks];
    XCTAssertTrue(self.presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([self.viewModel numberOfTasksToPresent], 1);
}

- (void)testViewModelPresentedTwoTasks {
    [self addTwoTasksToGatewayHelper];
    [self.viewModel presentListOfTasks];
    XCTAssertTrue(self.presenterSpy.presentListOfTasksCalled);
    XCTAssertEqual([self.viewModel numberOfTasksToPresent], 2);
}

- (void)testViewModelReturnsFirstTaskForPositionZero {
    [self addTwoTasksToGatewayHelper];
    [self.viewModel presentListOfTasks];
    XCTAssertTrue(self.presenterSpy.presentListOfTasksCalled);
}

- (void)testViewModelReturnsSecondTaskForPositionOne {
    [self addTwoTasksToGatewayHelper];
    [self.viewModel presentListOfTasks];
    XCTAssertTrue(self.presenterSpy.presentListOfTasksCalled);
}

@end
