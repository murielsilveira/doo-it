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
@property (weak, nonatomic) IBOutlet UIButton *deepOrangeButton;
@property (weak, nonatomic) IBOutlet UIButton *lightBlueButton;
@property (weak, nonatomic) IBOutlet UIButton *amberButton;

@property NSAttributedStringMarkdownParser *parser;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolsViewHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolsViewBottomLayoutConstraint;

@end

@implementation TaskViewController

- (void)prepareViewModelWithTask:(Markdown *)task {
    self.detailTaskViewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
    id<MarkdownGatewayProtocol> gateway = [MarkdownGatewayFactory create];
    self.editTaskViewModel = [[EditTaskViewModel alloc] initWithPresenter:self gateway:gateway andTask:task];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self presentBlankState];
    self.parser = [[NSAttributedStringMarkdownParser alloc] init];
    UIImage *img = [self.deepOrangeButton.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.deepOrangeButton.tintColor = [Colors deepOrange];
    [self.deepOrangeButton setImage:img forState:UIControlStateNormal];
    self.lightBlueButton.tintColor = [Colors lightBlue];
    [self.lightBlueButton setImage:img forState:UIControlStateNormal];
    self.amberButton.tintColor = [Colors amber];
    [self.amberButton setImage:img forState:UIControlStateNormal];
    self.toolsViewHeightLayoutConstraint.constant = 8;
    self.amberButton.hidden = YES;
    self.lightBlueButton.hidden = YES;
    self.deepOrangeButton.hidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    [self moveControls:notification up:YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    [self moveControls:notification up:NO];
}

- (void)moveControls:(NSNotification*)notification up:(BOOL)up {
    NSDictionary* userInfo = [notification userInfo];
    [self animateControls:userInfo up:up];
}

- (void)animateControls:(NSDictionary*)userInfo up:(BOOL)up{
    NSTimeInterval duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGRect kbFrame = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    if(up)
        self.toolsViewBottomLayoutConstraint.constant = kbFrame.size.height;
    else
        self.toolsViewBottomLayoutConstraint.constant = 0;
    
    [self.toolsView layoutIfNeeded];
    [UIView animateWithDuration:duration
                          delay:0
                        options:animationOptionsWithCurve(animationCurve)
                     animations:^{
                         [self.toolsView layoutIfNeeded];
                     }
                     completion:^(BOOL finished){}];
}

static inline UIViewAnimationOptions animationOptionsWithCurve(UIViewAnimationCurve curve)
{
    return (UIViewAnimationOptions)curve << 16;
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
    self.editing = NO;
    self.navigationItem.rightBarButtonItem.title = @"";
    self.taskDescriptionTextView.text = @"";
}

- (void)presentDetailsForTask {
    self.navigationItem.rightBarButtonItem.title = @"Edit";
    UIColor *color = [UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor];
    [self setControlsToColor:color];
    NSAttributedString *attributedString = [self.parser attributedStringFromMarkdownString:self.detailTaskViewModel.task.markdownString];
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:attributedString];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, attributedString.length)];
    self.taskDescriptionTextView.attributedText = mutableAttributedString;
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
    NSString *markdownString = self.detailTaskViewModel.task.markdownString;
    NSAttributedString *attributedString = [self.parser attributedStringFromMarkdownString:markdownString];
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc]initWithAttributedString:attributedString];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor] range:NSMakeRange(0, mutableAttributedString.length)];
    self.taskDescriptionTextView.attributedText = mutableAttributedString;
}

- (void)presentErrorMessageForSavingTask:(NSString *)message {
    
}

- (void)setControlsToColor:(UIColor*)color {
    self.navigationController.navigationBar.tintColor = color;
    self.toolsView.backgroundColor = [color colorWithAlphaComponent:0.05];
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString: self.taskDescriptionTextView.attributedText];
    [mutableAttributedString removeAttribute:NSForegroundColorAttributeName range:NSMakeRange(0, mutableAttributedString.length)];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor] range:NSMakeRange(0, mutableAttributedString.length)];
    self.taskDescriptionTextView.attributedText = mutableAttributedString;
}

- (IBAction)editTapped:(id)sender {
    if(self.editing){
        Markdown *task = [self.detailTaskViewModel task];
        task.markdownString = self.taskDescriptionTextView.text;
        [self.editTaskViewModel setTask:task];
        [self.editTaskViewModel saveTask];
        
        [self.toolsView layoutIfNeeded];
        self.toolsViewHeightLayoutConstraint.constant = 8;
        self.deepOrangeButton.hidden = YES;
        self.lightBlueButton.hidden = YES;
        self.amberButton.hidden = YES;
        [UIView animateWithDuration:0.5 animations:^{
            [self.toolsView layoutIfNeeded];
        }];
    }else{
        [self.editTaskViewModel prepareTaskFormForEditing];
        
        [self.toolsView layoutIfNeeded];
        self.toolsViewHeightLayoutConstraint.constant = 44;
        [UIView animateWithDuration:0.5 animations:^{
            [self.toolsView layoutIfNeeded];
        } completion:^(BOOL finished){
            self.deepOrangeButton.hidden = NO;
            self.lightBlueButton.hidden = NO;
            self.amberButton.hidden = NO;
        }];
    }
}
- (IBAction)setToDeepOrangeColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors deepOrange] hexStringFromColor];
    [self setControlsToColor:[Colors deepOrange]];
}

- (IBAction)setToLightBlueColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors lightBlue] hexStringFromColor];
    [self setControlsToColor:[Colors lightBlue]];
}
- (IBAction)setToAmberColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors amber] hexStringFromColor];
    [self setControlsToColor:[Colors amber]];
}

@end
