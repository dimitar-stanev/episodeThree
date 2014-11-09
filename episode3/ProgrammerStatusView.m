//
//  ProgrammerStatusView.m
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ProgrammerStatusView.h"

@interface ProgrammerStatusView ()
@property (weak, nonatomic) IBOutlet UILabel *concentrationLabel;
@property (weak, nonatomic) IBOutlet UILabel *energyLabel;
@property (weak, nonatomic) IBOutlet UILabel *healthLabel;

@end

@implementation ProgrammerStatusView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setConcentration:(double)concentration color:(UIColor*)concentrationColor energy:(double)energy color:(UIColor*)energyColor health:(double)health color:(UIColor*)healthColor
{
    [_concentrationLabel setText:[NSString stringWithFormat:@"%.1f", concentration]];
    [_concentrationLabel setTextColor:concentrationColor];
    [_energyLabel setText:[NSString stringWithFormat:@"%.1f", energy]];
    [_energyLabel setTextColor:energyColor];
    [_healthLabel setText:[NSString stringWithFormat:@"%.1f", health]];
    [_healthLabel setTextColor:healthColor];
}

@end
