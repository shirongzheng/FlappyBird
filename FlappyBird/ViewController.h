//
//  ViewController.h
//  FlappyBird
//
//  Created by Shirong Zheng on 16/9/2.
//  Copyright © 2016年 IconTech. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdJump;
int RandTopColPos;
int RandBottomColPos;
int ScoreNumber;

@interface ViewController : UIViewController{
    IBOutlet UIImageView *columnTop;
    IBOutlet UIImageView *columnBottom;
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *startGame;
    IBOutlet UIImageView *top;
    IBOutlet UIImageView *bottom;
    IBOutlet UILabel *ScoreLabel;
    IBOutlet UIButton *btnRestartGame;
    
    
    NSTimer *BirdMove;
    NSTimer *ColumnMove;
    
}

-(IBAction)startGame:(id)sender;
-(void)BirdMoving;
-(void)ColumnMoving;
-(void)RePaintColumns;
-(void)GameOver;
-(IBAction)RestartGame:(id)sender;

@end

