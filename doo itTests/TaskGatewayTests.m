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
    NSDate *initialDate = [NSDate date];
    NSDate *finalDate = [NSDate date];
    int tasksCount = [gateway numberOfTasksFrom:initialDate to:finalDate];
    XCTAssertEqual(tasksCount, 0);
}

- (void)testGatewayReturnsOneAfterAddingTask {
    NSDate *initialDate = [NSDate date];
    NSDate *finalDate = [NSDate date];
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [gateway addTask:task];
    int tasksCount = [gateway numberOfTasksFrom:initialDate to:finalDate];
    
    XCTAssertEqual(tasksCount, 1);
}

@end
