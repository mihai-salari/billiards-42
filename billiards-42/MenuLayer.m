//
//  MenuLayer.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 24.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "MenuLayer.h"
#import "MenuScene.h"
#import "ArcadeGameScene.h"

@implementation MenuLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        [self createMenu];        
    }
    return self;
}



-(void) createMenu
{
	// Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
	
	// Reset Button
	CCMenuItemLabel *arcada = [CCMenuItemFont itemWithString:@"Arcada" block:^(id sender){
		[[GameManager sharedGameManager] runScene:[ArcadeGameScene node]];
	}];
	
	// Debug Button
	CCMenuItemLabel *multiplayer = [CCMenuItemFont itemWithString:@"Multiplayer" block:^(id sender){
		[[GameManager sharedGameManager] runScene:[MenuScene node]];
	}];
	
	
	CCMenu *menu = [CCMenu menuWithItems:arcada, multiplayer, nil];
	
	[menu alignItemsVertically];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];
}

@end
