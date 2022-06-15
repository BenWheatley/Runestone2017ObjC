//
//  GameScene.m
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 16/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import "GameScene.h"

const CGFloat TILE_WIDTH = 0.1;
const CGFloat TILE_HEIGHT = 0.1;
const CGFloat TILE_SCALE = 0.002;

@implementation GameScene {
    NSTimeInterval lastUpdateTime;
    SKLabelNode *lblTiles, *lblRemainingMoves;
	
}

- (void)sceneDidLoad {
    // Setup your scene here
    
    // Initialize update time
    lastUpdateTime = 0;
    
	
	lblTiles = [SKLabelNode labelNodeWithText:nil];
	lblRemainingMoves = [SKLabelNode labelNodeWithText:nil];
	for (SKLabelNode *label in @[lblTiles, lblRemainingMoves]) {
		[label removeFromParent];
		label.color = UIColor.whiteColor;
		[label setScale:TILE_SCALE];
		label.fontSize = 14;
		[self addChild:label];
	}
	lblTiles.position = CGPointMake(0, 0.4);
	lblRemainingMoves.position = CGPointMake(0, 0.45);
}

-(void)update:(CFTimeInterval)currentTime {
	// Called before each frame is rendered

	
	// Initialize lastUpdateTime if it has not already been
	if (lastUpdateTime == 0) {
		lastUpdateTime = currentTime;
	}
	
	// Calculate time since last update
	const NSTimeInterval dt = currentTime - lastUpdateTime;
	
	// Update entities
	for (GKEntity *entity in self.entities) {
		[entity updateWithDeltaTime:dt];
	}
	
	lastUpdateTime = currentTime;
}

- (void)hint {
	
}
- (void)zap {
	
}
- (void)cheat {
	
}

@end
