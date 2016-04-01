//
//  ListTasksPresenterDouble.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListTasksPresenterSpy.h"

@implementation ListTasksPresenterSpy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.presentBlankStateCalled = NO;
        self.presentListOfTasksCalled = NO;
    }
    return self;
}

- (void)presentListOfTasks {
    self.presentListOfTasksCalled = YES;
}

- (void)presentBlankState {
    self.presentBlankStateCalled = YES;
}

@end
