//
//  ViewController.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ViewController.h"
#import "GameSceneView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet GameSceneView *gameSceneView;
@property (weak, nonatomic) IBOutlet UIView *gameSceneHolderView;
@property (weak, nonatomic) IBOutlet UIView *topBarView;
@property (weak, nonatomic) IBOutlet UITableView *actionsTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.gameSceneView = [[[NSBundle mainBundle] loadNibNamed:@"GameSceneView"owner:nil options:nil] objectAtIndex:0];
    [self.gameSceneHolderView addSubview:self.gameSceneView];
}

- (IBAction)buttonClicked:(id)sender {
    [UIView animateWithDuration:2 animations:^(void){
        self.view.backgroundColor = [UIColor yellowColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
