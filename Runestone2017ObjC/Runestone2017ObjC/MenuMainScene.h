//
//  MenuMainScene.h
//  Runestone2017ObjC
//
//  Created by Ben Wheatley on 16/09/2017.
//  Copyright © 2017 Ben Wheatley. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <GameplayKit/GameplayKit.h>

@interface MenuMainScene : SKScene

@property (nonatomic) NSMutableArray<GKEntity *> *entities;
@property (nonatomic) NSMutableDictionary<NSString*, GKGraph *> *graphs;

@end
