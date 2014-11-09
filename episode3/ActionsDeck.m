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
    
#warning INITIALIZE THE ACTIONS HERE !!!

    NSMutableArray *newDeck = [[NSMutableArray alloc] init];
    
    Action *energyMana1 = [[Action alloc ] init];
    energyMana1.effectOnEnergy = -0.5;
    energyMana1.effectOnConcentration = 0;
    energyMana1.effectOnHealth = 0;
    energyMana1.numberOfPeopleAffected = 1;
    energyMana1.disablesPlayer = NO;
    energyMana1.manaCost = 1;
    [self addObject:energyMana1 toArray:newDeck count:4];
    
    Action *energyMana2 = [[Action alloc ] init];
    energyMana2.effectOnEnergy = -1;
    energyMana2.effectOnConcentration = 0;
    energyMana2.effectOnHealth = 0;
    energyMana2.numberOfPeopleAffected = 1;
    energyMana2.disablesPlayer = NO;
    energyMana2.manaCost = 4;
    [self addObject:energyMana2 toArray:newDeck count:4];
    
    Action *energyMana4 = [[Action alloc ] init];
    energyMana4.effectOnEnergy = -0.7;
    energyMana4.effectOnConcentration = 0;
    energyMana4.effectOnHealth = 0;
    energyMana4.numberOfPeopleAffected = 6;
    energyMana4.disablesPlayer = NO;
    energyMana4.manaCost = 4;
    [self addObject:energyMana4 toArray:newDeck count:4];
    
    Action *concentrationMana1 = [[Action alloc ] init];
    concentrationMana1.effectOnEnergy = 0;
    concentrationMana1.effectOnConcentration = -0.5;
    concentrationMana1.effectOnHealth = 0;
    concentrationMana1.numberOfPeopleAffected = 1;
    concentrationMana1.disablesPlayer = NO;
    concentrationMana1.manaCost = 1;
    [self addObject:concentrationMana1 toArray:newDeck count:4];
    
    Action *concentrationMana2 = [[Action alloc ] init];
    concentrationMana2.effectOnEnergy = 0;
    concentrationMana2.effectOnConcentration = -1;
    concentrationMana2.effectOnHealth = 0;
    concentrationMana2.numberOfPeopleAffected = 1;
    concentrationMana2.disablesPlayer = NO;
    concentrationMana2.manaCost = 2;
    [self addObject:concentrationMana2 toArray:newDeck count:4];
    
    Action *concentrationMana4 = [[Action alloc ] init];
    concentrationMana4.effectOnEnergy = 0;
    concentrationMana4.effectOnConcentration = -0.7;
    concentrationMana4.effectOnHealth = 0;
    concentrationMana4.numberOfPeopleAffected = 6;
    concentrationMana4.disablesPlayer = NO;
    concentrationMana4.manaCost = 4;
    [self addObject:concentrationMana4 toArray:newDeck count:4];
    
    Action *healthMana1 = [[Action alloc ] init];
    healthMana1.effectOnEnergy = 0;
    healthMana1.effectOnConcentration = 0;
    healthMana1.effectOnHealth = -0.5;
    healthMana1.numberOfPeopleAffected = 1;
    healthMana1.disablesPlayer = NO;
    healthMana1.manaCost = 1;
    [self addObject:healthMana1 toArray:newDeck count:4];
    
    Action *healthMana2 = [[Action alloc ] init];
    healthMana2.effectOnEnergy = 0;
    healthMana2.effectOnConcentration = 0;
    healthMana2.effectOnHealth = -0.1;
    healthMana2.numberOfPeopleAffected = 1;
    healthMana2.disablesPlayer = NO;
    healthMana2.manaCost = 2;
    [self addObject:healthMana2 toArray:newDeck count:4];
    
    Action *healthMana4 = [[Action alloc ] init];
    healthMana4.effectOnEnergy = 0;
    healthMana4.effectOnConcentration = 0;
    healthMana4.effectOnHealth = -0.7;
    healthMana4.numberOfPeopleAffected = 6;
    healthMana4.disablesPlayer = NO;
    healthMana4.manaCost = 4;
    healthMana4.imagePath = @"actionIcon_disease.jpg";
    [self addObject:healthMana4 toArray:newDeck count:4];
    
    Action *removePlayer = [[Action alloc ] init];
    removePlayer.effectOnEnergy = 0;
    removePlayer.effectOnConcentration = 0;
    removePlayer.effectOnHealth = 0;
    removePlayer.numberOfPeopleAffected = 1;
    removePlayer.disablesPlayer = YES;
    removePlayer.manaCost = 3;
    [self addObject:removePlayer toArray:newDeck count:12];


    Action *addWork = [[Action alloc ] init];
    addWork.effectOnEnergy = 0;
    addWork.effectOnConcentration = 0;
    addWork.effectOnHealth = 0;
    addWork.numberOfPeopleAffected = 1;
    addWork.disablesPlayer = NO;
    addWork.manaCost = 5;
    addWork.addWork = 10;
    [self addObject:addWork toArray:newDeck count:5];
    
    self.allDrawnActions = newDeck;
}

-(void)addObject:(id)object toArray:(NSMutableArray*) array count:(int) count
{
    for (int i = 0; i < count; i++) {
        [array addObject:object];
        
    }
}

-(NSMutableArray*)drawCards {
    
    int firstCard = arc4random() % (self.allDrawnActions.count);
    int secondCard = arc4random() % (self.allDrawnActions.count);
    int thirdCard = arc4random() % (self.allDrawnActions.count);
    int fourthCard = arc4random() % (self.allDrawnActions.count);
    
    NSMutableArray *arrayToReturn = [[NSMutableArray alloc] initWithObjects: self.allDrawnActions[firstCard], self.allDrawnActions[secondCard], self.allDrawnActions[thirdCard], self.allDrawnActions[fourthCard], nil ];

    [self.allDrawnActions removeObjectAtIndex:firstCard];
    [self.allDrawnActions removeObjectAtIndex:secondCard];
    [self.allDrawnActions removeObjectAtIndex:thirdCard];
    [self.allDrawnActions removeObjectAtIndex:fourthCard];
    
    
    return arrayToReturn;
}

-(Action*) replaceCard {
    int cardIndex = arc4random()%self.allDrawnActions.count;
    [self.allDrawnActions removeObjectAtIndex:cardIndex];
    if (cardIndex < self.allDrawnActions.count) {
        return self.allDrawnActions[cardIndex];
    }
    return self.allDrawnActions[0];
}

@end
