//
//  TaskGatewayDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskGatewayDouble.h"

@implementation TaskGatewayDouble

- (instancetype)init
{
    self = [super init];
    if (self) {
        tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

NSMutableArray *tasks;

- (NSArray *)tasksFrom:(NSDate *)initialDate to:(NSDate *)finalDate {
    return tasks;
}

- (void)addTask:(Task*)task {
    [tasks addObject:task];
}

- (int)numberOfTasksFrom:(NSDate*)initialDate to:(NSDate*)finalDate {
    return [tasks count];
}

@end
