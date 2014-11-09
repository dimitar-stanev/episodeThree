//
//  ActionsDeck.h
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Action.h"

@interface ActionsDeck : NSObject

@property (strong, nonatomic) NSMutableArray *allDrawnActions;

-(void) initializeDeck;
-(NSMutableArray*) drawCards;
-(Action*) replaceCard;

@end
