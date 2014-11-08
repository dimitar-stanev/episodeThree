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
        [self.programmerView setProgrammerImage:imageName andDirection:direction];
        
        self.programmerStatusView = [[[NSBundle mainBundle] loadNibNamed:@"ProgrammerStatusView"owner:nil options:nil] objectAtIndex:0];
        
        _concentration = concentration;
        _energy = energy;
        _health = health;
        
        _concentrationState = [[ProgrammerState alloc] init];
        _energyState = [[ProgrammerState alloc] init];
        _healthState = [[ProgrammerState alloc] init];
    }
    
    return self;
}

-(void)updateStatusView
{
    double concentration = _concentrationState.efficiency * _concentration;
    double energy = _energyState.efficiency * _energy;
    double health = _healthState.efficiency * _health;
    
//    UIColor *concentrationColor = (_energyState.timeLeft == 0) ? 
    
    [self.programmerStatusView setConcentration:_concentration*_concentrationState.efficiency color:[UIColor blackColor] energy:_energy*_energyState.efficiency color:[UIColor blackColor] health:_health*_healthState.efficiency color:[UIColor blackColor]];
}



@end
