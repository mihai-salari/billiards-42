//
//  HelloWorldLayer.m
//  billiards-42
//
//  Created by Admin on 9/19/13.
//  Copyright SalkoDev 2013. All rights reserved.
//

#import "AppDelegate.h"

// Import the interfaces
#import "ArcadeGameLayer.h"
#import "GameManager.h"
#import "ArcadeGameScene.h"
#import "Ball.h"

enum {
	kTagParentNode = 1,
};


#pragma mark - HelloWorldLayer

@interface ArcadeGameLayer ()
-(void) addNewSpriteAtPosition:(CGPoint)pos;
-(void) createMenu;
-(void) initPhysics;
-(void) createController;
@end


@implementation ArcadeGameLayer


-(id) init
{
	if( (self=[super init])) {
		
		// enable events
#ifdef __CC_PLATFORM_IOS
		self.touchEnabled = YES;
		self.accelerometerEnabled = YES;
#elif defined(__CC_PLATFORM_MAC)
		self.mouseEnabled = YES;
#endif
		
		CGSize s = [[CCDirector sharedDirector] winSize];
		
		// title
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Multi touch the screen" fontName:@"Marker Felt" fontSize:36];
		label.position = ccp( s.width / 2, s.height - 30);
		[self addChild:label z:-1];
		
		// reset button
		[self createMenu];
		
		
		// init physics
		[self initPhysics];
		
		/*
#if 1
		// Use batch node. Faster
		CCSpriteBatchNode *parent = [CCSpriteBatchNode batchNodeWithFile:@"grossini_dance_atlas.png" capacity:100];
		_spriteTexture = [parent texture];
#else
		// doesn't use batch node. Slower
		_spriteTexture = [[CCTextureCache sharedTextureCache] addImage:@"grossini_dance_atlas.png"];
		CCNode *parent = [CCNode node];
#endif
		[self addChild:parent z:0 tag:kTagParentNode];
		
		[self addNewSpriteAtPosition:ccp(200,200)];
		*/
        
        [self setScale:0.5f];
        
        [self createController];
        
		[self scheduleUpdate];
        
        
	}
	
	return self;
}

-(void) createController {
    _controller = [[GameController alloc] init];
    NSString* path = [[NSBundle mainBundle] pathForResource:@"level0" ofType:@"json"];
    [_controller loadFromJSON:path];
    _controller.renderLayer = self;
    _controller.physicsSpace = _space;
    [_controller start]; // it's game time!
}

-(void) initPhysics
{
	CGSize s = [[CCDirector sharedDirector] winSize];
	
	_space = cpSpaceNew();
	
	cpSpaceSetGravity( _space, cpvzero ); // zero gravity
    
    cpSpaceSetDamping(_space, 0.5);
    
    cpSpaceSetIdleSpeedThreshold(_space, 10);
	
    /*
	//
	// rogue shapes
	// We have to free them manually
	//
	// bottom
	_walls[0] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(s.width,0), 0.0f);
	
	// top
	_walls[1] = cpSegmentShapeNew( _space->staticBody, cpv(0,s.height), cpv(s.width,s.height), 0.0f);
	
	// left
	_walls[2] = cpSegmentShapeNew( _space->staticBody, cpv(0,0), cpv(0,s.height), 0.0f);
	
	// right
	_walls[3] = cpSegmentShapeNew( _space->staticBody, cpv(s.width,0), cpv(s.width,s.height), 0.0f);
	
	for( int i=0;i<4;i++) {
		cpShapeSetElasticity( _walls[i], 1.0f );
		cpShapeSetFriction( _walls[i], 1.0f );
		cpSpaceAddStaticShape(_space, _walls[i] );
	}*/
	
	_debugLayer = [CCPhysicsDebugNode debugNodeForCPSpace:_space];
	_debugLayer.visible = YES;//NO;
	[self addChild:_debugLayer z:100];
}

- (void)dealloc
{
	/*// manually Free rogue shapes
	for( int i=0;i<4;i++) {
		cpShapeFree( _walls[i] );
	}
	*/
	cpSpaceFree( _space );
	
	[super dealloc];
	
}

-(void) update:(ccTime) delta
{
	// Should use a fixed size step based on the animation interval.
	int steps = 2;
	CGFloat dt = [[CCDirector sharedDirector] animationInterval]/(CGFloat)steps;
	
	for(int i=0; i<steps; i++){
		cpSpaceStep(_space, dt);
	}
    
    [_controller update:delta];
}

-(void) createMenu
{
	// Default font size will be 22 points.
	[CCMenuItemFont setFontSize:22];
	
    // Reset Button
	CCMenuItemLabel *_menu = [CCMenuItemFont itemWithString:@"Back to Menu" block:^(id sender){
		[[GameManager sharedGameManager] runSceneWithID:(kMenuScene)];
	}];
    
	// Reset Button
	CCMenuItemLabel *reset = [CCMenuItemFont itemWithString:@"Reset" block:^(id sender){
		[[GameManager sharedGameManager] runSceneWithID:(kArcadeGameScene)];
	}];
	
	// Debug Button
	CCMenuItemLabel *debug = [CCMenuItemFont itemWithString:@"Toggle Debug" block:^(id sender){
		[_debugLayer setVisible: !_debugLayer.visible];
	}];
	
	
	// to avoid a retain-cycle with the menuitem and blocks
	__block id copy_self = self;
	
	// Achievement Menu Item using blocks
	CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
		
		
		GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
		achivementViewController.achievementDelegate = copy_self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:achivementViewController animated:YES];
		
		[achivementViewController release];
	}];
	
	// Leaderboard Menu Item using blocks
	CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
		
		
		GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
		leaderboardViewController.leaderboardDelegate = copy_self;
		
		AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
		
		[[app navController] presentModalViewController:leaderboardViewController animated:YES];
		
		[leaderboardViewController release];
	}];
	
	CCMenu *menu = [CCMenu menuWithItems:_menu,itemAchievement, itemLeaderboard, debug, reset, nil];
	
	[menu alignItemsVertically];
	
	CGSize size = [[CCDirector sharedDirector] winSize];
	[menu setPosition:ccp( size.width/2, size.height/2)];
	
	
	[self addChild: menu z:-1];
}

-(void) addNewSpriteAtPosition:(CGPoint)pos
{
	// physics body
	int num = 4;
	cpVect verts[] = {
		cpv(-24,-54),
		cpv(-24, 54),
		cpv( 24, 54),
		cpv( 24,-54),
	};
	
	cpBody *body = cpBodyNew(1.0f, cpMomentForPoly(1.0f, num, verts, CGPointZero));
	cpBodySetPos( body, pos );
	cpSpaceAddBody(_space, body);
	
	cpShape* shape = cpPolyShapeNew(body, num, verts, CGPointZero);
	cpShapeSetElasticity( shape, 0.5f );
	cpShapeSetFriction( shape, 0.5f );
	cpSpaceAddShape(_space, shape);
	
	// sprite
	CCNode *parent = [self getChildByTag:kTagParentNode];
	int posx = CCRANDOM_0_1() * 200.0f;
	int posy = CCRANDOM_0_1() * 200.0f;
	posx = (posx % 4) * 85;
	posy = (posy % 3) * 121;
	
	CCPhysicsSprite *sprite = [CCPhysicsSprite spriteWithTexture:_spriteTexture rect:CGRectMake(posx, posy, 85, 121)];
	[parent addChild: sprite];
	[sprite setCPBody:body];
	[sprite setPosition: pos];
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];
    for (id object in [_controller.modelsManager allModels ]) {
        if ([object isMemberOfClass:[Ball class]]){
            Ball * ball = (Ball*)object;
            if (CGRectContainsPoint(ball.getNode.boundingBox, location)){
                [ball touchStarted];
                _touched_ball = ball;
                [_controller disableZoomAndPan]; // to prevent conflict
                NSLog(@"Ball touche began coordinates x = %f, y = %f", location.x, location.y);
            }
        }
    }
}

- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Touch ended");
    
    if (_touched_ball == NULL) return;
    
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];
    [[_touched_ball getNode] removeChildByTag:100 ];
    cpVect impulse = cpv((_touched_ball.getNode.position.x - location.x)*40, (_touched_ball.getNode.position.y - location.y)*40);
    cpBodyApplyImpulse(_touched_ball.getBody, impulse, cpv(0.0, 0.0));
    _touched_ball = NULL;
    [_controller enableZoomAndPan];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (_touched_ball == NULL) return;
    
    //ccDrawLine(CGPointMake(0, 0), CGPointMake(100, 100));
    UITouch *myTouch = [touches anyObject];
    CGPoint location = [myTouch locationInView:[myTouch view]];
    location = [[CCDirector sharedDirector] convertToGL:location];
    location = [self convertToNodeSpace:location];
    NSLog(@"Touch moved coordinates x = %f, y = %f", location.x, location.y);
    [_touched_ball touchMoved:(CGPoint) location];
    
}

//- (void)ccTouchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
//    
//    
//    UITouch *myTouch = [touches anyObject];
//    CGPoint location = [myTouch locationInView:[myTouch view]];
//    location = [[CCDirector sharedDirector] convertToGL:location];
//    b2Vec2 locationWorld = b2Vec2(location.x/PTM_RATIO, location.y/PTM_RATIO);
//    
//    b2Vec2 impulse = b2Vec2((body->GetPosition().x - location.x/PTM_RATIO)*100, (body->GetPosition().y - location.y/PTM_RATIO)*100);
//    
//    
//    body->ApplyLinearImpulse(impulse, locationWorld);
//    
//    isTouched = FALSE;
//    [self removeChild:circle cleanup:TRUE];
//    circle = NULL;
//}


- (void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration
{
	static float prevX=0, prevY=0;
	
#define kFilterFactor 0.05f
	
	float accelX = (float) acceleration.x * kFilterFactor + (1- kFilterFactor)*prevX;
	float accelY = (float) acceleration.y * kFilterFactor + (1- kFilterFactor)*prevY;
	
	prevX = accelX;
	prevY = accelY;
	
	cpVect v;
	if( [[CCDirector sharedDirector] interfaceOrientation] == UIInterfaceOrientationLandscapeRight )
		v = cpv( -accelY, accelX);
	else
		v = cpv( accelY, -accelX);
	
	cpSpaceSetGravity( _space, cpvmult(v, 200) );
}


#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

@end

