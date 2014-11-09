//
//  ProgrammerView.h
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

typedef enum {
    DirectionLeft,
    DirectionRight,
    DirectionUp,
    DirectionDown
} Direction;

#import <UIKit/UIKit.h>
@class Programmer;

@interface ProgrammerView : UIButton

@property (strong, nonatomic) Programmer *programmer;

-(void)setProgrammerImage:(NSString *)programmerImage programmer:(Programmer*)programmer andDirection:(Direction)direction;

@end
