//
//  GameSceneView.h
//  episode3
//
//  Created by Ivan Raychev on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Action;
@class ViewController;
@interface GameSceneView : UIView

@property (nonatomic) BOOL isActionSelected;
@property (strong, nonatomic) Action *currentChosenAction;
@property (strong, nonatomic) ViewController *vc;

@end
