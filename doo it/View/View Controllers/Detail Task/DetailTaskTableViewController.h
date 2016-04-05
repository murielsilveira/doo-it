//
//  DetailTaskViewController.h
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailTaskPresenterProtocol.h"
#import "DetailTaskViewModel.h"

@interface DetailTaskTableViewController : UITableViewController <DetailTaskPresenterProtocol>

@property DetailTaskViewModel *viewModel;

- (void)prepareViewModelWithTask:(Task*)task;

@end