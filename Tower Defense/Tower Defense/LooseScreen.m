//
//  LooseScreen.m
//  Tower Defense
//
//  Created by Guest User on 12/14/13.
//  Copyright 2013 Guest User. All rights reserved.
//

#import "LooseScreen.h"
#import "HelloWorldLayer.h"
#import "AppDelegate.h"


@implementation LooseScreen

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	LooseScreen *layer = [LooseScreen node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

//
-(id) init
{
	if( (self=[super init])) {
        
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        //elemets we are going to add to this layer
		CCSprite *background;
        CCMenu * myMenu;
		
		if( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) {
			background = [CCSprite spriteWithFile:@"Background.png"];
            CGSize winSize = [[CCDirector sharedDirector] winSize];
            //these statements adjust the background to whatever size of the screen is
            float Xscale;
            float Yscale;
            //calculate how many times the image fits in screen
            Xscale = winSize.width/[background contentSize].width ;
            Yscale = winSize.height/[background contentSize].height;
            background.scaleX = Xscale;
            background.scaleY = Yscale;
            
            
            //add menu item to menu
			CCMenuItemImage * youLoose = [CCMenuItemImage itemWithNormalImage:@"retry.png"
                                                                selectedImage: nil
                                                                       target:self
                                                                     selector:@selector(restartGame)];
            //youLoose.position = ccp(winSize.width/2, winSize.height/2);
            myMenu = [CCMenu menuWithItems:youLoose,nil];
            
            
		} else {
			background = [CCSprite spriteWithFile:@"Default-Landscape~ipad.png"];
		}
		background.position = ccp(size.width/2, size.height/2);
        
		// add the background to layer
		[self addChild: background];
        //set menu with items vertically in middle of screen (just one itme in this case)
        [myMenu alignItemsVertically];
        //add menu to layer
        [self addChild:myMenu];
	}
	
	return self;
}

//layer does nothing by default on enter
-(void) onEnter
{
	[super onEnter];
    	
}
//gets called when user taps on menu item 
-(void) restartGame{

    [[CCDirector sharedDirector] replaceScene:[CCTransitionFade transitionWithDuration:3.0 scene:[HelloWorldLayer scene] ]];

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
