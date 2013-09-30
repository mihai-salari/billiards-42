//
//  ModelFactory.h
//  billiards-42
//
//  Created by Admin on 9/29/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "World.h"
#import "Wall.h"
#import "Pocket.h"
#import "Ball.h"

@interface ModelFactory : NSObject

+ (Model*) BuildUsingJSON:(NSDictionary*) jsonDict;

+ (CGSize) CGSizeFromJSON:(NSDictionary*) jsonDict;
+ (CGPoint) CGPointFromJSON:(NSDictionary*) jsonDict;


@end
