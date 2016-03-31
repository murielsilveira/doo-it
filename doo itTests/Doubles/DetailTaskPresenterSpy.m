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
        _presentTaskCalled = NO;
        _presentBlankStateCalled = NO;
    }
    return self;
}

- (void)presentBlankState {
    _presentBlankStateCalled = YES;
}

- (void)presentTask:(Task*)task {
    _presentTaskCalled = YES;
}

@end
