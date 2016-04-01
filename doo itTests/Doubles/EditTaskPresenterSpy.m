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
        self.presentTaskForEditionCalled = NO;
        self.presentEmptyTaskForEditionCalled = NO;
        self.presentSuccesMessageForSavingTaskCalled = NO;
        self.presentErrorMessageForSavingTaskCalled = NO;
    }
    return self;
}

- (void)presentEmptyTaskForEdition {
    self.presentEmptyTaskForEditionCalled = YES;
}

- (void)presentEditionForTask {
    self.presentTaskForEditionCalled = YES;
}

- (void)presentSuccesMessageForSavingTask {
    self.presentSuccesMessageForSavingTaskCalled = YES;
}

- (void)presentErrorMessageForSavingTask:(NSString*)message {
    self.presentErrorMessageForSavingTaskCalled = YES;
}


@end
