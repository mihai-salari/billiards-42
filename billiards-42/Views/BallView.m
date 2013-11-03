//
//  BallView.m
//  billiards-42
//
//  Created by Admin on 10/20/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "BallView.h"
#import "PhysicsModel.h"

@implementation BallView

- (void) startup {
    // creates sprite on layer
    NSLog(@"WordView startup method call!");
    self.sprite = [CCPhysicsSprite spriteWithTexture: [self.model getTexture]];
    cpBody* body = [((Model<PhysicsModel>*)self.model) getBody];
    [self.sprite setCPBody:body];
    self.sprite.position = [self.model getPosition];
    //sprite.anchorPoint = CGPointMake(0.0f, 0.0f);
    [self.renderLayer addChild:self.sprite];
}

@end
