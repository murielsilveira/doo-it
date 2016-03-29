//
//  TaskGatewayDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskGatewayDouble.h"

@implementation TaskGatewayDouble

NSMutableArray *tasks;

- (instancetype)init
{
    self = [super init];
    if (self) {
        tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)tasks {
    return tasks;
}

- (void)addTask:(Task*)task {
    [tasks addObject:task];
}

@end
