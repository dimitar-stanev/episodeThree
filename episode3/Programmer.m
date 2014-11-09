//
//  Programmer.m
//  episode3
//
//  Created by Ivan Raychev on 11/9/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "Programmer.h"

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

@end
