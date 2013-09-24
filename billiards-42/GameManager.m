//
//  GameManager.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

static GameManager* _sharedGameManager = nil;



+(GameManager*)sharedGameManager {
    @synchronized([GameManager class])
    {
        if(!_sharedGameManager)
            [[self alloc] init];
        return _sharedGameManager;
    }
    return nil;
}

+(id)alloc
{
    @synchronized ([GameManager class])
    {
        NSAssert(_sharedGameManager == nil,
                 @"Attempted to allocated a second instance of the Game Manager singleton");
        _sharedGameManager = [super alloc];
        return _sharedGameManager;                               
    }
    return nil;
}

-(void)runScene:(CCScene *)scene {
    
    if ([[CCDirector sharedDirector] runningScene] == nil) {
        [[CCDirector sharedDirector] runWithScene:scene];
        
    } else {
        
        [[CCDirector sharedDirector] replaceScene:scene];
    }    
}

@end
