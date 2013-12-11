//
//  MADViewController.m
//  Animation
//
//  Created by Luis Alfredo Hierro on 11/14/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController{

    CGPoint delta;
    NSTimer *timer;
    float ballRadius;//radius of the ball
    CGPoint translation; //specifies how many pixels the image will move
    float angle; //angle for rotation
    
    
}

-(IBAction)changeSliderValue
{
    _sliderLabel.text=[NSString stringWithFormat:@"%.2f", _ballSlider.value];
    //creates a new timer object with the slider's interval
    timer = [NSTimer scheduledTimerWithTimeInterval:_ballSlider.value
    target:self
             selector:@selector(onTimer)
                                  userInfo:nil
                                             repeats:YES];
    
}

- (void)viewDidLoad
{
    
	// Do any additional setup after loading the view, typically from a nib.
    //ball radius is half the width of the image
    ballRadius = _bounceBall.frame.size.width/2;
    delta = CGPointMake(12.0,4.0);
    [self changeSliderValue];
    [super viewDidLoad];
    
}
             
             
-(void) onTimer{
    
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_ballSlider.value//animate for the duration of time interval animat
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                                 animations:^{_bounceBall.transform =CGAffineTransformMakeScale(angle,angle);
                                     _bounceBall.center = CGPointMake(_bounceBall.center.x + delta.x, _bounceBall.center.y + delta.y);}
                     completion:NULL];
     [UIView commitAnimations];
    
    angle += 0.02; //amount by which you increment the angle
    //if it's a full rotation reset the angle
    if (angle>2*M_PI)
        angle=0;
    
    
    //if image touches walls reverse direction
    _bounceBall.center = CGPointMake(_bounceBall.center.x,_bounceBall.center.y+delta.y);
    if(_bounceBall.center.x>self.view.bounds.size.width- ballRadius||_bounceBall.center.x<ballRadius)
        delta.x=-delta.x;
    if(_bounceBall.center.y>self.view.bounds.size.height - ballRadius || _bounceBall.center.y<ballRadius)
        delta.y = -delta.y;
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ballSliderMoved:(UISlider *)sender {
    [timer invalidate];
    [self changeSliderValue];
    
    
}
@end
