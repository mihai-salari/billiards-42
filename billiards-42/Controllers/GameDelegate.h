//
//  GameDelegate.h
//  billiards-42
//
//  Created by Admin on 11/16/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Ball.h"
//#import "Pocket.h"

@protocol GameDelegate <NSObject>

- (void) ball:(NSObject*) ball inPocket:(NSObject*) pocket;

@end
