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

@property UIImage *selectedButtonCheckedImage;
@property UIImage *unselectedButtonCheckedImage;

@property DetailTaskViewModel *detailTaskViewModel;
@property EditTaskViewModel *editTaskViewModel;
@property NSAttributedStringMarkdownParser *parser;
@property BOOL editing;

@property (weak, nonatomic) IBOutlet UITextView *markdownStringTextView;
@property (weak, nonatomic) IBOutlet UIView *toolsView;
@property (weak, nonatomic) IBOutlet UIButton *deepOrangeButton;
@property (weak, nonatomic) IBOutlet UIButton *lightBlueButton;
@property (weak, nonatomic) IBOutlet UIButton *amberButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolsViewHeightLayoutConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toolsViewBottomLayoutConstraint;

@end

@implementation TaskViewController

- (void)prepareViewModelWithTask:(Markdown *)task {
    self.detailTaskViewModel = [[DetailTaskViewModel alloc] initWithPresenter:self andTask:task];
    id<MarkdownGatewayProtocol> gateway = [MarkdownGatewayFactory create];
    self.editTaskViewModel = [[EditTaskViewModel alloc] initWithPresenter:self gateway:gateway andTask:task];
}

#pragma mark Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpDependencies];
    [self setColorUpButtons];
    [self setUpToolsView];
    [self setUpKeyboardEvents];
    [self presentBlankState];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if(self.splitViewController.collapsed)
        self.navigationController.navigationBar.translucent = NO;
    [self.detailTaskViewModel showDetailTask];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if(self.splitViewController.collapsed)
        self.navigationController.navigationBar.translucent = YES;
}

- (void)setUpDependencies {
    self.parser = [[NSAttributedStringMarkdownParser alloc] init];
    UIImage *checkedImage = [UIImage imageNamed:@"ic_radio_button_checked"];
    UIImage *uncheckedImage = [UIImage imageNamed:@"ic_radio_button_unchecked"];
    self.selectedButtonCheckedImage = [checkedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.unselectedButtonCheckedImage = [uncheckedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
}

- (void)setColorUpButtons {
    [self.lightBlueButton setImage:self.unselectedButtonCheckedImage
                          forState:UIControlStateNormal];
    [self.deepOrangeButton setImage:self.unselectedButtonCheckedImage
                           forState:UIControlStateNormal];
    [self.amberButton setImage:self.unselectedButtonCheckedImage
                      forState:UIControlStateNormal];
    
    self.deepOrangeButton.tintColor = [Colors deepOrange];
    self.lightBlueButton.tintColor = [Colors lightBlue];
    self.amberButton.tintColor = [Colors amber];
    
    self.deepOrangeButton.hidden = YES;
    self.lightBlueButton.hidden = YES;
    self.amberButton.hidden = YES;
}

- (void)setUpToolsView {
    self.toolsViewHeightLayoutConstraint.constant = 8;
}

#pragma mark Keyboard Handling

- (void)setUpKeyboardEvents {
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
    [self moveToolsView:notification up:YES];
}

- (void)keyboardWillBeHidden:(NSNotification*)notification
{
    [self moveToolsView:notification up:NO];
}

- (void)moveToolsView:(NSNotification*)notification up:(BOOL)up {
    NSDictionary* userInfo = [notification userInfo];
    [self animateToolsView:userInfo up:up];
}

- (void)animateToolsView:(NSDictionary*)userInfo up:(BOOL)up{
    NSTimeInterval duration = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    UIViewAnimationCurve animationCurve = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    CGRect keyboardFrame = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    if(up)
        self.toolsViewBottomLayoutConstraint.constant = keyboardFrame.size.height;
    else
        self.toolsViewBottomLayoutConstraint.constant = 0;
    
    [self.toolsView layoutIfNeeded];
    [UIView animateWithDuration:duration
                          delay:0
                        options:animationOptionsWithCurve(animationCurve)
                     animations:^{
                         [self.toolsView layoutIfNeeded];
                     }
                     completion:nil];
}

static inline UIViewAnimationOptions animationOptionsWithCurve(UIViewAnimationCurve curve)
{
    return (UIViewAnimationOptions)curve << 16;
}

#pragma mark Events handling

- (IBAction)editTapped:(id)sender {
    if(self.editing){
        [self saveMarkdown];
    }else{
        [self.editTaskViewModel prepareTaskFormForEditing];
    }
}

- (void)saveMarkdown {
    Markdown *task = [self.detailTaskViewModel task];
    task.markdownString = self.markdownStringTextView.text;
    [self.editTaskViewModel setTask:task];
    [self.editTaskViewModel saveTask];
}

- (void)unselectAllColors {
    [self.deepOrangeButton setImage:self.unselectedButtonCheckedImage forState:UIControlStateNormal];
    [self.lightBlueButton setImage:self.unselectedButtonCheckedImage forState:UIControlStateNormal];
    [self.amberButton setImage:self.unselectedButtonCheckedImage forState:UIControlStateNormal];
}

- (IBAction)setToDeepOrangeColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors deepOrange] hexStringFromColor];
    [self unselectAllColors];
    [self.deepOrangeButton setImage:self.selectedButtonCheckedImage forState:UIControlStateNormal];
    [self setControlsToColor:[Colors deepOrange]];
}

- (IBAction)setToLightBlueColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors lightBlue] hexStringFromColor];
    [self unselectAllColors];
    [self.lightBlueButton setImage:self.selectedButtonCheckedImage forState:UIControlStateNormal];
    [self setControlsToColor:[Colors lightBlue]];
}
- (IBAction)setToAmberColor:(id)sender {
    self.detailTaskViewModel.task.markdownColor = [[Colors amber] hexStringFromColor];
    [self unselectAllColors];
    [self.amberButton setImage:self.selectedButtonCheckedImage forState:UIControlStateNormal];
    [self setControlsToColor:[Colors amber]];
}

#pragma mark Model View Presenters

- (void)presentBlankState {
    self.editing = NO;
    self.navigationItem.rightBarButtonItem.title = @"";
    self.markdownStringTextView.text = @"";
    self.toolsView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.05];
}

- (void)presentDetailsForTask {
    self.editing = NO;
    self.navigationItem.rightBarButtonItem.title = @"Edit";
    self.markdownStringTextView.userInteractionEnabled = NO;
    UIColor *color = [UIColor colorWithHexString:self.detailTaskViewModel.task.markdownColor];
    NSAttributedString *attributedString = [self.parser
                                            attributedStringFromMarkdownString:self.detailTaskViewModel.task.markdownString];
    self.markdownStringTextView.attributedText = attributedString;
    [self setControlsToColor:color];
    [self hideToolsView];
}

- (void)presentEditionForTask {
    self.editing = YES;
    self.navigationItem.rightBarButtonItem.title = @"Done";
    self.markdownStringTextView.userInteractionEnabled = YES;
    self.markdownStringTextView.text = self.detailTaskViewModel.task.markdownString;
    self.markdownStringTextView.font = [UIFont systemFontOfSize:20];
    [self showToolsView];
}

- (void)presentEmptyTaskForEdition {
    
}

- (void)presentSuccesMessageForSavingTask {
    [self presentDetailsForTask];
}

- (void)presentErrorMessageForSavingTask:(NSString *)message {
    
}

#pragma mark Views Manipulation

- (void)setControlsToColor:(UIColor*)color {
    self.toolsView.backgroundColor = [color colorWithAlphaComponent:0.05];
    [self setMarkdownStringTextViewWithColor: color];
    [self setNavigationBarColorWith:color];
}

- (void)setMarkdownStringTextViewWithColor:(UIColor*)color {
    NSAttributedString *attributedString = self.markdownStringTextView.attributedText;
    NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc]
                                                          initWithAttributedString: attributedString];
    NSRange range = NSMakeRange(0, mutableAttributedString.length);
    [mutableAttributedString removeAttribute:NSForegroundColorAttributeName range:range];
    [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:color range:range];
    self.markdownStringTextView.attributedText = mutableAttributedString;
    self.markdownStringTextView.textColor = color;
}

- (void)setNavigationBarColorWith:(UIColor*)color {
    UINavigationController *navigationController;
    if(self.splitViewController.collapsed)
        navigationController = [[self splitViewController] viewControllers][0];
    else
        navigationController = self.navigationController;
    navigationController.navigationBar.tintColor = color;
}

- (void)showToolsView {
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

- (void)hideToolsView {
    [self.toolsView layoutIfNeeded];
    self.toolsViewHeightLayoutConstraint.constant = 8;
    self.deepOrangeButton.hidden = YES;
    self.lightBlueButton.hidden = YES;
    self.amberButton.hidden = YES;
    [UIView animateWithDuration:0.5 animations:^{
        [self.toolsView layoutIfNeeded];
    }];
}

@end
