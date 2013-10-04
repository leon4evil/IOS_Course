//
//  MADViewController.m
//  FirstHelloWorld
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

- (IBAction)hiButton:(UIButton *)sender {
    
    NSString *title = [NSString stringWithFormat:@"Hello World!"];
    _hiLabel.text=title;
    
}
@end
