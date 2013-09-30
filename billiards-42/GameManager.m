//
//  GameManager.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "GameManager.h"
#import "MenuScene.h"
#import "ArcadeGameScene.h"
#import "CreditsScene.h"

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

-(void)runSceneWithID:(Scenes)scene {
    Scenes oldScene = currentScene;
    currentScene = scene;
    
    id sceneToRun = nil;
    switch (scene) {
        case kMenuScene:
            sceneToRun = [MenuScene node];
            break;
        case kCreditsScene:
            sceneToRun = [CreditsScene node];
            break;
//        case kIntroScene:
//            sceneToRun = [IntroScene node];
//            break;
//        case kLevelCompleteScene:
//            sceneToRun = [LevelCompleteScene node];
//            break;
        case kArcadeGameScene:
            sceneToRun = [ArcadeGameScene node];
            break;
//        case kMultiPlayerGameScene:
//            sceneToRun = [MultiPlayerGameScene node];
//            break;
            
        default:
            CCLOG(@"Unknown ID, cannot switch scenes");
            return;
            break;
    }
    
    if (sceneToRun == nil) {
        // Revert back, since no new scene was found
        currentScene = oldScene;
        return;
    }
    
    
    if ([[CCDirector sharedDirector] runningScene] == nil) {
        [[CCDirector sharedDirector] runWithScene:sceneToRun];
        
    } else {
        
        [[CCDirector sharedDirector] replaceScene:sceneToRun];
    }
    
}

@end
