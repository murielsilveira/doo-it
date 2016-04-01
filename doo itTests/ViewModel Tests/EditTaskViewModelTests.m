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

@property Task *taskForEditing;
@property EditTaskViewModel *viewModel;
@property TaskGatewayDouble *taskGateway;
@property EditTaskPresenterSpy *presenterSpy;

@end

@implementation EditTaskViewModelTests

- (void)setUp {
    [super setUp];
    self.taskGateway = [[TaskGatewayDouble alloc] init];
    self.presenterSpy = [[EditTaskPresenterSpy alloc]init];
    self.taskForEditing = nil;
}

- (void)initViewModelHelper {
    self.viewModel = [[EditTaskViewModel alloc] initWithPresenter:self.presenterSpy gateway:self.taskGateway andTask:self.taskForEditing];
}

//- (void)testViewModelPresentedEmptyTaskForEdition {
//    self.taskForEditing = nil;
//    [self initViewModelHelper];
//    [self.viewModel prepareTaskFormForEditing];
//    XCTAssertTrue(self.presenterSpy.presentEmptyTaskForEditionCalled);
//}
//
//- (void)testViewModelPresentedExistingTaskForEdition {
//    self.taskForEditing = [[Task alloc]initWithTitle:@"Task"];
//    [self initViewModelHelper];
//    [self.viewModel prepareTaskFormForEditing];
//    XCTAssertTrue(self.presenterSpy.presentTaskForEditionCalled);
//}
//
//- (void) testViewModelSavedNewTaskAndPresentedSuccessMessage {
//    [self initViewModelHelper];
//    Task *newTask = [[Task alloc]initWithTitle:@"Task"];
//    [self.viewModel saveTask];
//    XCTAssertTrue(self.presenterSpy.presentSuccesMessageForSavingTaskCalled);
//    XCTAssertEqual([[self.taskGateway tasks] count], 1);
//}
//
//- (void) testViewModelSavedExistingTaskAndPresentedSuccessMessage {
//    Task *task = [[Task alloc]initWithTitle:@"Task"];
//    [self.taskGateway saveTask:task];
//    self.taskForEditing = task;
//    [self initViewModelHelper];
//    [self.viewModel saveTask];
//    XCTAssertTrue(self.presenterSpy.presentSuccesMessageForSavingTaskCalled);
//    XCTAssertEqual([[self.taskGateway tasks] count], 1);
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
