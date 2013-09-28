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
- (void) addModel:(Model *) model;
- (void) addComponent:(Component *)component toModel:(Model*)model;
- (Component *) getComponentOfClass:(Class) class forModel:(Model *)model;
- (void)removeModel:(Model *) model;
- (void) loadFromJSON:(NSString *) filePath;
- (NSMutableArray*) allComponents;

//- (NSArray *)getAllModelsPosessingComponentOfClass:(Class)class;

@end
