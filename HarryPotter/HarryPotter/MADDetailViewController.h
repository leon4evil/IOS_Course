//
//  MADDetailViewController.h
//  HarryPotter
//
//  Created by Luis Alfredo Hierro on 10/31/13.
//  Copyright (c) 2013 Luis Alfredo Hierro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
