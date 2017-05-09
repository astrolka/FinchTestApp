//
//  VASPasswordRecoveryPresenter.m
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryPresenter.h"

#import "VASPasswordRecoveryViewInput.h"
#import "VASPasswordRecoveryInteractorInput.h"

#import "VASPasswordRecoveryViewModel.h"

typedef enum {
    VASEmailValidation,
    VASCodeValidation,
    VASNewPasswordValidation
} VASPasswordRecoveryValidationState;

@interface VASPasswordRecoveryPresenter ()

@property (assign, nonatomic) VASPasswordRecoveryValidationState state;
@property (strong, nonatomic) VASPasswordRecoveryViewModel *viewModel;

@end

static NSString *EmailFormatErrorMessage = @"Введен недействительный e-mail";
static NSString *PasswordMatchingErrorMessage = @"Пароли не совпадают";

@implementation VASPasswordRecoveryPresenter

#pragma mark - Методы VASPasswordRecoveryModuleInput

- (void)configureModule {
    
}

#pragma mark - Методы VASPasswordRecoveryViewOutput

- (void)didTriggerViewReadyEvent {
    self.state = VASEmailValidation;
    self.viewModel = [VASPasswordRecoveryViewModel new];
	[self.view setupInitialState];
}

- (void)didClickConfirmationButtonForMain:(NSString *)mainText andSecondaryText:(NSString *)secondaryText {
    switch (self.state) {
        case VASEmailValidation:
            self.viewModel.email = mainText;
            [self checkEmail];
            break;
            
        case VASCodeValidation:
            self.viewModel.securityCode = mainText;
            [self checkConfirmationCode];
            break;
            
        case VASNewPasswordValidation:
            self.viewModel.password = mainText;
            self.viewModel.passwordVerification = secondaryText;
            [self checkNewPassword];
            break;
    }
}

#pragma mark - Методы VASPasswordRecoveryInteractorOutput

- (void)didCheckEmail {
    self.state = VASCodeValidation;
    [self.view updateMainTextFieldPlaceHolderTextWith:@"Введите код подтверждения" andConfirmationButtonTitleWith:@"отправить"];
}

- (void)didCheckSecurityCode {
    self.state = VASNewPasswordValidation;
    [self.view updateMainTextFieldPlaceHolderTextWith:@"Введите новый пароль" andConfirmationButtonTitleWith:@"сохранить"];
    [self.view updateForNewPasswordBeEntered];
}

- (void)didChangeThePassword {
    //go on the other screen
    [self.view showSuccessAlert];
}

- (void)didReciveErrorWithMessage:(NSString *)message {
    [self.view showErrorWithMessage:message];
}

#pragma mark - Private Methods

- (void)checkEmail {
    if ([self validateEmailWithString:self.viewModel.email]) {
        [self.interactor checkEmail:self.viewModel.email];
    } else {
        [self.view showErrorWithMessage:EmailFormatErrorMessage];
    }
}

- (void)checkConfirmationCode {
    [self.interactor checkSecurityCode:self.viewModel.securityCode];
}

- (void)checkNewPassword {
    if ([self.viewModel.password isEqualToString:self.viewModel.passwordVerification]) {
        [self.interactor changeThePassword:self.viewModel.password];
    } else {
        [self.view showErrorWithMessage:PasswordMatchingErrorMessage];
    }
}

- (BOOL)validateEmailWithString:(NSString*)email {
    NSString *emailRegex = @"^[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}$";
    NSPredicate *emailPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[c] %@", emailRegex];
    return [emailPredicate evaluateWithObject:email];
}

@end
