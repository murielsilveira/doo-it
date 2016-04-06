//
//  TaskGatewayTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskGatewayDouble.h"
#import "Markdown.h"

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
    Markdown *task = [[Markdown alloc] init];
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

- (void)testGatewayHasTwoTasks {
    Markdown *task1 = [[Markdown alloc] init];
    [self.gateway saveTask:task1];
    Markdown *task2 = [[Markdown alloc] init];
    [self.gateway saveTask:task2];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 2);
}

- (void)testGatewayDoNotDuplicateObjects {
    Markdown *task = [[Markdown alloc] init];
    [self.gateway saveTask:task];
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

- (void)testGatewayUpdatesExistingTaskInformation {
    Markdown *task = [[Markdown alloc] init];
    [self.gateway saveTask:task];
    [self.gateway saveTask:task];
    NSArray *tasks = [self.gateway tasks];
    XCTAssertEqual(tasks.count, 1);
}

@end
