//
//  MADWebViewController.m
//  Boulderr
//
//  Created by Luis Alfredo Hierro on 10/17/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADWebViewController.h"

@interface MADWebViewController ()

@end

@implementation MADWebViewController

-(void)loadWebPageWithString:(NSString *)urlString{
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_boulderWebView loadRequest:request];


}


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
    _boulderWebView.delegate=self;
    [self loadWebPageWithString:@"http://www.bouldercolorado.gov"];
    
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [_boulderSpinner startAnimating]; //sends start animating message to spinner

}



-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [_boulderSpinner stopAnimating];



}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
