//
//  MADViewController.m
//  browser_b
//
//  Created by Luis Alfredo Hierro on 9/24/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _webView.delegate=self;
    [self loadWebPageWithString:@"http://redwood.colorado.edu/apierce/mad/fall13"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

//load a new web page in the web view
-(void)loadWebPageWithString:(NSString *)urlString{
    
    NSURL *url =[NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_webView loadRequest:request];

}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{

UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"error loading web page"
                                        message:[error localizedDescription]
                                        delegate:self
                                        cancelButtonTitle:nil
                                        otherButtonTitles:@"OK",nil];

    
    [alertView show];
}
- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender {
    
    //creates action sheet
    UIActionSheet *actionSheet=[[UIActionSheet alloc]initWithTitle:nil
                                                          delegate:self
                                                 cancelButtonTitle:@"Cancel"
                                            destructiveButtonTitle:nil
                                                  otherButtonTitles:@"ATLAS", @"TAM",@"CU",nil];
    
    [actionSheet showFromToolbar:_toolBar ];
}

//UIActionSheetDelegate Method
//called when a selection is made on an action sheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger) buttonIndex{
    if(buttonIndex==0){
        [self loadWebPageWithString:@"http://atlas.colorado.edu"];
    }
    else if(buttonIndex==1){
    
        [self loadWebPageWithString:@"http://tam.colorado.edu"];
    
    }
    else if(buttonIndex==2){
        [self loadWebPageWithString:@"http://www.colorado.edu"];
    
    }
}
- (void)viewDidUnload {
    [self setSpinner:nil];
    [super viewDidUnload];
}


//UIWebViewDelegate method that is called when a web page begins to load
-(void) webViewDidStartLoad:(UIWebView *)webView{

    [_spinner startAnimating];

}
-(void) webViewDidFinishLoad:(UIWebView *)webView{

    [_spinner stopAnimating];

}
@end