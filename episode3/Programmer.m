//
//  Programmer.m
//  episode3
//
//  Created by Ivan Raychev on 11/9/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "Programmer.h"
#import "Action.h"

@implementation Programmer

-(instancetype)initWithImage:(NSString*)imageName direction:(Direction)direction concentration:(int)concentration energy:(int)energy health:(int)health
{
    self = [super init];
    
    if ( nil != self ) {
        self.programmerView = [[[NSBundle mainBundle] loadNibNamed:@"ProgrammerView"owner:nil options:nil] objectAtIndex:0];
        [self.programmerView setProgrammerImage:imageName programmer:self andDirection:direction];
        
        self.programmerStatusView = [[[NSBundle mainBundle] loadNibNamed:@"ProgrammerStatusView"owner:nil options:nil] objectAtIndex:0];
        
        _concentration = concentration;
        _energy = energy;
        _health = health;
        
        _concentrationState = [[ProgrammerState alloc] init];
        _energyState = [[ProgrammerState alloc] init];
        _healthState = [[ProgrammerState alloc] init];
        
        [self updateStatusView];
    }
    
    return self;
}

-(void)updateStatusView
{
    double concentration = _concentrationState.efficiency * _concentration;
    double energy = _energyState.efficiency * _energy;
    double health = _healthState.efficiency * _health;
    
    UIColor *concentrationColor = (_concentrationState.timeLeft == 0) ? [UIColor blackColor] : (_concentrationState.immune) ? [UIColor greenColor] : [UIColor redColor];
    UIColor *energyColor = (_energyState.timeLeft == 0) ? [UIColor blackColor] : (_energyState.immune) ? [UIColor greenColor] : [UIColor redColor];
    UIColor *healthColor = (_healthState.timeLeft == 0) ? [UIColor blackColor] : (_healthState.immune) ? [UIColor greenColor] : [UIColor redColor];
    
    [self.programmerStatusView setConcentration:concentration color:concentrationColor energy:energy color:energyColor health:health color:healthColor];
}

-(BOOL)canBeAffectedByAction:(Action *)action
{
    BOOL result = YES;
    
    if ( 0 != action.effectOnConcentration && 0 != _concentrationState.timeLeft ) result = NO;
    else if ( 0 != action.effectOnEnergy && 0 != _energyState.timeLeft ) result = NO;
    else if ( 0 != action.effectOnHealth && 0 != _healthState.timeLeft ) result = NO;
    
    return result;
}

-(void)affectedByAction:(Action *)action
{
    if ( 0 != action.effectOnConcentration ) {
        [_concentrationState setEfficiency:(1+action.effectOnConcentration)];
        [_concentrationState setTimeLeft:30];
        [_concentrationState setImmune:NO];
    }
    
    else if ( 0 != action.effectOnEnergy ) {
        [_energyState setEfficiency:(1+action.effectOnEnergy)];
        [_energyState setTimeLeft:30];
        [_energyState setImmune:NO];
    }
    
    else if ( 0 != action.effectOnHealth ) {
        [_healthState setEfficiency:(1+action.effectOnHealth)];
        [_healthState setTimeLeft:30];
        [_healthState setImmune:NO];
    }
    
    else if ( YES == action.disablesPlayer ) {
        //TODO - add disable player
    }
    
    else if ( NO ) {
        //TODO - add requirements change
    }
}

-(void)update
{
    [self updateStatusView];
}

@end
