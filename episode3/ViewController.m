//
//  ViewController.m
//  episode3
//
//  Created by Dimitar on 11/8/14.
//  Copyright (c) 2014 Dimitar. All rights reserved.
//

#import "ViewController.h"
#import "GameSceneView.h"
#import "Player.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet GameSceneView *gameSceneView;
@property (weak, nonatomic) IBOutlet UIView *gameSceneHolderView;
@property (weak, nonatomic) IBOutlet UIView *topBarView;
@property (weak, nonatomic) IBOutlet UITableView *rightButtonsTable;
@property (strong, nonatomic) NSMutableArray *actionsDeck;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (nonatomic) float timePassed;
@property (weak, nonatomic) IBOutlet UILabel *timePassedLabel;
@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *manaPointsCounter;
@property (strong, nonatomic) Player *player;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    self.gameSceneView = [[[NSBundle mainBundle] loadNibNamed:@"GameSceneView"owner:nil options:nil] objectAtIndex:0];
//    [self.gameSceneHolderView addSubview:self.gameSceneView];
    
    // Set tableView delegate and source
    self.rightButtonsTable.delegate = self;
    self.rightButtonsTable.dataSource = self;
    
    // Create Deck
    // Test deck at the moment
    self.player = [[Player alloc] init];
    self.player.manaPointsLeft = 10;
    
    
    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
    [view setImage:[UIImage imageNamed:@"Programmer-128.png"]];
    
//    UIImageView *view2 = [[UIView alloc] initWithFrame:CGRectMake(80, 80, 30, 30)];
    
//    [self.view addSubview:view];
//    [UIView animateWithDuration:5 animations:^(void){
//        [view setFrame:CGRectMake(200, 200, 30, 30)];
//        [view setImage: [UIImage imageNamed:@"womens_circle_2.jpg"]];
//    } completion:^(BOOL finished){
//        if (finished) {
//            [UIView animateWithDuration:5 animations:^(void){
//                [view setFrame:CGRectMake(600, 200, 30, 30)];
//                [view setImage:[UIImage imageNamed:@"Programmer-128.png"]];
//            }
//                completion:^(BOOL finished) {
//                    [UIView animateWithDuration:5 animations:^(void){
//                        [view setFrame:CGRectMake(50, 50, 30, 30)];
//                    }];
//                }];
//        }
//    }];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                  target: self
                                                selector:@selector(updateTimer)
                                                userInfo: nil repeats:YES];
    self.timePassed = 0;
    
}

-(void) updateTimer {
    self.timePassed = self.timePassed + 0.1;
    if (self.timePassed > 180) {
        [self.timer invalidate];
        self.timer = nil;
    }
    if ( ((int)self.timePassed%5) == 0 && self.timePassed < (float)((int)self.timePassed)+0.1 && self.timePassed > 1)   {
        self.player.manaPointsLeft++;
        [self.manaPointsCounter setText:[NSString stringWithFormat:@"%d", self.player.manaPointsLeft]];
    }
    [self.progressView setProgress:self.timePassed/120.0];
    [self.timePassedLabel setText:[NSString stringWithFormat:@"%.1f", self.timePassed]];
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
