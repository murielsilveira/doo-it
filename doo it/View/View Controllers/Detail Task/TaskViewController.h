//
//  DetailTaskViewController.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTaskPresenterProtocol.h"
#import "EditTaskPresenterProtocol.h"
#import "DetailTaskViewModel.h"
#import "EditTaskViewModel.h"

@interface TaskViewController : UIViewController <DetailTaskPresenterProtocol, EditTaskPresenterProtocol>

- (void)prepareViewModelWithTask:(Markdown*)task;

@end
