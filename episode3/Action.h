//
//  Action.h
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Action : NSObject
@property (nonatomic) NSInteger effectOnEnergy;
@property (nonatomic) NSInteger effectOnConcentration;
@property (nonatomic) NSInteger effectOnHealth;
@property (strong, nonatomic) NSString *imagePath;
@property (nonatomic) NSInteger numberOfPeopleAffected;
@end
