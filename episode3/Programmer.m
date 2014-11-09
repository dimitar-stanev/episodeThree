//
//  Programmer.m
//  episode3
//
//  Created by Ivan Raychev on 11/9/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "Programmer.h"
#import "Action.h"

@implementation Programmer {
    BOOL _removed;
    NSTimeInterval _removedTime;
}

-(instancetype)initWithImage:(NSString*)imageName direction:(Direction)direction concentration:(int)concentration energy:(int)energy health:(int)health
{
    self = [super init];
    
    if ( nil != self ) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(update) name:@"timerTicked" object:nil];
        
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
    if ( !_removed ) {
        double concentration = _concentrationState.efficiency * _concentration;
        double energy = _energyState.efficiency * _energy;
        double health = _healthState.efficiency * _health;
        
        UIColor *concentrationColor = (_concentrationState.timeLeft == 0) ? [UIColor blackColor] : (_concentrationState.immune) ? [UIColor greenColor] : [UIColor redColor];
        UIColor *energyColor = (_energyState.timeLeft == 0) ? [UIColor blackColor] : (_energyState.immune) ? [UIColor greenColor] : [UIColor redColor];
        UIColor *healthColor = (_healthState.timeLeft == 0) ? [UIColor blackColor] : (_healthState.immune) ? [UIColor greenColor] : [UIColor redColor];
        
        [self.programmerStatusView setConcentration:concentration color:concentrationColor energy:energy color:energyColor health:health color:healthColor];
        
        double progress = (concentration + energy + health) / 60;
        [_vc addProgress:progress];
    }
}

-(BOOL)canBeAffectedByAction:(Action *)action
{
    BOOL result = YES;
    
    if ( _removed ) result = NO;
    else if ( 0 != action.effectOnConcentration && 0 != _concentrationState.timeLeft ) result = NO;
    else if ( 0 != action.effectOnEnergy && 0 != _energyState.timeLeft ) result = NO;
    else if ( 0 != action.effectOnHealth && 0 != _healthState.timeLeft ) result = NO;
    
    return result;
}

-(void)affectedByAction:(Action *)action
{
    if ( _removed == NO ) {
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
            _removed = YES;
            _removedTime = 30.0;
            [_programmerStatusView.superview setHidden:YES];
            [_programmerView setHidden:YES];
        }
        
        else if ( NO ) {
            //TODO - add requirements change
        }
    }
}

-(void)update
{
    if ( _removed ) {
        _removedTime -= 1;
        if ( _removedTime <= 0 ) {
            _removedTime = 0;
            _removed = NO;
            [_programmerStatusView.superview setHidden:NO];
            [_programmerView setHidden:NO];
        }
    }
    
    if ( _concentrationState.timeLeft > 0 ) {
        _concentrationState.timeLeft -= 1;
        if ( _concentrationState.timeLeft <= 0 ) {
            if ( _concentrationState.immune ) {
                _concentrationState.immune = NO;
                _concentrationState.timeLeft = 0;
            } else {
                _concentrationState.immune = YES;
                _concentrationState.timeLeft += 10;
                _concentrationState.efficiency = 1;
            }
        }
    }
    
    if ( _energyState.timeLeft > 0 ) {
        _energyState.timeLeft -= 1;
        if ( _energyState.timeLeft <= 0 ) {
            if ( _energyState.immune ) {
                _energyState.immune = NO;
                _energyState.timeLeft = 0;
            } else {
                _energyState.immune = YES;
                _energyState.timeLeft += 10;
                _energyState.efficiency = 1;
            }
        }
    }
    
    if ( _healthState.timeLeft > 0 ) {
        _healthState.timeLeft -= 1;
        if ( _healthState.timeLeft <= 0 ) {
            if ( _healthState.immune ) {
                _healthState.immune = NO;
                _healthState.timeLeft = 0;
            } else {
                _healthState.immune = YES;
                _healthState.timeLeft += 10;
                _healthState.efficiency = 1;
            }
        }
    }
    
    [self updateStatusView];

}

@end
