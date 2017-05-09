//
//  VASPasswordRecoveryAssembly.m
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import "VASPasswordRecoveryAssembly.h"

#import "VASPasswordRecoveryViewController.h"
#import "VASPasswordRecoveryInteractor.h"
#import "VASPasswordRecoveryPresenter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation VASPasswordRecoveryAssembly

- (VASPasswordRecoveryViewController *)viewPasswordRecovery {
    return [TyphoonDefinition withClass:[VASPasswordRecoveryViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPasswordRecovery]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterPasswordRecovery]];
                          }];
}

- (VASPasswordRecoveryInteractor *)interactorPasswordRecovery {
    return [TyphoonDefinition withClass:[VASPasswordRecoveryInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPasswordRecovery]];
                          }];
}

- (VASPasswordRecoveryPresenter *)presenterPasswordRecovery{
    return [TyphoonDefinition withClass:[VASPasswordRecoveryPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewPasswordRecovery]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorPasswordRecovery]];
                          }];
}

@end
