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

-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if ( self ) {
        _programmerImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Programmer-128"]];
        [_programmerImage setFrame:CGRectMake(15, 5, 40, 40)];
        [self addSubview:_programmerImage];
    }
    
    return self;
}

@end
