//
//  ArcadaGameScene.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "ArcadeGameScene.h"

@implementation ArcadeGameScene

-(id)init {
    self = [super init];
    if (self != nil) {
        arcadeGameLayer = [ArcadeGameLayer node];
        
        CGSize size = [CCDirector sharedDirector].winSize;
        [arcadeGameLayer setPosition:CGPointMake(- size.width/4 , -size.height/4) ]; // TODO: support non-retina
        
        //[arcadeGameLayer setAnchorPoint:CGPointZero];
        [self addChild:arcadeGameLayer];
    }
    return self;
}
@end
