//
//  VASPasswordRecoveryPresenter.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryViewOutput.h"
#import "VASPasswordRecoveryInteractorOutput.h"
#import "VASPasswordRecoveryModuleInput.h"

@protocol VASPasswordRecoveryViewInput;
@protocol VASPasswordRecoveryInteractorInput;

@interface VASPasswordRecoveryPresenter : NSObject <VASPasswordRecoveryModuleInput, VASPasswordRecoveryViewOutput, VASPasswordRecoveryInteractorOutput>

@property (nonatomic, weak) id<VASPasswordRecoveryViewInput> view;
@property (nonatomic, strong) id<VASPasswordRecoveryInteractorInput> interactor;

@end
