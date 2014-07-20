//
//  GameViewController.m
//  FlapB
//
//  Created by Zach Waterfield on 2014-07-08.
//
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

-(IBAction)Start:(id)sender {
    
    Start.hidden = YES;
    Exit.hidden = YES;
    
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
}

-(void)PlaceTunnels {
    
    RandomTopTunnel= arc4random() %350;
    RandomTopTunnel = RandomTopTunnel - 228;
    RandomBottomTunnel = RandomTopTunnel + 695;
    
    TunnelTop.center = CGPointMake(340, RandomTopTunnel);
    TunnelBottom.center = CGPointMake(340, RandomBottomTunnel);
    
}

-(void)TunnelMoving {
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if(TunnelTop.center.x < -28) {
        
        [self PlaceTunnels];
    }
    
    if (TunnelTop.center.x == 30) {
        
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame)) {
        
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)) {
        
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame)) {
        
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)) {
        
        [self GameOver];
    }
    
}

-(void)BirdMoving {
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y - BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if (BirdFlight < -15) {
        
        BirdFlight= -15;
    }
    
    if(BirdFlight > 0) {
        
        Bird.image = [UIImage imageNamed:@"BU.png"];
    }
    
    if(BirdFlight < 0) {
        
        Bird.image = [UIImage imageNamed:@"BD.png"];
    }
}

-(void)Score {
    
    ScoreValue = ScoreValue + 1;
    ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreValue];
}

-(void)GameOver {
    
    if (ScoreValue > HightScoreValue) {
        
        [ [NSUserDefaults standardUserDefaults] setInteger:ScoreValue forKey:@"HighScoreValue"];
        
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    BirdFlight = 25;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    Exit.hidden = YES;
    ScoreValue = 0;
    
    HightScoreValue = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
