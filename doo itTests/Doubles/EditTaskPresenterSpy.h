//
//  EditTaskPresenterSpy.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EditTaskPresenterProtocol.h"

@interface EditTaskPresenterSpy : NSObject <EditTaskPresenterProtocol>

@property BOOL presentEmptyTaskForEditionCalled;
@property BOOL presentTaskForEditionCalled;
@property BOOL presentSuccesMessageForSavingTaskCalled;
@property BOOL presentErrorMessageForSavingTaskCalled;

@end
