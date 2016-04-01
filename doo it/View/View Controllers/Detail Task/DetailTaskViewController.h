//
//  DetailTaskViewController.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTaskPresenterProtocol.h"

@interface DetailTaskViewController : UIViewController <DetailTaskPresenterProtocol>

- (void)createViewModelForTask:(Task*)task;

@end
