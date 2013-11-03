//
//  PhysicsModel.h
//  billiards-42
//
//  Created by Admin on 9/28/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol PhysicsModel <NSObject>

- (cpBody*) getBody;
- (void) setBody:(cpBody*) body;
- (cpShape*) getShape;
- (CGPoint) getPosition;

@end
