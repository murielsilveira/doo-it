//
//  TaskGatewayDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskGatewayDouble.h"

@interface TaskGatewayDouble ()

@property (nonatomic) NSMutableArray *tasks;

@end

@implementation TaskGatewayDouble

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tasks = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)tasks {
    return _tasks;
}

- (void)addTask:(Task*)task {
    [_tasks addObject:task];
}

@end
