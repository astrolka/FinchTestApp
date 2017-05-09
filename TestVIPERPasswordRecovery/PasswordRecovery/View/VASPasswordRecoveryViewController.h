//
//  VASPasswordRecoveryViewController.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "VASPasswordRecoveryViewInput.h"

@protocol VASPasswordRecoveryViewOutput;

@interface VASPasswordRecoveryViewController : UIViewController <VASPasswordRecoveryViewInput, UITextFieldDelegate>

@property (nonatomic, strong) id<VASPasswordRecoveryViewOutput> output;

@property (weak, nonatomic) IBOutlet UIButton *confirmationButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UITextField *mainTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondaryTextField;
@property (weak, nonatomic) IBOutlet UILabel *errorLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *spaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomScrollViewConstraint;

- (IBAction)confirmationAction:(UIButton *)sender;

@end
