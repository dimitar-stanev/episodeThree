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

@property (weak, nonatomic) IBOutlet UIView *player1View;
@property (weak, nonatomic) IBOutlet UIView *player2View;
@property (weak, nonatomic) IBOutlet UIView *player3View;
@property (weak, nonatomic) IBOutlet UIView *player4View;
@property (weak, nonatomic) IBOutlet UIView *player5View;
@property (weak, nonatomic) IBOutlet UIView *player6View;

@property (strong, nonatomic) NSArray *playerViews;
@property (strong, nonatomic) NSArray *playerButtons;

@end

@implementation GameSceneView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if ( self ) {
//        self.playerViews = @[_player1View, _player2View, _player3View, _player4View, _player5View, _player6View];
//        
//        NSMutableArray *playerButtons = [[NSMutableArray alloc] init];
//        for ( int i = 0; i < 6; i++ ) {
//            
////            ProgrammerView *programmerButton = [[[NSBundle mainBundle] loadNibNamed:@"GameSceneView"owner:nil options:nil] objectAtIndex:0];
////            [self.gameSceneHolderView addSubview:self.gameSceneView];
//        }
    }
    
    return self;
}

@end
