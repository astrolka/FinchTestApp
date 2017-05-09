//
//  VASPasswordRecoveryInteractor.m
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryInteractor.h"

#import "VASPasswordRecoveryInteractorOutput.h"

static NSString *NetworkErrorMessage = @"Проверьте подключение и повторите попытку";
static NSString *EmailValidationErrorMessage = @"Данный e-mail не зарегистрирован";
static NSString *SecurityCodeValidationErrorMessage = @"Код введен неверно";

@implementation VASPasswordRecoveryInteractor

#pragma mark - Методы VASPasswordRecoveryInteractorInput

- (void)checkEmail:(NSString *)email {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self randomNetworkRequestDuration] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (arc4random_uniform(21) == 20) {
            [self.output didReciveErrorWithMessage:arc4random_uniform(2) % 2 ? NetworkErrorMessage : EmailValidationErrorMessage];
        }
        [self.output didCheckEmail];
    });
}

- (void)checkSecurityCode:(NSString *)code {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self randomNetworkRequestDuration] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (arc4random_uniform(21) == 20) {
            [self.output didReciveErrorWithMessage:arc4random_uniform(2) % 2 ? NetworkErrorMessage : SecurityCodeValidationErrorMessage];
        }
        [self.output didCheckSecurityCode];
    });
}

- (void)changeThePassword:(NSString *)password {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)([self randomNetworkRequestDuration] * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (arc4random_uniform(21) == 20) {
            [self.output didReciveErrorWithMessage:NetworkErrorMessage];
        }
        [self.output didChangeThePassword];
    });
}

#pragma mark - Private methods

- (float)randomNetworkRequestDuration {
    return (float)(arc4random_uniform(201) + 100) / 100.f;
}


@end
