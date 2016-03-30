//
//  EditTaskViewModelTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "EditTaskViewModel.h"
#import "EditTaskPresenterSpy.h"

@interface EditTaskViewModelTests : XCTestCase

@property EditTaskViewModel *viewModel;
@property TaskGatewayDouble *taskGateway;
@property EditTaskPresenterSpy *presenterSpy;

@end

@implementation EditTaskViewModelTests

- (void)setUp {
    [super setUp];
    _taskGateway = [[TaskGatewayDouble alloc] init];
    _presenterSpy = [[EditTaskPresenterSpy alloc]init];
}

- (void)testViewModelPresentedEmptyTaskForEdition {
    _viewModel = [[EditTaskViewModel alloc] initWithPresenter:_presenterSpy gateway:_taskGateway andTask:nil];
    [_viewModel presentTaskForEditing];
    XCTAssertTrue(_presenterSpy.presentEmptyTaskForEditionCalled);
}

- (void)testViewModelPresentedExistingTaskForEdition {
    Task *task = [[Task alloc]initWithTitle:@"Task"];
    _viewModel = [[EditTaskViewModel alloc] initWithPresenter:_presenterSpy gateway:_taskGateway andTask:task];
    [_viewModel presentTaskForEditing];
    XCTAssertTrue(_presenterSpy.presentTaskForEditionCalled);
}

- (void) testViewModelSavedNewTaskAndPresentedSuccessMessage {
    Task *task = [[Task alloc]initWithTitle:@"Task"];
    _viewModel = [[EditTaskViewModel alloc] initWithPresenter:_presenterSpy gateway:_taskGateway andTask:nil];
    [_viewModel saveTask:task];
    XCTAssertTrue(_presenterSpy.presentSuccesMessageForSavingTaskCalled);
    XCTAssertEqual([[_taskGateway tasks] count], 1);
}

//- (void) testViewModelSavedExistingTaskAndPresentedSuccessMessage {
//    
//}
//
//- (void) testViewModelDidNotSaveNewTaskAndPresentedErrorMessage {
//    Task *task = [[Task alloc]initWithTitle:@""];
//    _viewModel = [[EditTaskViewModel alloc] initWithPresenter:_presenterSpy gateway:_taskGateway andTask:nil];
//    [_viewModel saveTask:task];
//    XCTAssertTrue(_presenterSpy.presentErrorMessageForSavingTaskCalled);
//    XCTAssertEqual([[_taskGateway tasks] count], 0);
//}

@end
