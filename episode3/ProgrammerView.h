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

@interface ProgrammerView : UIButton

-(void)setProgrammerImage:(NSString *)programmerImage andDirection:(Direction)direction;

@end
