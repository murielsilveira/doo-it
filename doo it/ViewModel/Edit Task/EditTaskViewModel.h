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

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)_presenter andGateway:(id<TaskGatewayProtocol>)_gateway;
- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)_presenter gateway:(id<TaskGatewayProtocol>)_gateway andTask:(Task*)task;

@end
