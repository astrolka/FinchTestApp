//
//  VASPasswordRecoveryInteractorInput.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VASPasswordRecoveryInteractorInput <NSObject>

- (void)checkEmail:(NSString *)email;
- (void)checkSecurityCode:(NSString *)code;
- (void)changeThePassword:(NSString *)password;

@end
