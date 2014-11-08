//
//  Player.h
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"

@interface Player : NSObject
@property (nonatomic) int manaPointsLeft;
@property (strong) NSMutableArray *currentActions;

-(Action*)playActionNumber:(int)actionNumber;

@end
