//
//  MADWebViewController.h
//  Boulderr
//
//  Created by Luis Alfredo Hierro on 10/17/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADWebViewController : UIViewController<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *boulderWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *boulderSpinner;

@end
