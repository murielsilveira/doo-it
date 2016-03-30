//
//  EditTaskPresenterProtocol.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 29/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol EditTaskPresenterProtocol <NSObject>

- (void)presentTaskForEdition:(NSString*)taskTitle;
- (void)presentEmptyTaskForEdition;

@end
