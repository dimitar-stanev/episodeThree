//
//  Player.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "Player.h"
#import "Action.h"


@implementation Player

-(Action*)playActionNumber:(int)actionNumber {
    Action *actionToReturn = [[Action alloc] init];
    actionToReturn = [self.currentActions objectAtIndex:actionNumber];
    [self.currentActions removeObjectAtIndex:actionNumber];
    return actionToReturn;
}

@end
