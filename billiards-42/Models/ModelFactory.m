//
//  ModelFactory.m
//  billiards-42
//
//  Created by Admin on 9/29/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "ModelFactory.h"

@implementation ModelFactory

+ (Model*) BuildUsingJSON:(NSDictionary *)jsonDict {
    NSString* klassName = jsonDict[@"class"];
    Model* model = [[NSClassFromString(klassName) alloc]init];
    [model loadFromJSON: jsonDict];
    return model;
}

+ (CGSize) CGSizeFromJSON:(NSDictionary*) jsonDict {
    NSNumber* width = jsonDict[@"width"];
    NSNumber* height = jsonDict[@"height"];
    return  CGSizeMake( [width floatValue], [height floatValue] );
}

+ (CGPoint) CGPointFromJSON:(NSDictionary*) jsonDict {
    NSNumber* x = jsonDict[@"x"];
    NSNumber* y = jsonDict[@"y"];
    return  CGPointMake( [x floatValue], [y floatValue] );
}

@end
