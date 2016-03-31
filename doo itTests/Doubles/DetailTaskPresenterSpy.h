//
//  DetailTaskPresenterSpy.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 31/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTaskPresenterProtocol.h"

@interface DetailTaskPresenterSpy : NSObject<DetailTaskPresenterProtocol>

@property BOOL presentBlankStateCalled;
@property BOOL presentTaskCalled;

@end
