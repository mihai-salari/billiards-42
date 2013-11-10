//
//  Model.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Model : NSObject

- (id)initWithMid:(uint32_t)mid;
- (uint32_t)mid;
- (void) setMid:(uint32_t) val;
- (void) addComponent:(NSObject*) component;
- (NSObject*) getComponentOfClass:(Class) klass;
- (void) loadFromJSON:( NSDictionary* ) jsonDict;

+ (NSArray*) listComponentsClasses; // returns list of components

- (CCNode*) getNode;

@property (readonly, getter = getNode) CCNode* node; //getter for node


@end
