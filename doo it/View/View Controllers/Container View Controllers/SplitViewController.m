//
//  SplitViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 25/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "SplitViewController.h"
#import "Colors.h"

@interface SplitViewController ()

@end

@implementation SplitViewController

-(void)viewDidLoad {
    self.preferredDisplayMode = UISplitViewControllerDisplayModeAllVisible;
    self.delegate = self;
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
}

- (BOOL)splitViewController:(UISplitViewController *)splitViewController collapseSecondaryViewController:(UIViewController *)secondaryViewController ontoPrimaryViewController:(UIViewController *)primaryViewController {
    return YES;
}

@end
