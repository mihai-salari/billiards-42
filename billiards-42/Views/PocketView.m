//
//  PocketView.m
//  billiards-42
//
//  Created by Admin on 11/12/13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "PocketView.h"

@implementation PocketView
    - (void) startup {
        // creates sprite on layer
        NSLog(@"PocketView startup method call!");
        self.sprite = [CCSprite spriteWithTexture: [self.model getTexture]];
        self.sprite.position = [self.model getPosition];
    
        self.node = self.sprite; // sprite is out main node
        [self.renderLayer addChild:self.sprite];
}
@end
