//
//  DetailTaskPresenterSpy.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 31/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskPresenterSpy.h"

@implementation DetailTaskPresenterSpy

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.presentTaskCalled = NO;
        self.presentBlankStateCalled = NO;
    }
    return self;
}

- (void)presentBlankState {
    self.presentBlankStateCalled = YES;
}

- (void)presentDetailsForTask {
    self.presentTaskCalled = YES;
}

@end
