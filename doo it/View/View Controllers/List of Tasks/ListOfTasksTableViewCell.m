//
//  ListOfTasksTableViewCell.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListOfTasksTableViewCell.h"
#import "Colors.h"

@interface ListOfTasksTableViewCell ()

@property UIColor *taskColor;

@end

@implementation ListOfTasksTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setLayoutMargins:UIEdgeInsetsZero];
}

- (void)setColor:(UIColor*)color {
    self.taskColor = color;
    self.taskTitleLabel.textColor = color;
    self.colorView.backgroundColor = color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if(selected)
        self.backgroundColor = [self.taskColor colorWithAlphaComponent:0.05];
    else
        self.backgroundColor = [UIColor whiteColor];
}

@end
