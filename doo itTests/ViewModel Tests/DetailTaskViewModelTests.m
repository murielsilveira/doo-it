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

- (void)setUp{
    [super setUp];
    _presenterSpy = [[DetailTaskPresenterSpy alloc] init];
}

- (void)testViewModelPresentedBlankState {
    _viewModel = [[DetailTaskViewModel alloc] initWithPresenter:_presenterSpy andTask:nil];
    [_viewModel detailTask];
    XCTAssertTrue(_presenterSpy.presentBlankStateCalled);
}

- (void)testViewModelPresentedTaskDetails {
    Task *task = [[Task alloc] initWithTitle:@"Task"];
    _viewModel = [[DetailTaskViewModel alloc] initWithPresenter:_presenterSpy andTask:task];
    [_viewModel detailTask];
    XCTAssertTrue(_presenterSpy.presentTaskCalled);
}

@end
