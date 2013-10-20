//
//  ViewFactory.m
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "ViewFactory.h"

#import "BallView.h"
#import "WorldView.h"

@implementation ViewFactory

+ (View*) BuildViewByName:(NSString *)modelName {
    NSLog(@"View factory creates by name %@", modelName);

    View* result = nil;
   
    NSString* viewName = [NSString stringWithFormat:@"%@%@",modelName,@"View"];
    Class viewClass = NSClassFromString(viewName);
    result = (View*) [[viewClass alloc] init];
    return result; // TODO: add exception here if view is not found
}

@end
