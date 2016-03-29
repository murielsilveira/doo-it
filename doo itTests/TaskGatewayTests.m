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
@end

@implementation TaskGatewayTests

TaskGatewayDouble *gateway;

- (void)setUp {
    [super setUp];
    gateway = [[TaskGatewayDouble alloc] init];
}

- (void)testGatewayIsEmpty {
    NSArray *tasks = [gateway tasks];
    XCTAssertEqual(tasks.count, 0);
}

- (void)testGatewayHasOneTasks {
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [gateway addTask:task];
    NSArray *tasks = [gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

- (void)testGatewayHasTwoTasks {
    Task *task1 = [[Task alloc] initWithTitle:@"Test1"];
    [gateway addTask:task1];
    Task *task2 = [[Task alloc] initWithTitle:@"Test2"];
    [gateway addTask:task2];
    NSArray *tasks = [gateway tasks];
    XCTAssertEqual(tasks.count, 2);
}

@end
