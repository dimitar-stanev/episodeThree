//
//  Action.h
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Action : NSObject
@property (nonatomic) double effectOnEnergy;
@property (nonatomic) double effectOnConcentration;
@property (nonatomic) double effectOnHealth;
@property (strong, nonatomic) NSString *imagePath;
@property (nonatomic) NSInteger numberOfPeopleAffected;
@property (nonatomic) BOOL disablesPlayer;
@property (nonatomic) int manaCost;
@property (nonatomic) int addWork;
@end
