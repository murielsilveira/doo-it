//
//  EditTaskPresenterSpy.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "EditTaskPresenterSpy.h"

@implementation EditTaskPresenterSpy

- (instancetype)init
{
    self = [super init];
    if (self) {
        _presentTaskForEditionCalled = NO;
        _presentEmptyTaskForEditionCalled = NO;
    }
    return self;
}

- (void)presentEmptyTaskForEdition {
    _presentEmptyTaskForEditionCalled = YES;
}

- (void)presentTaskForEdition:(NSString*)taskTitle {
    _presentTaskForEditionCalled = YES;
}

@end
