//
//  CreditsScene.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 30.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "CreditsScene.h"

@implementation CreditsScene

-(id)init {
    self = [super init];
    if (self != nil) {
        creditsLayer = [CreditsLayer node];
        [self addChild:creditsLayer];
    }
    return self;
}

@end
