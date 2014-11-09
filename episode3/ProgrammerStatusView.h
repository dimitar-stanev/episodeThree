//
//  ProgrammerStatusView.h
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgrammerStatusView : UIView

-(void)setConcentration:(double)concentration color:(UIColor*)concentrationColor energy:(double)energy color:(UIColor*)energyColor health:(double)health color:(UIColor*)healthColor;

@end
