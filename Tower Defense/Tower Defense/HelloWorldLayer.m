//
//  HelloWorldLayer.m
//  TestCocos2d
//
//  Created by Guest User on 12/9/13.
//  Copyright Guest User 2013. All rights reserved.
//


// Import the interfaces
#import "CCTouchDispatcher.h"
#import "HelloWorldLayer.h"
#import "LooseScreen.h"
// Needed to obtain the Navigation Controller
#import "AppDelegate.h"
CCSprite *currentBullet;//this will be our bullet object
CCSprite *currentMinion; //will use to pull itmes from minions array
CCSprite *player;
float currentLevel; //will be used for current dificulty level
float numberOfMinionsforNextLevel;//when it is zero level goes up

int numberOfHits; //keeps count of how many minions have hit player

BOOL minionSchedule;//will say when minion appears on screen 


//CCSprite *cocosGuy;

NSMutableArray *minions; //will have all minions on screen
NSMutableArray *bullets; //will have all bullets on screen

NSMutableArray *slopes; //will have store the slope for the the bullets trajectory

NSMutableArray *minionsHit;//Monions to be deleted
NSMutableArray *bulletsHit;//Bullets to be deleted

int trajectoryType; //we use for angles
NSMutableArray *trajectoryTypes;



#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation HelloWorldLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
        currentLevel = 0;//set initial difficulty
        numberOfHits = 0;//set initial number of times player has been hit
        minions =[[NSMutableArray alloc] init];//initialize minions array
        bullets = [[NSMutableArray alloc]init];//initialize bullets array
        slopes = [[NSMutableArray alloc]init]; //initialize slopes array
        trajectoryTypes = [[NSMutableArray alloc]init];//initialize trajectoryTypes
        
        minionsHit = [[NSMutableArray alloc]init];//Initialize Minions to be deleted
        bulletsHit= [[NSMutableArray alloc]init];//Initialize Bullets to be deleted
        numberOfMinionsforNextLevel = 2;//Initialize countdown of minions for next level
        
        
        minionSchedule = FALSE;//initialize minion schedule
        [self scheduleUpdate];  //this is what we use in cocs2d instead of an NSTimer
        [self schedule: @selector(minionShouldAppear:) interval:1.5];//calls minionShouldAppear every 1.5  secs
        
        //add background
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        CCSprite *background = [CCSprite spriteWithFile:@"Background.png"];
        background.position = ccp(winSize.width/2, winSize.height/2);
        
        //these statements adjust the background to whatever size of the screen is
        float Xscale;
        float Yscale;
        //calculate how many times the image fits in screen 
        Xscale = winSize.width/[background contentSize].width ;
        Yscale = winSize.height/[background contentSize].height;
        
        background.scaleX = Xscale;
        background.scaleY = Yscale;
        
        [self addChild:background];//add background to scene
        
        
        
        //create and initialize our player sprite, and add it to this layer
        player = [CCSprite spriteWithFile:@"WalkerFinal.png"];
        player.position = ccp(60,110);
        [self addChild:player];
        
        
        //schedule a repeatingcallback on every frame
        [self schedule:@selector(nextFrame:)];
        
		//register for touch events
        self.isTouchEnabled = YES;
        
	}
	return self;
}
//gets called when has to appear
-(void) minionShouldAppear:(ccTime) dt{
    minionSchedule = TRUE;
}
//increases dificulty level
-(void)increaseDifficulty{
    currentLevel = currentLevel+1;
    NSString *garbage = [NSString stringWithFormat:@"current Level is %f", currentLevel];
    NSLog(@"%@",garbage);
    numberOfMinionsforNextLevel = 2;

}
//gets called when player gets hit three times
-(void)playerGetsHit{

    [[CCDirector sharedDirector] replaceScene: [LooseScreen scene]];//replace scene when player looses


}
//Because we're using the “targeted” set of touch events, we have to implement at least the ccTouchBegan method. Return YES here to tell the touch dispatcher that you want to claim this touch
- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event {
    return YES;
}


//make bullet go wherever touch ended
- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event {
	CGPoint location = [self convertTouchToNodeSpace: touch];
    
    //add bullet to screen everytime user taps on it
    [bullets addObject:[CCSprite spriteWithFile:@"Bullet.png"]];
    currentBullet = [bullets lastObject];
    currentBullet.position = ccp(150,155);
    [self addChild:currentBullet];
    
    if((location.y -155)>0 && (location.x-150)<0){ //user clicked behind and top gun
        trajectoryType = 2;
    }
    
    else if((location.y -155)<0 && (location.x-150)<0){ //user clicked behind and bottom of gun
        trajectoryType = 3;
    }
    else{
        trajectoryType = 0;
    }
    
    //NSLog([NSString stringWithFormat:@"%f", location.x]);
    //NSLog([NSString stringWithFormat:@"%f", location.y]);
    //NSLog([NSString stringWithFormat:@"%d", trajectoryType]);
    [trajectoryTypes addObject:[NSNumber numberWithInt:trajectoryType]];//store trajectory type
    
    float slope = (location.y -155)/ (location.x-150);
    [slopes addObject:[NSNumber numberWithFloat:slope]]; //store slope
}

//Check for collitions
-(void)update:(ccTime)dt{
    int j;
    int i;
    for (i = 0; i < [bullets count]; i++) {
        currentBullet=[bullets objectAtIndex:i];
        
        for (j = 0; j < [minions count]; j++) {
            currentMinion = [minions objectAtIndex:j];
            
            if( CGRectIntersectsRect(currentBullet.boundingBox, currentMinion.boundingBox)){
                
                [bulletsHit addObject:currentBullet];//add to 'toBeDeleted' Array
                [minionsHit addObject:currentMinion];//add to 'toBeDeleted' Array
                [slopes removeObjectAtIndex:i];//remove slope for given bullet otherwise our trajectories get screwed up
                [trajectoryTypes removeObjectAtIndex:i];
            }
        }
        
    }
    for (CCSprite *currentBullet in bulletsHit) {
        [self removeChild:currentBullet cleanup: YES];//remove bullet from screen
        [bullets removeObject:currentBullet];//remove bullet from bullets array
    
    }
    for (CCSprite *currentMinion in minionsHit) {
        [self removeChild:currentMinion cleanup: YES];//remove minion from screen
        [minions removeObject:currentMinion];//remove minion from minions array
    
    }

}
//Tell the CCLayer code that we want the “targeted” set of touch events rather than the “standard” set
-(void) registerWithTouchDispatcher
{
	[[[CCDirector sharedDirector] touchDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}


-(void) nextFrame:(ccTime)dt{
    
    //create minions every time minions schedules is true
    if (minionSchedule == TRUE){ 
        
        numberOfMinionsforNextLevel = numberOfMinionsforNextLevel-1;
        [minions addObject:[CCSprite spriteWithFile: @"Minion.png"]];
        currentMinion = [minions lastObject];
        currentMinion.position = ccp(480,arc4random() %((320-32)-(0+32))+(0+32));
        [self addChild:currentMinion];
        minionSchedule = false;
        if(numberOfMinionsforNextLevel <=0){
            [self increaseDifficulty];
        
        }
    }
    
    
    int i;
    //Move Minions
    
    for (i = 0; i < [minions count]; i++) {
       currentMinion = [minions objectAtIndex:i];
        currentMinion.position = ccp( currentMinion.position.x-(100+currentLevel*5)*dt,currentMinion.position.y);
        if(currentMinion.position.x <0-32 ){//if minion makes it to left side of screen
            
            [self removeChild:currentMinion cleanup: YES];//remove from screen
            [minions removeObjectAtIndex:i];//remove from array
            numberOfHits = numberOfHits + 1;
            
            if(numberOfHits==3){
                [self playerGetsHit];
            
            }
        
        }
    }
    //Move bullets
    for (i = 0; i < [bullets count]; i++) {
        currentBullet = [bullets objectAtIndex:i];
        NSNumber *slope = [slopes objectAtIndex:i];
        NSNumber *thistrajectoryType =[trajectoryTypes objectAtIndex:i];
        
        //use some trigonometry to calculate angle and direction of bullet
        float moveAngle = atanf(slope.floatValue);
        
        
        if(  thistrajectoryType.intValue == 2 ){
            currentBullet.position = ccp(currentBullet.position.x-(100*cosf(moveAngle))*dt,currentBullet.position.y-(100*sinf(moveAngle))*dt);
        }
        else if (thistrajectoryType.intValue == 3) {
            currentBullet.position = ccp(currentBullet.position.x-(100*cosf(moveAngle))*dt,currentBullet.position.y-(100*sinf(moveAngle))*dt);
        }
        else{
        currentBullet.position = ccp(currentBullet.position.x+(100*cosf(moveAngle))*dt,currentBullet.position.y+(100*sinf(moveAngle))*dt);
        }
        
    }
  
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
