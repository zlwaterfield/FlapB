//
//  GameViewController.h
//  FlapB
//
//  Created by Zach Waterfield on 2014-07-08.
//
//

#import <UIKit/UIKit.h>

int BirdFlight;
int RandomTopTunnel;
int RandomBottomTunnel;
int ScoreValue;
NSInteger HightScoreValue;

@interface GameViewController : UIViewController
{
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *Start;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdMovement;
    NSTimer *TunnelMovement;
}

-(IBAction)Start:(id)sender;
-(void)BirdMoving;
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
