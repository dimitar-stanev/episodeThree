//
//  ActionsDeck.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ActionsDeck.h"

@implementation ActionsDeck

-(void)initializeDeck {
    
    NSMutableArray *newDeck = [[NSMutableArray alloc] init];
    self.allDrawnActions = newDeck;
}

-(NSArray *)drawCards {
    
    int firstCard = arc4random() % (self.allDrawnActions.count+1);
    int secondCard = arc4random() % (self.allDrawnActions.count+1);
    int thirdCard = arc4random() % (self.allDrawnActions.count+1);
    int fourthCard = arc4random() % (self.allDrawnActions.count+1);
    
    [self.allDrawnActions removeObjectAtIndex:firstCard];
    [self.allDrawnActions removeObjectAtIndex:secondCard];
    [self.allDrawnActions removeObjectAtIndex:thirdCard];
    [self.allDrawnActions removeObjectAtIndex:fourthCard];
    
    NSArray *arrayToReturn = [[NSArray alloc] initWithObjects: self.allDrawnActions[firstCard], self.allDrawnActions[secondCard], self.allDrawnActions[thirdCard], self.allDrawnActions[fourthCard], nil ];
    
    return arrayToReturn;
}

-(Action*) replaceCard {
    int cardIndex = arc4random() % (self.allDrawnActions.count+1);
    [self.allDrawnActions removeObjectAtIndex:cardIndex];
    return self.allDrawnActions[cardIndex];
}

@end
