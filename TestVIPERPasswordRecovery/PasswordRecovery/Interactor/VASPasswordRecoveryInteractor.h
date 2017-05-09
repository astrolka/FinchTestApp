//
//  VASPasswordRecoveryInteractor.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryInteractorInput.h"

@protocol VASPasswordRecoveryInteractorOutput;

@interface VASPasswordRecoveryInteractor : NSObject <VASPasswordRecoveryInteractorInput>

@property (nonatomic, weak) id<VASPasswordRecoveryInteractorOutput> output;

@end
