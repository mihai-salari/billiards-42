//
//  MenuScene.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "MenuScene.h"

@implementation MenuScene
-(id)init {
    self = [super init];
    if (self != nil) {
        menuLayer = [MenuLayer node];
        [self addChild:menuLayer];
    }
    return self;
}
@end
