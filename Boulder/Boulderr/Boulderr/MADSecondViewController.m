//
//  MADSecondViewController.m
//  Boulderr
//
//  Created by Luis Alfredo Hierro on 10/17/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADSecondViewController.h"

@interface MADSecondViewController ()

@end

@implementation MADSecondViewController

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

- (IBAction)submitQuestion:(UIButton *)sender {
    //mailto syntax: mailto:first@example.com?
    // cc=second@example.com, third@example.com&subject=something&body=the body
    //Mailto parameter should be preceded by "?" for tge first or only parameter and "&" for second and subsequent parameter
    
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
    
    
    
    NSString *recipients = @"mailto:luis.hierro@colorado.edu?subject=Question from Boulder app";
    NSString *body =[NSString stringWithFormat:@"&body=%@ from %@ %@", _questionTextView.text, _nameTextField.text,_emailTextField.text];
    NSString *email =[NSString stringWithFormat:@"%@%@", recipients, body];
    NSLog(email);
    email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
             //returns a legal url string
             //opens the mail app
             [[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
    
}
@end
