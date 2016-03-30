//
//  EditTaskViewController.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EditTaskPresenterProtocol.h"

@interface EditTaskViewController : UIViewController <EditTaskPresenterProtocol>

@property Task *task;

@end
