//
//  MADViewController.m
//  Speed Text
//
//  Created by Luis Alfredo Hierro on 10/1/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

float seconds;
float keysPerSecond;
float keysPerMinute;
float caloriesBurnedPerHour;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    seconds = 5.00;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startButton:(UIButton *)sender {
    
    //create timer on run loop
    
    if(_timer.isValid==FALSE){//check that there is not an active timer
        [self reset]; //make sure user is not cheating
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerLabelCountdown) userInfo:nil repeats:YES];
    }
}
-(void) timerLabelCountdown{
    if(seconds>0.00 ){
    seconds =seconds-1;
    _timeLabel.text = [NSString stringWithFormat:@"%.2f",seconds];
    _charCounter.text = [NSString stringWithFormat:@"%d", _typingSpace.text.length];//update character count
    }
    else {
        
        [_timer invalidate];
        
        UIAlertView *alertView=[[UIAlertView alloc]
                                initWithTitle:@"Warning"
                                message:@"Time is up!"
                                delegate:self
                                cancelButtonTitle:@"Cancel"
                                otherButtonTitles:@"Ok", nil];
        [alertView show];
         [self.view endEditing:YES];//dissmiss keyboard when alert comes up
    }
}

//dismisses keyboard when user touches background
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    _charCounter.text = [NSString stringWithFormat:@"%d", _typingSpace.text.length];//update character count
    [self.view endEditing:YES];

}


//reset all values when reset button is pressed
- (IBAction)resetButton:(UIButton *)sender {
    [self reset];
       
}
//reset all values
-(void)reset{
    [_timer invalidate];
    seconds = 5.00;
    _timeLabel.text = @"5.00";
    _charCounter.text = @"0";
    _typingSpace.text = @"";


}
//calculate stats when Lets get serious button is pressed
- (IBAction)getStats:(UIButton *)sender {
    if(seconds==0){
        keysPerSecond = ([[NSNumber numberWithInt: _typingSpace.text.length] floatValue])/5;
        keysPerMinute= ([[NSNumber numberWithInt: _typingSpace.text.length] floatValue]*60)/5;
        caloriesBurnedPerHour = (([[NSNumber numberWithInt: _typingSpace.text.length] floatValue]*3600)/5)*(0.00000333);//not backed up by research
    
        UIAlertView *alertView=[[UIAlertView alloc]
                            initWithTitle:@"Your Stats"
                            message:[NSString stringWithFormat:@"%.2f Keys/second \n %.2f Keys/minute \n %f Calories/h",keysPerSecond,keysPerMinute,caloriesBurnedPerHour]
                            delegate:self
                            cancelButtonTitle:@"Ok"
                            otherButtonTitles:nil];
        [alertView setTag:1]; //this statement differentiates this alert 
        [alertView show];
    }
    else if(seconds == 5){
    
        UIAlertView *alertView=[[UIAlertView alloc]
                                initWithTitle:@"Warning"
                                message:[NSString stringWithFormat:@"Press Start First!"]
                                delegate:self
                                cancelButtonTitle:@"Ok"
                                otherButtonTitles:nil];
        [alertView setTag:2];//this statement differentiates this alert
        [alertView show];
    
    
    }    
}
//handles action after user clicks on alert button
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex==0 & alertView.tag==1){//Ok button 
        [self reset];
    }
    if (buttonIndex==0 & alertView.tag==2){//Ok button
        [self reset];
    }
}
@end
