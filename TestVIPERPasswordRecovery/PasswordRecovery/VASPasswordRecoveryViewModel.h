//
//  VASPasswordRecoveryViewModel.h
//  TestVIPERPasswordRecovery
//
//  Created by Александр Смоленский on 08.05.17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VASPasswordRecoveryViewModel : NSObject

@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *securityCode;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *passwordVerification;

@end
