//
//  Action.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "Action.h"

@implementation Action

-(UIImage*) createActionImage {
    UIImage *imageToReturn = [UIImage imageNamed:self.imagePath];
    return imageToReturn;
}

@end
