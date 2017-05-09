//
//  VASPasswordRecoveryInteractorOutput.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VASPasswordRecoveryInteractorOutput <NSObject>

- (void)didCheckEmail;
- (void)didCheckSecurityCode;
- (void)didChangeThePassword;

- (void)didReciveErrorWithMessage:(NSString *)message;

@end
