//
//  HelloWorldLayer.m
//  cocos test
//
//  Created by yeforriak on 01/06/2011.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "CCTouchDispatcher.h"
#import "YefoFacesLayer.h"
#import "SimpleAudioEngine.h"


// HelloWorldLayer implementation
@implementation YefoFacesLayer

CCSprite *seeker1;
CCSprite *cocosGuy;

CCSprite *turtle1;
CCSprite *turtle2;
CCSprite *turtle3;

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	YefoFacesLayer *layer = [YefoFacesLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		//CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		//CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		//label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		//[self addChild: label];
        
        SimpleAudioEngine *sae = [SimpleAudioEngine sharedEngine];
        if (sae != nil) {
            [sae preloadBackgroundMusic:@"background.mp3"];
            if (sae.willPlayBackgroundMusic) {
                sae.backgroundMusicVolume = 0.5f;
            }
        } 
        
        [sae playBackgroundMusic:@"background.mp3" loop:YES];

        //[[CDAudioManager sharedManager] playBackgroundMusic:@"mula_tito_on_timbales.mp3" loop:YES];
         self.isTouchEnabled = YES;
        
        // create and initialize our seeker sprite, and add it to this layer
        seeker1 = [CCSprite spriteWithFile: @"turtlesprite.gif"];
        seeker1.position = ccp( 50, 100 );
        [self addChild:seeker1];
        
        
        turtle1 = [CCSprite spriteWithFile: @"yefoFace.png"];
        turtle1.position = ccp(200, 120);
        [turtle1 runAction: [CCFadeIn actionWithDuration:2]];
        
        turtle2 = [CCSprite spriteWithFile: @"victorFace.png"];
        turtle2.position = ccp(280, 120);
        [turtle2 runAction: [CCFadeIn actionWithDuration:2]];
        
//        turtle3 = [CCSprite spriteWithFile: @"turtlesprite.gif"];
//        turtle3.position = ccp(400, 300);
//        [turtle3 runAction: [CCFadeIn actionWithDuration:2]];
//        
        [self addChild:turtle1];
        [self addChild:turtle2];
//        [self addChild:turtle3];
        
        // do the same for our cocos2d guy, reusing the app icon as its image
//        cocosGuy = [CCSprite spriteWithFile: @"Icon.png"];
//        cocosGuy.position = ccp( 200, 300 );
        
        //[cocosGuy runAction: [CCFadeIn actionWithDuration:2]];
        //[self addChild:cocosGuy];
        
        [self schedule:@selector(nextFrame:)];
	}
	return self;
}

-(void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint location = [self convertTouchToNodeSpace: touch];
    
    CGPoint location2 = location;
    location2.x = location.x - 80;
    //location2.y = location.y + 50;
    
	[turtle1 stopAllActions];
	[turtle1 runAction: [CCMoveTo actionWithDuration:1 position:location]];
    
    [turtle2 stopAllActions];
	[turtle2 runAction: [CCMoveTo actionWithDuration:2 position:location2]];
    
    [turtle3 stopAllActions];
	[turtle3 runAction: [CCMoveTo actionWithDuration:3 position:location]];
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

- (void) nextFrame:(ccTime)dt {
    seeker1.position = ccp( seeker1.position.x + 100*dt, seeker1.position.y );
    if (seeker1.position.x > [[CCDirector sharedDirector] winSize].width) {
        seeker1.position = ccp( -32, seeker1.position.y );
    }
}
@end
