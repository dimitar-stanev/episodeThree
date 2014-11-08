//
//  ProgrammerState.m
//  episode3
//
//  Created by Ivan Raychev on 11/9/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ProgrammerState.h"

@implementation ProgrammerState

-(instancetype)init
{
    self = [super init];
    
    if ( self ) {
        _efficiency = 1;
        _timeLeft = 0;
        _immune = NO;
    }
    
    return self;
}

@end
