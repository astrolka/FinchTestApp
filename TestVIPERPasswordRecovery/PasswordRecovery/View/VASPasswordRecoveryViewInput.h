//
//  VASPasswordRecoveryViewInput.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VASPasswordRecoveryViewInput <NSObject>

/**
 @author astrolka

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

/**
 @author astrolka
 
 Метод обновляет текст в элементах view
 */

- (void)updateMainTextFieldPlaceHolderTextWith:(NSString *)placeHolderText andConfirmationButtonTitleWith:(NSString *)title;

/**
 @author astrolka
 
 Метод сообщает view о том, что она должна показать ошибку
 */

- (void)showErrorWithMessage:(NSString *)message;

/**
 @author astrolka
 
 Метод сообщает view о том, что она должна показать второй textField
 */

- (void)updateForNewPasswordBeEntered;

/**
 @author astrolka
 
 Метод сообщает view о том, что она должна показать alertController
 */

- (void)showSuccessAlert;

@end
