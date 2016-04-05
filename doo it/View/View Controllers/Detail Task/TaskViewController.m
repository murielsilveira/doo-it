//
//  DetailTaskViewController.m
//  doo it
//
//  Created by Ricardo Gehrke Filho on 27/03/16.
//  Copyright © 2016 Ricardo Gehrke Filho. All rights reserved.
//

#import "TaskViewController.h"
#import "MarkdownGatewayFactory.h"
#import "MarkdownGatewayProtocol.h"
#import "Colors.h"
#import "UIColor+Tools.h"
#import "NSAttributedStringMarkdownParser.h"

@interface TaskViewController ()

@property DetailTaskViewModel *detailTaskViewModel;
@property EditTaskViewModel *editTaskViewModel;

@property (weak, nonatomic) IBOutlet UITextView *taskDescriptionTextView;
@property (weak, nonatomic) IBOutlet UIView *toolsView;
@property BOOL editing;

@property NSAttributedStringMarkdownParser *parser;

@end

@implementation TaskViewController

- (void)prepareViewModelWithTask:(Markdown *)task {
    self.detailTaskViewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
    id<MarkdownGatewayProtocol> gateway = [MarkdownGatewayFactory create];
    self.editTaskViewModel = [[EditTaskViewModel alloc] initWithPresenter:self gateway:gateway andTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.editing = NO;
    [self presentBlankState];
    self.parser = [[NSAttributedStringMarkdownParser alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(self.splitViewController.collapsed){
        self.navigationController.navigationBar.translucent = NO;
    }
    [self.detailTaskViewModel showDetailTask];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if(self.splitViewController.collapsed){
        self.navigationController.navigationBar.translucent = YES;
    }
}

- (void)presentBlankState {
    self.toolsView.backgroundColor = [UIColor whiteColor];
    self.taskDescriptionTextView.text = @"";
}

- (void)presentDetailsForTask {
    UIColor *color = [UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor];
    self.navigationController.navigationBar.tintColor = color;
    self.toolsView.backgroundColor = color;
    NSAttributedString *attributedString = [self.parser attributedStringFromMarkdownString:self.detailTaskViewModel.task.markdownString];
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
    self.taskDescriptionTextView.attributedText = mutableAttributedString;
}

- (void)presentEditionForTask {
    self.editing = YES;
    self.taskDescriptionTextView.userInteractionEnabled = YES;
    self.taskDescriptionTextView.text = self.detailTaskViewModel.task.markdownString;
    self.taskDescriptionTextView.font = [UIFont systemFontOfSize:20];
}

- (void)presentEmptyTaskForEdition {
    
}

- (void)presentSuccesMessageForSavingTask {
    self.editing = NO;
    self.taskDescriptionTextView.userInteractionEnabled = NO;
    NSString *description = self.detailTaskViewModel.task.markdownString;
    NSAttributedStringMarkdownParser* parser = [[NSAttributedStringMarkdownParser alloc] init];
    NSAttributedString *attributedString = [parser attributedStringFromMarkdownString:description];
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc]initWithAttributedString:attributedString];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor] range:NSMakeRange(0, mutableAttributedString.length)];
    self.taskDescriptionTextView.attributedText = mutableAttributedString;
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
