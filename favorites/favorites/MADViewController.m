//
//  MADViewController.m
//  favorites
//
//  Created by Luis Alfredo Hierro on 10/10/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"
#import "Scene2ViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _user=[[Favorite alloc]init];//allocates and initializes the user object
    
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)viewWillAppear:(BOOL)animated{
    _booLabel.text=_user.favBook;
    _authorLabel.text=_user.favAuthor;

}


-(IBAction)returned:(UIStoryboardSegue*)segue{
    _booLabel.text=_user.favBook;
    _authorLabel.text=_user.favAuthor;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
