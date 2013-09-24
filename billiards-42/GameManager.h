//
//  GameManager.h
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameManager : NSObject


+(GameManager*)sharedGameManager;                                  // 1
-(void)runScene:(CCScene *)scene;

@end
