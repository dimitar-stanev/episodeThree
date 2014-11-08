//
//  GameSceneView.m
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "GameSceneView.h"
#import "ProgrammerView.h"

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
        for ( int i = 0; i < 6; i++ ) {
            
            ProgrammerView *programmerButton = [[[NSBundle mainBundle] loadNibNamed:@"ProgrammerView"owner:nil options:nil] objectAtIndex:0];
            [programmerButton setProgrammerImage:@"character_fat_pink_one_140" andDirection:[directions[i] intValue]];
            [_programmerViews[i] addSubview:programmerButton];
            [programmerButtons addObject:programmerButton];
        }
        
        
    }
}

@end
