//
//  Model.h
//  billiards-42
//
//  Created by Admin on 9/21/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

- (id)initWithMid:(uint32_t)mid;
- (uint32_t)mid;
- (void) setMid:(uint32_t) val;
- (void) addComponent:(NSObject*) component;
- (NSObject*) getComponentOfClass:(Class) klass;
- (void) loadFromJSON:( NSDictionary* ) jsonDict;

+ (NSArray*) listComponentsClasses; // returns list of components


@end
