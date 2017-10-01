//
//  GameScene.m
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 16/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import "GameScene.h"
#import "KitsuneStandardLibrary.h"

const CGFloat TILE_WIDTH = 0.1;
const CGFloat TILE_HEIGHT = 0.1;
const CGFloat TILE_SCALE = 0.002;

@implementation GameScene {
    NSTimeInterval lastUpdateTime;
    SKLabelNode *lblTiles, *lblRemainingMoves;
	
	GameModel *gameModel;
}

- (void)sceneDidLoad {
    // Setup your scene here
    
    // Initialize update time
    lastUpdateTime = 0;
    
	[self hardResetGameModel: GameSizeSmallest];
	
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

- (void) hardResetGameModel:(GameSize)gameSize {
	for (Tile *t in gameModel.tiles) {
		[t removeFromParent];
	}

	gameModel = [[GameModel alloc] initWithSize:gameSize];
	CGFloat xOffset = (gameModel.width-1)/2.0;
	CGFloat yOffset = (gameModel.height-1)/2.0;

	for (Tile *tile in gameModel.tiles) {
		IF_LET(Int2DPosition, pos, tile.realPosition, {
			[tile removeFromParent];
			tile.position = CGPointMake(TILE_WIDTH*(pos.x-xOffset),
										TILE_HEIGHT*(pos.y-yOffset)	);
			[tile setScale:TILE_SCALE];
			[self addChild:tile];
		})
	}
}

- (void)touchDownAtPoint:(CGPoint)pos {
	NSArray<SKNode*> *touchedNodes = [self nodesAtPoint:pos];
	
	// Make the touched nodes bounce, mark them as selected and tint them red so the user knows what's up
	for (SKNode *node in touchedNodes) {
		IF_LET(Tile, tile, node, {
			SKAction *scale = [SKAction scaleBy: 1.2 duration: 0.15];
			SKAction *action = ([SKAction sequence:@[scale, scale.reversedAction]]);
			[tile runAction:action];
			if (!tile.highlighted) {
				[gameModel selectWithTile:tile];
			} else {
				[gameModel deselectWithTile:tile];
			}
		})
	}
	
	[gameModel processUserActions];
}

- (void)touchMovedToPoint:(CGPoint)pos {
}

- (void)touchUpAtPoint:(CGPoint)pos {
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchDownAtPoint:[t locationInNode:self]];}
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    for (UITouch *t in touches) {[self touchMovedToPoint:[t locationInNode:self]];}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *t in touches) {[self touchUpAtPoint:[t locationInNode:self]];}
}


-(void)update:(CFTimeInterval)currentTime {
	// Called before each frame is rendered
	
	const NSInteger tileCount = gameModel.tileCount;
	const NSInteger moveCount = gameModel.remainingMovesCount;
	lblTiles.text = [NSString stringWithFormat:LocalizedString(@"keyTilesRemaining"), @(tileCount).stringValue];
	lblRemainingMoves.text = [NSString stringWithFormat:LocalizedString(@"keyMovesRemaining"), @(moveCount).stringValue];
	
	if (tileCount == 0) {
		[self hardResetGameModel: gameModel.getHarderGameSize];
	} else if (moveCount == 0) {
		[self hardResetGameModel: gameModel.getCurrentGameSize];
	}
	
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

@end
