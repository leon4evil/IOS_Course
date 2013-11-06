//
//  CountryViewController.m
//  countriesb
//
//  Created by Luis Alfredo Hierro on 10/29/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "CountryViewController.h"

@interface CountryViewController ()

@end

@implementation CountryViewController

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
    [super viewDidLoad];

	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id) sender{
    //NSLog( @"button");
   if ([segue.identifier isEqualToString:@"doneSegue"]){
        if(_countryTextField.text.length > 0){
       //  NSLog( @"button");
        //NSLog( _countryTextField.text);
    _addedCountry=_countryTextField.text;
        }
    }
}


@end
