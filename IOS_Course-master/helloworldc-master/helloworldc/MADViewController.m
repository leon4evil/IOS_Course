//
//  MADViewController.m
//  helloworldc
//
//  Created by Luis Alfredo Hierro on 9/11/13.
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

- (IBAction)helloButton:(UIButton *)sender {
    
    NSString *title =[sender titleForState:UIControlStateNormal];
    NSString *plainText = [NSString stringWithFormat:@"%@ world!",title];
    _worldLabel.text=plainText;
    
    
    
}
@end
