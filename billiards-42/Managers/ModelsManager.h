//
//  ModelsManager.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Component.h"
#import "Model.h"

@interface ModelsManager : NSObject

- (uint32_t) generateNewMid;
// - (Model *) createModel; // I don't see any sense in it
- (void) addComponent:(Component *)component toModel:(Model*)model;
- (Component *) getComponentOfClass:(Class) class forModel:(Model *)model;
- (void)removeModel:(Model *) model;
- (NSArray *)getAllModelsPosessingComponentOfClass:(Class)class;

@end
