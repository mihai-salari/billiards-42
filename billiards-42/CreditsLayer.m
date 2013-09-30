//
//  CreditsLayer.m
//  billiards-42
//
//  Created by Abliamit Abliamitov on 30.09.13.
//  Copyright (c) 2013 SalkoDev. All rights reserved.
//

#import "CreditsLayer.h"
#import "GameManager.h"


@implementation CreditsLayer

-(id)init {
    self = [super init];
    if (self != nil) {
        CGSize screenSize=[[CCDirector sharedDirector]winSize];
        
        CCLabelTTF * header = [CCLabelTTF labelWithString:@"Our Team:" fontName:@"Arial" fontSize:25.0];
        header.position=ccp(screenSize.width/2,screenSize.height*0.90);
        [self addChild:header z:1];
        
        CCLabelTTF * dmitry = [CCLabelTTF labelWithString:@"Dmitry Salko" fontName:@"Arial" fontSize:16.0];
        dmitry.position=ccp(screenSize.width/2,screenSize.height*0.80);
        [self addChild:dmitry z:1];
        
        CCLabelTTF * abliamit = [CCLabelTTF labelWithString:@"Abliamit Abliamitov" fontName:@"Arial" fontSize:16.0];
        abliamit.position=ccp(screenSize.width/2,screenSize.height*0.70);
        [self addChild:abliamit z:1];
        
        // Debug Button
        CCMenuItemLabel *backLink = [CCMenuItemFont itemWithString:@"Back" block:^(id sender){
            [[GameManager sharedGameManager] runSceneWithID:(kMenuScene)];
        }];
        
        
        CCMenu *menu = [CCMenu menuWithItems:backLink, nil];
        
        [menu alignItemsVertically];
        
        [menu setPosition:ccp(screenSize.width*0.1, screenSize.height*0.90)];
        
        [self addChild: menu z:-1];
    }
    return self;
}


@end
