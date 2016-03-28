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
    int tasksCount = [gateway numberOfTasks];
    XCTAssertEqual(tasksCount, 0);
}

- (void)testGatewayHasOneTaskAfterAdding {
    Task *task = [[Task alloc] initWithTitle:@"Test"];
    [gateway addTask:task];
    int tasksCount = [gateway numberOfTasks];
    
    XCTAssertEqual(tasksCount, 1);
}

@end
