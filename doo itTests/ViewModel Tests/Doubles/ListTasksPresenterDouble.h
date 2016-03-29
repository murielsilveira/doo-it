//
//  ListTasksPresenterDouble.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 28/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListTasksPresenterProtocol.h"

@interface ListTasksPresenterDouble : NSObject <ListTasksPresenterProtocol>

@property (nonatomic, readonly) BOOL presentListOfTasksCalled;
@property (nonatomic, readonly) BOOL presentBlankStateCalled;

@end
