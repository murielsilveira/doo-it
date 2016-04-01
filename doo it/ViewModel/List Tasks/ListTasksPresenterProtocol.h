//
//  ListTasksPresenterProtocol.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTaskViewModel.h"

@protocol ListTasksPresenterProtocol <NSObject>

- (void)presentListOfTasks;
- (void)presentBlankState;

@end
