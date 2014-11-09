//
//  ProgrammerView.m
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ProgrammerView.h"

@implementation ProgrammerView {
    UIImageView *_programmerImage;
    UIImageView *_effectImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setProgrammerImage:(UIImage *)programmerImage programmer:(Programmer*)programmer andDirection:(Direction)direction
{
    self.programmer = programmer;
    
    CGFloat angle;
    switch ( direction ) {
        case DirectionUp:
        {
            angle = 0;
            break;
        }
        case DirectionRight:
        {
            angle = M_PI/2;
            break;
        }
        case DirectionDown:
        {
            angle = M_PI;
            break;
        }
        case DirectionLeft:
        {
            angle = 3*M_PI/2;
            break;
        }
    }
    
    _programmerImage = [[UIImageView alloc] initWithImage:programmerImage];
    [_programmerImage setFrame:CGRectMake(0, 0, 70, 70)];
    [_programmerImage setTransform:CGAffineTransformMakeRotation(angle)];
    [_programmerImage setUserInteractionEnabled:NO];
//    _programmerImage set
    [self addSubview:_programmerImage];
    
    
    _effectImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    [_effectImage setUserInteractionEnabled:NO];
    [_effectImage setAlpha:0];
    [self addSubview:_effectImage];
}

-(void)showEffectImage:(NSString*)imageName
{
    [_effectImage setImage:[UIImage imageNamed:imageName]];
    [UIView animateWithDuration:0.9 animations:^(void) {
        [_effectImage setAlpha:1];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.9 animations:^(void) {
            [_effectImage setAlpha:0];
        }];
    }];
}

-(void)setProgrammerImage:(UIImage *)image
{
    [_programmerImage setImage:image];
}

@end
