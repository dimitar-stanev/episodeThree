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
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setProgrammerImage:(NSString *)programmerImage andDirection:(Direction)direction
{
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
    
    _programmerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:programmerImage]];
    [_programmerImage setFrame:CGRectMake(0, 0, 70, 70)];
    [_programmerImage setTransform:CGAffineTransformMakeRotation(angle)];
    [_programmerImage setUserInteractionEnabled:NO];
//    _programmerImage set
    [self addSubview:_programmerImage];
    
}

@end
