//
//  VASPasswordRecoveryViewController.m
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryViewController.h"
#import "VASPasswordRecoveryViewOutput.h"

@implementation VASPasswordRecoveryViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    
	[self.output didTriggerViewReadyEvent];
    
}

#pragma mark - Методы VASPasswordRecoveryViewInput

- (void)setupInitialState {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveBottomEdgeDown:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moveBottomEdgeUp:) name:UIKeyboardWillShowNotification object:nil];
    
    self.spaceConstraint.constant = 50;
    
    UIBarButtonItem *homeButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"home"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setRightBarButtonItem:homeButton];
    
    self.confirmationButton.layer.cornerRadius = CGRectGetHeight(self.confirmationButton.frame) / 2;
    
    self.errorLabel.hidden = YES;
    self.secondaryTextField.hidden = YES;
}

- (void)updateMainTextFieldPlaceHolderTextWith:(NSString *)placeHolderText andConfirmationButtonTitleWith:(NSString *)title {
    self.mainTextField.text = @"";
    self.mainTextField.placeholder = placeHolderText;
    [self.confirmationButton setTitle:title forState:UIControlStateNormal];
    
    self.confirmationButton.enabled = YES;
    self.errorLabel.hidden = YES;
    [self.activityIndicator stopAnimating];
}

- (void)showErrorWithMessage:(NSString *)message {
    self.confirmationButton.enabled = YES;
    [self.activityIndicator stopAnimating];
    self.errorLabel.text = message;
    self.errorLabel.hidden = NO;
}

- (void)updateForNewPasswordBeEntered {
    
    self.mainTextField.secureTextEntry = YES;
    
    self.secondaryTextField.hidden = NO;
    [self.secondaryTextField setNeedsDisplay];
    
    [self.view layoutIfNeeded];
    self.spaceConstraint.constant = 20;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)showSuccessAlert {
    [self.activityIndicator stopAnimating];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Конец" message:@"Пароль успешно изменен, удачи!" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([self.mainTextField isFirstResponder]) {
        [self.mainTextField resignFirstResponder];
    }
    if ([self.secondaryTextField isFirstResponder]) {
        [self.secondaryTextField resignFirstResponder];
    }
    return YES;
}

#pragma mark - Layout methods

- (void)moveBottomEdgeUp:(NSNotification *)notification {
    [self moveBottomEdgeUpDown:notification constant:nil];
}

- (void)moveBottomEdgeDown:(NSNotification *)notification {
    [self moveBottomEdgeUpDown:notification constant:@0];
}

- (void)moveBottomEdgeUpDown:(NSNotification *)notification constant:(NSNumber *)constant {
    NSDictionary *userInfo = notification.userInfo;
    
    CGFloat duration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationCurve curve = [userInfo[UIKeyboardAnimationCurveUserInfoKey] intValue];
    CGRect keyboardFrame = [userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGFloat height = CGRectGetHeight(keyboardFrame);
    if (constant)
        height = constant.floatValue;
    
    [self.view layoutIfNeeded];
    self.bottomScrollViewConstraint.constant = height;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState | curve
                     animations:^{
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

#pragma mark - Actions

- (IBAction)confirmationAction:(UIButton *)sender {
    if (self.mainTextField.text.length == 0) {
        return;
    }
    self.confirmationButton.enabled = NO;
    self.errorLabel.hidden = YES;
    [self.activityIndicator startAnimating];
    [self.output didClickConfirmationButtonForMain:self.mainTextField.text andSecondaryText:self.secondaryTextField.text];
}

@end
