//  ViewController.h
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

-(void)playedCardSuccessful:(BOOL)successful;

-(void)addProgress:(double)progress;

-(void)addMaxProgress:(double)progress;

@end

