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

@interface GameSceneView()

@property (weak, nonatomic) IBOutlet UIView *programmer1View;
@property (weak, nonatomic) IBOutlet UIView *programmer2View;
@property (weak, nonatomic) IBOutlet UIView *programmer3View;
@property (weak, nonatomic) IBOutlet UIView *programmer4View;
@property (weak, nonatomic) IBOutlet UIView *programmer5View;
@property (weak, nonatomic) IBOutlet UIView *programmer6View;

@property (strong, nonatomic) NSArray *programmerViews;
@property (strong, nonatomic) NSArray *programmerButtons;

@end

@implementation GameSceneView

-(void)awakeFromNib
{
    [super awakeFromNib];
    if ( self ) {
        self.programmerViews = @[_programmer1View, _programmer2View, _programmer3View, _programmer4View, _programmer5View, _programmer6View];
        NSArray *directions = @[@(DirectionLeft), @(DirectionUp), @(DirectionRight), @(DirectionLeft), @(DirectionDown), @(DirectionRight)];
                NSMutableArray *programmerButtons = [[NSMutableArray alloc] init];
        NSArray *images = @[@"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140", @"character_fat_pink_one_140"];
        
        for ( int i = 0; i < 6; i++ ) {
            Programmer *programmer = [[Programmer alloc] initWithImage:images[i] direction:[directions[i] intValue] concentration:4 energy:4 health:4];
            
            ProgrammerView *programmerButton = [programmer programmerView];
            [programmerButton addTarget:self action:@selector(didPressProgrammerButton:) forControlEvents:UIControlEventTouchUpInside];
            [_programmerViews[i] addSubview:programmerButton];
            [programmerButtons addObject:programmerButton];
            
            
        }
        
        
    }
}

-(void)didPressProgrammerButton:(ProgrammerView*)button
{
    NSLog(@"tapped programmer");
}

@end
