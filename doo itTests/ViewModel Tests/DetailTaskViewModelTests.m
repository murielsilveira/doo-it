//
//  DetailTaskViewModelTests.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DetailTaskViewModel.h"
#import "DetailTaskPresenterSpy.h"

@interface DetailTaskViewModelTests : XCTestCase

@property DetailTaskViewModel *viewModel;
@property DetailTaskPresenterSpy *presenterSpy;

@end

@implementation DetailTaskViewModelTests

//- (void)setUp{
//    [super setUp];
//    self.presenterSpy = [[DetailTaskPresenterSpy alloc] init];
//}
//
//- (void)testViewModelPresentedBlankState {
//    self.viewModel = [[DetailTaskViewModel alloc] initWithPresenter:self.presenterSpy andTask:nil];
//    [self.viewModel showDetailTask];
//    XCTAssertTrue(self.presenterSpy.presentBlankStateCalled);
//}
//
//- (void)testViewModelPresentedTaskDetails {
//    Task *task = [[Task alloc] initWithTitle:@"Task"];
//    self.viewModel = [[DetailTaskViewModel alloc] initWithPresenter:self.presenterSpy andTask:task];
//    [self.viewModel showDetailTask];
//    XCTAssertTrue(self.presenterSpy.presentTaskCalled);
//}

@end
