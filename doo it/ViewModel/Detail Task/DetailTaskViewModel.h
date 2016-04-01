//
//  DetailTaskViewModel.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 30/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailTaskPresenterProtocol.h"
#import "Task.h"

@interface DetailTaskViewModel : NSObject

- (instancetype)initWithPresenter:(id<DetailTaskPresenterProtocol>)presenter andTask:(Task*)task;
- (void)showDetailTask;

@end
