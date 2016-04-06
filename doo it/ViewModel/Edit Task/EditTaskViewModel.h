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

@property Markdown *task;

- (instancetype)initWithPresenter:(id<EditTaskPresenterProtocol>)presenter gateway:(id<MarkdownGatewayProtocol>)taskGateway andTask:(Markdown*)task;
- (void)prepareTaskFormForEditing;
- (void)saveTask;

@end
