//
//  VASPasswordRecoveryModuleInput.h
//  TestVIPERPasswordRecovery
//
//  Created by astrolka on 07/05/2017.
//  Copyright © 2017 noname. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol VASPasswordRecoveryModuleInput <RamblerViperModuleInput>

/**
 @author astrolka

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
