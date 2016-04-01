//
//  EditTaskViewModel.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TaskGatewayDouble.h"
#import "EditTaskPresenterProtocol.h"

@interface EditTaskViewModel : NSObject

@property Task *task;

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)presenter gateway:(id<TaskGatewayProtocol>)taskGateway andTask:(Task*)task;
- (void)prepareTaskFormForEditing;
- (void)saveTask;

@end
