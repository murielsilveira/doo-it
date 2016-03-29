//
//  ListTasksPresenterDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListTasksPresenterDouble.h"

@implementation ListTasksPresenterDouble

- (instancetype)init
{
    self = [super init];
    if (self) {
        _presentBlankStateCalled = NO;
        _presentListOfTasksCalled = NO;
    }
    return self;
}

- (void)presentListOfTasks:(NSArray *)tasks {
    _presentListOfTasksCalled = YES;
}

- (void)presentBlankState {
    _presentBlankStateCalled = YES;
}

@end