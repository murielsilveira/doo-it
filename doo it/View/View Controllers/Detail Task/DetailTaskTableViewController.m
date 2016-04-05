//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "DetailTaskTableViewController.h"
#import "Colors.h"
#import "UIColor+Tools.h"

@interface DetailTaskTableViewController ()

@property DetailTaskViewModel *detailTaskViewModel;
@property EditTaskViewModel *editTaskViewModel;

@property (weak, nonatomic) IBOutlet UITextView *taskTitleTextView;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property BOOL editing;

@end

@implementation DetailTaskTableViewController

- (void)prepareViewModelWithTask:(Task *)task {
    self.detailTaskViewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.editing = NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.detailTaskViewModel showDetailTask];
}

- (void)presentBlankState {
    self.taskTitleTextView.text = @"";
}

- (void)presentDetailsForTask {
    self.taskTitleTextView.textColor = [UIColor colorWithHexString:self.detailTaskViewModel.task.color];
    self.taskDescriptionLabel.textColor = [UIColor colorWithHexString:self.detailTaskViewModel.task.color];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:self.detailTaskViewModel.task.color];
    self.taskTitleTextView.text = self.detailTaskViewModel.task.taskTitle;
}

- (IBAction)editTapped:(id)sender {
    if(self.editing){
        self.editing = NO;
        self.navigationItem.rightBarButtonItem.title = @"Edit";
        self.taskTitleTextView.userInteractionEnabled = NO;
    }else{
        self.editing = YES;
        self.navigationItem.rightBarButtonItem.title = @"Done";
        self.taskTitleTextView.userInteractionEnabled = YES;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
    {
        CGFloat maxLabelWidth = self.tableView.frame.size.width;
        CGSize neededSize = [self.taskTitleTextView sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
        return neededSize.height + 8;
    }else{
        CGFloat maxLabelWidth = self.tableView.frame.size.width - 16;
        CGSize neededSize = [self.taskDescriptionLabel sizeThatFits:CGSizeMake(maxLabelWidth, CGFLOAT_MAX)];
        return neededSize.height + 8;
    }
}

@end
