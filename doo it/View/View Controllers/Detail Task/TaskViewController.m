//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskViewController.h"
#import "MarkdownGatewayFactory.h"
#import "Colors.h"
#import "UIColor+Tools.h"
#import "NSAttributedStringMarkdownParser.h"

@interface TaskViewController ()

@property DetailTaskViewModel *detailTaskViewModel;
@property EditTaskViewModel *editTaskViewModel;

@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property BOOL editing;

@end

@implementation TaskViewController

- (void)prepareViewModelWithTask:(Markdown *)task {
    self.detailTaskViewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
    self.editTaskViewModel = [[EditTaskViewModel alloc] initWithPresenter:self gateway:[MarkdownGatewayFactory create] andTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.editing = NO;
    [self presentBlankState];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.detailTaskViewModel showDetailTask];
}

- (void)presentBlankState {
    self.taskDescriptionTextView.text = @"";
    self.navigationItem.rightBarButtonItem.title = @"";
}

- (void)presentDetailsForTask {
    self.navigationItem.rightBarButtonItem.title = @"Edit";
    
    self.taskDescriptionTextView.textColor = [UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor];
    
    NSString *description = self.detailTaskViewModel.task.markdownString;
    NSAttributedStringMarkdownParser* parser = [[NSAttributedStringMarkdownParser alloc] init];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:[parser attributedStringFromMarkdownString:description]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor] range:NSMakeRange(0, attributedString.length)];
    self.taskDescriptionTextView.attributedText = attributedString;
}

- (void)presentEditionForTask {
    self.editing = YES;
    self.navigationItem.rightBarButtonItem.title = @"Done";
    self.taskDescriptionTextView.userInteractionEnabled = YES;
    self.taskDescriptionTextView.text = self.detailTaskViewModel.task.markdownString;
    self.taskDescriptionTextView.font = [UIFont systemFontOfSize:20];
}

- (void)presentEmptyTaskForEdition {
    
}

- (void)presentSuccesMessageForSavingTask {
    self.editing = NO;
    self.navigationItem.rightBarButtonItem.title = @"Edit";
    self.taskDescriptionTextView.userInteractionEnabled = NO;
    
    NSString *description = self.detailTaskViewModel.task.markdownString;
    NSAttributedStringMarkdownParser* parser = [[NSAttributedStringMarkdownParser alloc] init];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithAttributedString:[parser attributedStringFromMarkdownString:description]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor] range:NSMakeRange(0, attributedString.length)];
    self.taskDescriptionTextView.attributedText = attributedString;
}

- (void)presentErrorMessageForSavingTask:(NSString *)message {
    
}

- (IBAction)editTapped:(id)sender {
    if(self.editing){
        Markdown *task = [self.detailTaskViewModel task];
        task.markdownString = self.taskDescriptionTextView.text;
        [self.editTaskViewModel setTask:task];
        [self.editTaskViewModel saveTask];
    }else{
        [self.editTaskViewModel prepareTaskFormForEditing];
    }
}

@end
