//
//  MADViewController.m
//  Beattles
//
//  Created by Luis Alfredo Hierro on 9/18/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeImage:(UISegmentedControl *)sender {
    [self updateImage];
    [self updateCaps];
}

-(void)updateImage{
    if(_imageControl.selectedSegmentIndex==0){
        _beatlesLabel.text=@"Young Beatles";
        _beatlesImage.image=[UIImage imageNamed:@"YoungBeatles.png"];
    }
    else if(_imageControl.selectedSegmentIndex==1){
        _beatlesLabel.text = @"Not so young";
        _beatlesImage.image=[UIImage imageNamed:@"NotSoYoung.png"];
    }
}

-(void)updateCaps{
    if (_capitalizedSwitch.on) {
		_beatlesLabel.text=[_beatlesLabel.text uppercaseString];
	} else {
		_beatlesLabel.text=[_beatlesLabel.text lowercaseString];
	}
    
}

- (IBAction)updateFont:(UISwitch *)sender {
    [self updateCaps];
    
}
- (IBAction)changeFontSize:(UISlider *)sender {
    //get the font size
	int fontSize = sender.value;
	// change the font size label
	_fontSizeLabel.text=[NSString stringWithFormat:@"%d", fontSize];
	// create a new font object
	UIFont *newFont = [UIFont systemFontOfSize:sender.value];
	//apply the new font to the label
	_beatlesLabel.font=newFont;
    
    
}
@end
