//
//  DetailTaskPresenterProtocol.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 31/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@protocol DetailTaskPresenterProtocol <NSObject>

- (void)presentBlankState;
- (void)presentTask:(Task*)task;

@end
