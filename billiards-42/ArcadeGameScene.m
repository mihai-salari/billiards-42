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
        [self addChild:arcadeGameLayer];
    }
    return self;
}
@end
