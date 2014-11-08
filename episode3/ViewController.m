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
@property (weak, nonatomic) IBOutlet UITableView *rightButtonsTable;
@property (strong, nonatomic) NSMutableArray *actionsDeck;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view, typically from a nib.
    self.gameSceneView = [[[NSBundle mainBundle] loadNibNamed:@"GameSceneView"owner:nil options:nil] objectAtIndex:0];
    [self.gameSceneHolderView addSubview:self.gameSceneView];
    
    // Set tableView delegate and source
    self.rightButtonsTable.delegate = self;
    self.rightButtonsTable.dataSource = self;
    
    // Create Deck
    // Test deck at the moment
    
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
//    [self.view addSubview:view];
//    [view setBackgroundColor:[UIColor redColor]];
//    [UIView animateWithDuration:1 animations:^(void){
//        [view setFrame:CGRectMake(200, 200, 30, 30)];
//    } completion:^(BOOL finished){
//        if (finished) {
//            [UIView animateWithDuration:5 animations:^(void){
//                [view setFrame:CGRectMake(600, 200, 30, 30)];
//            }
//                completion:^(BOOL finished) {
//                    [UIView animateWithDuration:5 animations:^(void){
//                        [view setFrame:CGRectMake(50, 50, 30, 30)];
//                    }];
//                }];
//        }
//    }];
}

- (IBAction)buttonClicked:(id)sender {
    [UIView animateWithDuration:2 animations:^(void){
        self.view.backgroundColor = [UIColor yellowColor];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"ASDF" forState:UIControlStateNormal];
//    [cell addSubview:btn];
//    [cell setBackgroundView:btn];
//    UIImageView *image = UIImage
    UIImage *img = [UIImage imageNamed:@"womens_circle_2.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
    [cell setBackgroundView:imageView];
//    [cell setBackgroundColor:[UIColor redColor]];
//    [cell setMaskView:btn];
//    [cell.textLabel setText:@"ASDF"];
     return cell;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ROW SELECTED : %ld", (long)[indexPath row]);
    [tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

@end
