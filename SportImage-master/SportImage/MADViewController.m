//
//  MADViewController.m
//  SportImage
//
//  Created by Luis Alfredo Hierro on 9/10/13.
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

- (IBAction)buttonPressed:(UIButton *)sender{
    if(sender.tag==1)
    {
        _sportImage.image=[UIImage imageNamed:@"lgo_mlb_colorado_rockies.png"];
        
        NSString *message = [[NSString alloc] initWithFormat:@"%@  I'm a rockiesfan too",_nameField.text];
        _messageLabel.text=message;
    }
    if(sender.tag==2)
    {
        _sportImage.image=[UIImage imageNamed:@"xghj2ef1pvufwapfkr5dnsfj2.gif"];
        NSString *message = [[NSString alloc] initWithFormat:@" The Nuggets are ok %@",_nameField.text];
        _messageLabel.text=message;
    }
}
- (IBAction)textFieldDoneEditing:(UITextField *)sender {
    [sender resignFirstResponder];
}
@end
