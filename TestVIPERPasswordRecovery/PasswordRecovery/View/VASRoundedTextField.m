//
//  VASRoundedTextField.m
//  TestVIPERPasswordRecovery
//
//  Created by Александр Смоленский on 08.05.17.
//  Copyright © 2017 Alex. All rights reserved.
//

#import "VASRoundedTextField.h"

@implementation VASRoundedTextField

- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = CGRectGetHeight(rect) / 2;
    self.layer.borderColor = self.borderColor.CGColor;
    self.layer.borderWidth = 1;
}

@end
