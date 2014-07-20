//
//  ViewController.m
//  FlapB
//
//  Created by Zach Waterfield on 2014-07-08.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    HighScoreValue = [ [NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreValue"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreValue];
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
