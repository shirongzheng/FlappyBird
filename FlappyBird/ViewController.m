//
//  ViewController.m
//  FlappyBird
//
//  Created by Shirong Zheng on 16/9/2.
//  Copyright © 2016年 IconTech. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)RestartGame:(id)sender{
    startGame.hidden=YES;
    ScoreNumber=0;
    Bird.hidden=NO;
    ScoreLabel.text=[NSString stringWithFormat:@"0", ScoreNumber];
    columnTop.hidden=NO;
    columnBottom.hidden=NO;
    btnRestartGame.hidden=YES;
    Bird.center=CGPointMake(16, 312);
    BirdMove =[NSTimer scheduledTimerWithTimeInterval:0.05
                                               target:self
                                             selector:@selector(BirdMoving)
                                             userInfo:nil repeats:YES];
    [self RePaintColumns];
    
    ColumnMove =[NSTimer scheduledTimerWithTimeInterval:0.01
                                                 target:self
                                               selector:@selector (ColumnMoving)
                                               userInfo:nil
                                                repeats:YES];
    /*btnRestartGame.hidden=YES;
    startGame.hidden=NO;
    columnBottom.hidden=YES;
    columnTop.hidden=YES;
    Bird.hidden=YES;
    Bird.center=CGPointMake(16, 312);*/
}
-(IBAction)GameOver{
    [BirdMove invalidate];
    [ColumnMove invalidate];
    columnBottom.hidden=YES;
    columnTop.hidden=YES;
    startGame.hidden=YES;
    Bird.hidden=YES;
    btnRestartGame.hidden=NO;
}

-(IBAction)startGame:(id)sender{
    startGame.hidden=YES;
    ScoreNumber=0;
    Bird.hidden=NO;
    ScoreLabel.text=[NSString stringWithFormat:@"0", ScoreNumber];
    columnTop.hidden=NO;
    columnBottom.hidden=NO;
    BirdMove =[NSTimer scheduledTimerWithTimeInterval:0.05
                                               target:self
                                             selector:@selector(BirdMoving)
                                             userInfo:nil repeats:YES];
    [self RePaintColumns];
    
    ColumnMove =[NSTimer scheduledTimerWithTimeInterval:0.01
                                                 target:self
                                               selector:@selector (ColumnMoving)
                                               userInfo:nil
                                                repeats:YES];
    
}

-(void)RePaintColumns{
    
    
    RandTopColPos =arc4random() %350;
    RandTopColPos =RandTopColPos -220;
    RandBottomColPos =RandBottomColPos +655;
    
    columnTop.center =CGPointMake(348,RandTopColPos);
    columnBottom.center =CGPointMake(348,RandBottomColPos);
    
}
-(void)ColumnMoving{
    columnTop.center=CGPointMake(columnTop.center.x-1, columnTop.center.y);
    columnBottom.center=CGPointMake(columnBottom.center.x-1,columnBottom.center.y);
    
    if(columnTop.center.x ==-21){
        [self RePaintColumns];
    }
    if (CGRectIntersectsRect(Bird.frame,columnTop.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame,columnBottom.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame,top.frame)){
        [self GameOver];
    }
    if (CGRectIntersectsRect(Bird.frame,bottom.frame)){
        [self GameOver];
    }
    if (columnBottom.center.x==-6){
        ScoreNumber=ScoreNumber+1;
        //ScoreNumber++;
        ScoreLabel.text=[NSString stringWithFormat:@"%i", ScoreNumber];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    BirdJump=30;
}

-(void)BirdMoving{
    Bird.center=CGPointMake(Bird.center.x, Bird.center.y-BirdJump);
    
    BirdJump=BirdJump-5;
    if(BirdJump <-10){
        BirdJump=-10;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    columnTop.hidden=YES;
    columnBottom.hidden=YES;
    btnRestartGame.hidden=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

