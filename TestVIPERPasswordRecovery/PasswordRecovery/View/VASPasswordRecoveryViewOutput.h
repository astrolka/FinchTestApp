//
//  VASPasswordRecoveryViewOutput.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VASPasswordRecoveryViewOutput <NSObject>

/**
 @author astrolka

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

/**
 @author astrolka
 
 Метод сообщает презентеру о том, что кнопка была нажата
 */

- (void)didClickConfirmationButtonForMain:(NSString *)mainText andSecondaryText:(NSString *)secondaryText;

@end
