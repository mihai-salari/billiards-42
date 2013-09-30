//
//  GameManager.h
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

typedef enum {
    kIntroScene=0,
    kMenuScene=1,
    kCreditsScene=2,
    kLevelCompleteScene=3,
    kArcadeGameScene=4,
    kMultiplayerGameScene=5,
} Scenes;

@interface GameManager : NSObject{
    Scenes currentScene;
}

+(GameManager*)sharedGameManager;
-(void)runSceneWithID:(Scenes)scene;

@end
