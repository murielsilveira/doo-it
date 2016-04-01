//
//  TaskGatewayTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskGatewayDouble.h"
#import "Task.h"

@interface TaskGatewayTests : XCTestCase
@property TaskGatewayDouble *gateway;
@end

@implementation TaskGatewayTests

- (void)setUp {
    [super setUp];
    self.gateway = [[TaskGatewayDouble alloc] init];
}

- (void)testGatewayIsEmpty {
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 0);
}

- (void)testGatewayHasOneTasks {
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

- (void)testGatewayHasTwoTasks {
    Task *task1 = [[Task alloc] initWithTitle:@"Test1"];
    [self.gateway saveTask:task1];
    Task *task2 = [[Task alloc] initWithTitle:@"Test2"];
    [self.gateway saveTask:task2];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 2);
}

- (void)testGatewayDoNotDuplicateObjects {
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [self.gateway saveTask:task];
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

- (void)testGatewayUpdatesExistingTaskInformation {
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [self.gateway saveTask:task];
    task.taskTitle = @"TestModified";
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
    Task *savedTask = tasks[0];
    XCTAssertEqual(task.taskTitle, savedTask.taskTitle);
}

@end
