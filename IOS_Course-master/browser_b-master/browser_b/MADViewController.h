//
//  MADViewController.h
//  browser_b
//
//  Created by Luis Alfredo Hierro on 9/24/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController<UIWebViewDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
- (IBAction)bookmarkItemTapped:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end
