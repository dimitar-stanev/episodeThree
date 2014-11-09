//
//  Programmer.h
//  episode3
//
//  Created by Ivan Raychev on 11/9/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProgrammerState.h"
#import "ProgrammerView.h"
#import "ProgrammerStatusView.h"
#import "Action.h"

@interface Programmer : NSObject

@property (assign, nonatomic) int concentration;
@property (strong, nonatomic) ProgrammerState *concentrationState;
@property (assign, nonatomic) int energy;
@property (strong, nonatomic) ProgrammerState *energyState;
@property (assign, nonatomic) int health;
@property (strong, nonatomic) ProgrammerState *healthState;
@property (strong, nonatomic) ProgrammerView *programmerView;
@property (strong, nonatomic) ProgrammerStatusView *programmerStatusView;

-(instancetype)initWithImage:(NSString*)imageName direction:(Direction)direction concentration:(int)concentration energy:(int)energy health:(int)health;
-(BOOL)canBeAffectedByAction:(Action *)action;
-(void)affectedByAction:(Action *)action;

@end
