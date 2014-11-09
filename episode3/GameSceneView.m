//
//  GameSceneView.m
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "GameSceneView.h"
#import "ProgrammerView.h"
#import "Programmer.h"
#import "ProgrammerStatusView.h"
#import "Action.h"
#import "ViewController.h"

@interface GameSceneView()

@property (weak, nonatomic) IBOutlet UIView *programmer1View;
@property (weak, nonatomic) IBOutlet UIView *programmer2View;
@property (weak, nonatomic) IBOutlet UIView *programmer3View;
@property (weak, nonatomic) IBOutlet UIView *programmer4View;
@property (weak, nonatomic) IBOutlet UIView *programmer5View;
@property (weak, nonatomic) IBOutlet UIView *programmer6View;

@property (weak, nonatomic) IBOutlet UIView *programmer1Status;
@property (weak, nonatomic) IBOutlet UIView *programmer2Status;
@property (weak, nonatomic) IBOutlet UIView *programmer3Status;
@property (weak, nonatomic) IBOutlet UIView *programmer4Status;
@property (weak, nonatomic) IBOutlet UIView *programmer5Status;
@property (weak, nonatomic) IBOutlet UIView *programmer6Status;

@property (strong, nonatomic) NSArray *programmerViews;
@property (strong, nonatomic) NSArray *programmerButtons;
@property (strong, nonatomic) NSArray *programmerStatuses;
@property (strong, nonatomic) NSArray *programmerStatusViews;
@property (strong, nonatomic) NSArray *programmers;


@end

@implementation GameSceneView

-(void)awakeFromNib
{
    [super awakeFromNib];
    if ( self ) {        
        self.programmerViews = @[_programmer1View, _programmer2View, _programmer3View, _programmer4View, _programmer5View, _programmer6View];
        self.programmerStatuses = @[_programmer1Status, _programmer2Status, _programmer3Status, _programmer4Status, _programmer5Status, _programmer6Status];
        NSArray *directions = @[@(DirectionUp), @(DirectionUp), @(DirectionUp), @(DirectionDown), @(DirectionDown), @(DirectionDown)];
        NSArray *images = @[@"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140"];
        NSArray *concentration = @[@6, @2, @2, @4, @4, @2];
        NSArray *energy = @[@2, @6, @2, @4, @2, @4];
        NSArray *health = @[@2, @2, @6, @2, @4, @4];
        
        NSMutableArray *programmerButtons = [[NSMutableArray alloc] init];
        NSMutableArray *programmerStatusViews = [[NSMutableArray alloc] init];
        NSMutableArray *programmers = [[NSMutableArray alloc] init];
        
        for ( int i = 0; i < 6; i++ ) {
            Programmer *programmer = [[Programmer alloc] initWithImage:images[i] direction:[directions[i] intValue] concentration:[concentration[i] intValue] energy:[energy[i] intValue] health:[health[i] intValue]];
            
            ProgrammerView *programmerButton = [programmer programmerView];
            [programmerButton addTarget:self action:@selector(didPressProgrammerButton:) forControlEvents:UIControlEventTouchUpInside];
            [_programmerViews[i] addSubview:programmerButton];
            [programmerButtons addObject:programmerButton];
            
            ProgrammerStatusView *statusView = [programmer programmerStatusView];
            [_programmerStatuses[i] addSubview:statusView];
            [programmerStatusViews addObject:statusView];
            
            [programmers addObject:programmer];
            
        }
        
        _programmerButtons = [programmerButtons copy];
        _programmerStatusViews = [programmerStatusViews copy];
        _programmers = [programmers copy];
    }
}

-(void)didPressProgrammerButton:(ProgrammerView*)button
{
    NSLog(@"tapped programmer");
    if ( _isActionSelected ) {
        BOOL successful = NO;
        if ( 1 != [_currentChosenAction numberOfPeopleAffected] ) {
            for ( Programmer *programmer in _programmers ) {
                if ( [programmer canBeAffectedByAction:_currentChosenAction] ) {
                    [programmer affectedByAction:_currentChosenAction];
                    successful = YES;
                }
            }
        }
        else if ( [button.programmer canBeAffectedByAction:_currentChosenAction] ) {
            [button.programmer affectedByAction:_currentChosenAction];
            successful = YES;
        }
        [_vc playedCardSuccessful:successful];
    }
}

@end
