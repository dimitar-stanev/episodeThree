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
#import "ActionsDeck.h"

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
@property (strong, nonatomic) ActionsDeck *drawnDeck;
@property (nonatomic) BOOL isActionSelected;
@property (strong, nonatomic) Action *currentChosenAction;

@property (assign, nonatomic) double progress;
@property (assign, nonatomic) double maxProgress;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.gameSceneView = [[[NSBundle mainBundle] loadNibNamed:@"GameSceneView"owner:nil options:nil] objectAtIndex:0];
    [self.gameSceneView setVc:self];
    [self.gameSceneHolderView addSubview:self.gameSceneView];
    
    self.rightButtonsTable.delegate = self;
    self.rightButtonsTable.dataSource = self;
    
    // Create Deck
    // Test deck at the moment
    self.player = [[Player alloc] init];
    self.player.manaPointsLeft = 10;
    self.player.currentActions = [[NSMutableArray alloc] init];
    
    self.drawnDeck = [[ActionsDeck alloc] init];
    [self.drawnDeck initializeDeck];
    self.player.currentActions = [self.drawnDeck drawCards];
    
    
//    UIImageView *view = [[UIImageView alloc] initWithFrame:CGRectMake(50, 50, 30, 30)];
//    [view setImage:[UIImage imageNamed:@"Programmer-128.png"]];
//    [view setImage:[UIImage imageNamed:@"Programmer-128.png"]];
    
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
    
    _progress = 0;
    _maxProgress = 120;
    
}

-(void) updateTimer {
    self.timePassed = self.timePassed + 0.1;
    if (self.timePassed > 180) {
        [self.timer invalidate];
        self.timer = nil;
        [self winGame];
    }
    if ( self.timePassed < (float)((int)self.timePassed)+0.1 && self.timePassed > 1 ) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"timerTicked" object:nil];
        
        if ( ((int)self.timePassed%5) == 0 )   {
            self.player.manaPointsLeft++;
            [self.manaPointsCounter setText:[NSString stringWithFormat:@"%d", self.player.manaPointsLeft]];
        }
    }
    [self.timePassedLabel setText:[NSString stringWithFormat:@"%.1f", self.timePassed]];
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
    
    switch([indexPath row]) {
        case 0: {
            UIImage *img = [UIImage imageNamed: [self.player.currentActions[0] imagePath] ];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
            [cell setBackgroundView:imageView];
        } break;
        case 1: {
            UIImage *img = [UIImage imageNamed: [self.player.currentActions[1] imagePath] ];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
            [cell setBackgroundView:imageView];
        } break;
        case 2: {
            UIImage *img = [UIImage imageNamed: [self.player.currentActions[2] imagePath] ];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
            [cell setBackgroundView:imageView];
        } break;
        case 3: {
            UIImage *img = [UIImage imageNamed: [self.player.currentActions[3] imagePath] ];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
            [cell setBackgroundView:imageView];
        } break;
    }
//    UIImage *img = [UIImage imageNamed:@"womens_circle_2.jpg"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:img];
//    [cell setBackgroundView:imageView];
     return cell;
 }

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"ROW SELECTED : %ld", (long)[indexPath row]);
    NSLog(@"CURRENT SELECTED CARD IS : %@", self.player.currentActions[[indexPath row]]);
    
    [tableView reloadData];

    if(self.isActionSelected) {
        self.isActionSelected = NO;
        _gameSceneView.isActionSelected = NO;
        [UIView animateWithDuration:1 animations:^(void){
            [[tableView cellForRowAtIndexPath:indexPath].backgroundView setAlpha:1];
        }];
        self.currentChosenAction = nil;
        _gameSceneView.currentChosenAction = nil;
    }
    else {
        self.isActionSelected = YES;
        _gameSceneView.isActionSelected = YES;
        [UIView animateWithDuration:0.7 animations:^(void){
            [[tableView cellForRowAtIndexPath:indexPath].backgroundView setAlpha:0.5];
        }];
        self.currentChosenAction = self.player.currentActions[[indexPath row]];
        _gameSceneView.currentChosenAction = self.player.currentActions[[indexPath row]];
        NSLog(@"%f", self.currentChosenAction.effectOnConcentration);
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0;
}

-(void)playedCardSuccessful:(BOOL)successful {
    if (successful == YES) {
        NSUInteger index = [self.player.currentActions indexOfObject:self.currentChosenAction];
        self.player.currentActions[index] =  [self.drawnDeck replaceCard];
        [self.rightButtonsTable reloadData];
        self.isActionSelected = NO;
        self.currentChosenAction = nil;
    }
    else {
        [self.rightButtonsTable reloadData];
        self.isActionSelected = NO;
        self.currentChosenAction = nil;
    }
}

-(void)addProgress:(double)progress
{
    _progress += progress;
    [self updateProgressBar];
}

-(void)addMaxProgress:(double)progress
{
    _maxProgress += progress;
    [self updateProgressBar];
}

-(void)updateProgressBar
{
    [self.progressView setProgress:_progress/_maxProgress];
    if ( _progress >= _maxProgress ) {
        [self.timer invalidate];
        self.timer = nil;
        [self loseGame];
    }
}

-(void)loseGame
{
    
}

-(void)winGame
{
    
}

@end
