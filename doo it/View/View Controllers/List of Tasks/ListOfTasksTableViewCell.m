//
//  ListOfTasksTableViewCell.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "ListOfTasksTableViewCell.h"

@implementation ListOfTasksTableViewCell

-(void)awakeFromNib {
    [super awakeFromNib];
    [self setLayoutMargins:UIEdgeInsetsZero];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if(selected)
        self.backgroundColor = [UIColor groupTableViewBackgroundColor];
    else
        self.backgroundColor = [UIColor whiteColor];
}

@end
