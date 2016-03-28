//
//  TaskGatewayTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TaskGatewayDouble.h"

@interface TaskGatewayTests : XCTestCase

@end

@implementation TaskGatewayTests

TaskGatewayDouble *gateway;

- (void)setUp {
    [super setUp];
    gateway = [[TaskGatewayDouble alloc] init];
}

- (void)testGatewayReturnsEmptyArray {
    NSDate *initialDate = [NSDate date];
    NSDate *finalDate = [NSDate date];
    NSArray *tasks = [gateway tasksFrom:initialDate to:finalDate];
    XCTAssertNotNil(tasks, @"tasks should be not nil");
    int tasksCount = [tasks count];
    XCTAssertEqual(tasksCount, 0, @"tasksCount should be 0");
}

@end
