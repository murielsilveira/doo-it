//
//  BaseNavigationController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 02/04/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "BaseNavigationController.h"
#import "Colors.h"

@interface BaseNavigationController ()

@property UIImageView *navBarHairlineImageView;

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self removeBottomLineAtNavigationBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navBarHairlineImageView.hidden = YES;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.navBarHairlineImageView.hidden = NO;
}

- (void)removeBottomLineAtNavigationBar {
    self.navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationBar];
}

- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
