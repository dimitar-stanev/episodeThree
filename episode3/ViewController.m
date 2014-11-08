//
//  ViewController.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
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
